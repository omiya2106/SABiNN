# DeepSAC for Sleep Apnea Device
## Motivation 
Sophistication and complexity of artificial intelligence and its demand in healthcare applications have sparked our interest in developing efficient methods to design real-time biomedical systems for detection and prediction of symptoms of complex diseases or abnormalities. Sleep apnea is one of the leading causes of sudden death around the globe, particularly in neonatal infants and adults aged over 50 years and the methods of pre-screening and detecting such abnormality are still in progress. Various sensor technologies adopting artificial intelligence in detecting and predicting of sleep apnea have been developed in recent years leading to the rapid progress in biomedical research. Based on multiple literature reviews, we have developed the idea of integrating machine learning models onto hardware and designing a real-time sleep apnea detection system. By using our proposed energy efficient design technique called DeepSAC (Shift-Accumulate Based Deep Learning Hardware Model), we are introducing a compact, energy efficient, smart, and portable system capable of detecting apnea in real-time.
## Description
In this project we propose to design a feedforward neural network (FNN) model based digital signal processing circuit which is capable of detecting sleep apnea. The design-model takes in pre-processed digital data from two types of biomedical sensors: 1) single channel ECG sensor data and 2) blood oxygen saturation level: SpO2 to detect sleep apnea. Figure.1 showcases the block diagram of the overall system, and the red block indicates our targeted design element. The novelty of this design is the use of digital shifters instead of multipliers to reduce power consumption by 13x times [^1]. The proposed DeepSAC technique is a significant improvement compared to the design method introduced in [^2]. According to **Figure.1** our proposed pre-trained FNN inference module takes in digitally processed input dataset from the two sensors and results in binary output (1: sleep apnea and 0: absence of sleep apnea/normal condition). 

![System_overview](https://user-images.githubusercontent.com/48494146/137003428-c4dfb6b0-9a7f-4763-a35c-5386b0765e7b.png)
**Figure 1:** Block Level Diagram of the Proposed Sleep Apnea Detection System

The FNN model was trained using data collected from open-source ApneaECG database from PhysionetBank [^3] and a 4-hidden layer (12-8-6-4) model was developed which successfully detected apnea with over 86% accuracy shown in **Figure .2**. ReLU activation functions were used in the hidden layers and sigmoid function was used in the output layer. Full model parameters (fixed weights and biases) were extracted and used in designing the digital hardware model. A typical neural network hardware accelerator uses multiply-accumulate (MAC) operation as its neuron unit which consumes majority of the power in the design. The proposed  DeepSAC method eliminates this high-power consumption issue by replacing multipliers with shifters in creating activation functions such as sigmoid and ReLU following the structure of piece-wise linear function design and converting the model's extracted weights in binary format which resulted in a **Binary Neural Network** (BiNN) from **FNN**. For performance and power consumption analyses we designed the entire model onto field-programmable gate array to study the reports and justify the proposed low power design scheme. 

![BiNN](https://user-images.githubusercontent.com/48494146/137023989-4ae49f85-30c2-4e29-b59c-6e6b8a011a3f.png)
es.githubusercontent.com/48494146/137003428-c4dfb6b0-9a7f-4763-a35c-5386b0765e7b.png)
**Figure 2:** Grpahical representation of Binary Neural Network (BiNN) with 4-hidden layers (12-8-6-4) and their associated activation functions

## Design Goal
The goal of this project is to design the classification block of the sleep apnea detection model on CMOS integrated circuit platform and study the power consumption rate of a machine learning inspired digital circuit design. We are predicting that the power consumption rate of the IC-chip will be no larger than 50uW. Successful design, analysis and fabrication of the proposed circuit will open new doors in future development and design of low-power, smart and wearable biomedical systems.

[^1]: M. M. Hossain, O. Hassan, D. Parvin, M. Cheng and S. Kamrul, “An Optimized Hardware Implementation of Deep Learning Inference for Diabetes Prediction”, IEEE International Instrumentation and Measurement Technology Conference (I2MTC), 2021.
[^2]: A. Hazarika, A. Jain, S. Poddar and H. Rahaman, “Shift and Accumulate Convolution Processing Unit,” TENCON 2019 - 2019 IEEE Region 10 Conference (TENCON), pp. 914-919, 2019.
[^3]: Goldberger, L. Amaral, L. Glass, J. Hausdorff, P. Ivanov, C. Mark, H. E. Stanley, “PhysioBank, PhysioToolkit, and PhysioNet: Components of a new research resource for complex physiologic signals.” Circulation [Online]. 101 (23), pp. e215–e220, 2000

## Team Members
1. **Omiya Hassan**: Team Leader |
Graduate Student, Dept of EECS, University of Missouri
2. **Riley Jackson**: Member |
Undergraduate Student, Dept of EECS, University of Missouri
3. **Dilruba Parvin**: Member |
Graduate Student, Dept of EECS, University of Missouri
 
