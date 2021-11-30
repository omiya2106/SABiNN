![logo](https://user-images.githubusercontent.com/48494146/138365442-e668ef58-d1e0-4cdc-9636-65efd28d6eb1.png)
## Table of Content
1. [Project Description](https://github.com/omiya2106/DeepSAC#readme)
2. [Tensorflow Model](https://github.com/omiya2106/DeepSAC/blob/main/Tensorflow%20Model%20of%20DeepSAC)
3. [Hardware Model](https://github.com/omiya2106/DeepSAC/tree/main/Hardware%20Model)
5. [Caravel Hardening](https://github.com/omiya2106/DeepSAC/tree/main/Caravel%20Hardening)
## Motivation 
Sophistication and complexity of artificial intelligence and its demand in healthcare applications have sparked our interest in developing efficient methods to design real-time biomedical systems for detection and prediction of symptoms of complex diseases or abnormalities. Sleep apnea is one of the leading causes of sudden death around the globe, particularly in neonatal infants and adults aged over 50 years and the methods of pre-screening and detecting such abnormality are still in progress. Various sensor technologies adopting artificial intelligence in detecting and predicting of sleep apnea have been developed in recent years leading to the rapid progress in biomedical research. Based on multiple literature reviews, we have developed the idea of integrating machine learning models onto hardware and designing a real-time sleep apnea detection system. By using our proposed energy efficient design technique called DeepSAC (Shift-Accumulate Based Deep Learning Hardware Model), we are introducing a compact, energy efficient, smart, and portable system capable of detecting apnea in real-time.
## Description
In this project we propose to design a **Binary Neural Network (BiNN)** model based digital signal processing circuit which is capable of detecting sleep apnea. The design-model takes in pre-processed digital data from two types of biomedical sensors: 1) single channel ECG sensor data and 2) blood oxygen saturation level: SpO2 to detect sleep apnea. Figure.1 showcases the block diagram of the overall system, and the red block indicates our targeted design element. The novelty of this design is the use of digital shifters instead of multipliers to reduce power consumption by 13x times [^1]. The proposed DeepSAC technique is a significant improvement compared to the design method introduced in [^2]. According to **Figure.1** our proposed trained BiNN inference module takes in digitally processed input dataset from the two sensors and results in binary output (1: sleep apnea and 0: absence of sleep apnea/normal condition). 

![System_overview](https://user-images.githubusercontent.com/48494146/137003428-c4dfb6b0-9a7f-4763-a35c-5386b0765e7b.png)
**Figure 1:** Block Level Diagram of the Proposed Sleep Apnea Detection System

The FNN model was trained using data collected from open-source ApneaECG database from PhysionetBank [^3] and a 4-hidden layer (8-12-6-4) model was developed which successfully detected apnea with over 87% accuracy shown in **Figure .2**. ReLU activation functions were used in the hidden layers and sigmoid function was used in the output layer. Full model parameters (fixed weights) were extracted and used in designing the digital hardware model. A typical neural network hardware accelerator uses multiply-accumulate (MAC) operation as its neuron unit which consumes majority of the power in the design. The proposed  DeepSAC method eliminates this high-power consumption issue by replacing multipliers with shifters in creating activation functions such as sigmoid and ReLU following the structure of piece-wise linear function design and converting the model's extracted weights in binary format which resulted in a **Binary Neural Network** (BiNN) from **FNN**. For performance and power consumption analyses we designed the entire model onto field-programmable gate array to study the reports and justify the proposed low power design scheme. 

![BiNN](https://user-images.githubusercontent.com/48494146/137023989-4ae49f85-30c2-4e29-b59c-6e6b8a011a3f.png)
**Figure 2:** Graphical representation of Binary Neural Network (BiNN) with 4-hidden layers (8-12-6-4) and their associated activation functions
## schematic
The schematic of the DeepSAC_sleep module included user_project_wrapper module is shown below
![fullschematic](https://user-images.githubusercontent.com/48494146/139099032-757f9b27-a923-4f84-979f-778d6994217b.jpg)
## Layout Design
The layout design without the caravel harnessing is given below

![chip_without scale](https://user-images.githubusercontent.com/48494146/144096485-fd30af13-7d30-4c7b-ac86-519c8a44df9d.PNG)

## Specifications
| Parameter             | Value   | Unit |
| --------------------  | ------- | ---- |
| Die Area              | ~0.15   | mm^2 |
| (Cell/mm^2)/Core_util | 1116510 | ---  |
| Cell count            | 8246    | ---  |

Full Report can be found here [Final Summary Report](https://github.com/omiya2106/DeepSAC/blob/main/Caravel%20Hardening/OpenLane%20Run/final_summary_report.csv)

## Caravel Hardening
The layout design with the caravel integration (no fill)

![caravel](https://user-images.githubusercontent.com/48494146/144096590-d627ae2f-fa89-4024-abb0-84e6435c8512.PNG)


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
 
