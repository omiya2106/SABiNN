## Caravel Hardening 
We placed the DeepSAC_sleep module inside the user_project_wrapper. Below are the port connections that we are using from the wrapper for our module

**Connections**
| Module Port | user_wrapper_port | bits |
| ----------- | ----------------- | ---- |
|output class | io_out            | 1    |
|input x1     | io_in [15:0]      | 16   |
|input x2     | io_in [31:16]     | 16   |
|clk          | user_clock2       | 1    |

**Things To be done**
1. Generate tesbench following the caravel documentation 
2. Generate gds file 
3. Generate the layout 
