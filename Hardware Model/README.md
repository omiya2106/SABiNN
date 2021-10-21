## FPGA Implementation
For performance and power consumption analyses we designed the entire model onto field-programmable gate array to study the reports and justify the proposed low power design scheme. Figure. 2 showcases the IP block diagram of the complete FNN model and Table I presents the hardware utilization and the power consumption reports. The input layer takes in 9-bit integer data where the most- significant bit (MSB) is the sign bit. 

## Power Consumption


## TestBench
![test_bench](https://user-images.githubusercontent.com/48494146/138361460-82c1ef8f-0043-40ba-b6dd-05a0661ccfd8.PNG)

The testbench table is given below
| ECG Signal (R-R Interval) | Pulse Oximeter SPO2| Classification |
| ------------------------- | -------------------| -------------- |
| 100                       | 93                 |       1        |
| 97                        | 99                 |       0        |
| 101                       | 83                 |       1        |
