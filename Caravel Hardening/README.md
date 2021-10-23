## Caravel Hardening 
We placed the DeepSAC_sleep module inside the user_project_wrapper. Below are the port connections that we are using from the wrapper for our module

**Connections**
| Module Port | user_wrapper_port | bits |
| ----------- | ----------------- | ---- |
|output class | wbs_ack_o         | 1    |
|input x1     | wbs_dat_i [31:0]  | 32   |
|input x2     | wbs_adr_i [31:0]  | 32   |
|clk          | wbs_clk_i         | 1    |
|rst          | wbs_rst_i         | 1    |

## Testbench
We set the user_project_wrapper as top module and simulated the file on Xilinx platform to test if the connection works. We used the same test data that was used when implementing our DeepSAC_sleep module in FPGA
![test_branch_user_project_wrapper](https://user-images.githubusercontent.com/48494146/138511806-7dfce30e-160a-4a93-97b2-68d3406a6175.PNG)

**Things To be done**
1. Generate testbench following the caravel documentation [done]
2. Generate gds file after debugging wrapper verilog file 
3. Generate the layout 
