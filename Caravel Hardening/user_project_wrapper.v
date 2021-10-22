// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0
`timescale 1ns/ 1ps
`ifndef MPRJ_IO_PADS
`define MPRJ_IO_PADS 36
`endif

/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper #(
    parameter BITS = 32
) (
`ifdef USE_POWER_PINS
    //inout vdda1,	// User area 1 3.3V supply
    //inout vdda2,	// User area 2 3.3V supply
    //inout vssa1,	// User area 1 analog ground
    //inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    //inout [`MPRJ_IO_PADS-10:0] analog_io,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);
    
/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/

DeepSAC_sleep DP(
.class(io_out[0]),
.clk(user_clock2),
.x1(io_in[15:0]),
.x2(io_in[31:16]),
);
endmodule

module DeepSAC_sleep #(
parameter BITS = 16)
(
output class,
input clk,
input [15:0] x1,
input [15:0] x2
);

// Signals for Layer 1
wire [15:0] x1c, x2c;
wire Ca_L1_o1, Ca_L1_o2, Ca_L1_o3, Ca_L1_o4, Ca_L1_o5, Ca_L1_o6, Ca_L1_o7, Ca_L1_o8;
wire Ca_L2_o1, Ca_L2_o2, Ca_L2_o3, Ca_L2_o4, Ca_L2_o5, Ca_L2_o6, Ca_L2_o7, Ca_L2_o8, Ca_L2_o9, Ca_L2_o10, Ca_L2_o11, Ca_L2_o12;
wire [15:0] AB_L1_o1, AB_L1_o2, AB_L1_o3, AB_L1_o4, AB_L1_o5, AB_L1_o6, AB_L1_o7, AB_L1_o8;
wire [15:0] y1, y2, y3, y4, y5, y6, y7, y8;
    
    // Signals for Layer 2
    
    
wire [15:0] y1c, y2c, y3c, y4c, y5c, y6c, y7c, y8c ;
wire [15:0] AB_L2_o1, AB_L2_o2, AB_L2_o3, AB_L2_o4, AB_L2_o5, AB_L2_o6, AB_L2_o7, AB_L2_o8,AB_L2_o9, AB_L2_o10, AB_L2_o11, AB_L2_o12 ;
    
wire Ca_L2_1_12, Ca_L2_1_34, Ca_L2_1_56, Ca_L2_1_78, Ca_L2_1_1234, Ca_L2_1_5678 ; 
wire [15:0] AB_L2_1_12, AB_L2_1_34, AB_L2_1_56, AB_L2_1_78, AB_L2_1_1234, AB_L2_1_5678 ;
    
wire Ca_L2_2_12, Ca_L2_2_34, Ca_L2_2_56, Ca_L2_2_78, Ca_L2_2_1234, Ca_L2_2_5678 ; 
wire [15:0] AB_L2_2_12, AB_L2_2_34, AB_L2_2_56, AB_L2_2_78, AB_L2_2_1234, AB_L2_2_5678 ;
    
wire Ca_L2_3_12, Ca_L2_3_34, Ca_L2_3_56, Ca_L2_3_78, Ca_L2_3_1234, Ca_L2_3_5678 ; 
wire [15:0] AB_L2_3_12, AB_L2_3_34, AB_L2_3_56, AB_L2_3_78, AB_L2_3_1234, AB_L2_3_5678 ;
    
wire Ca_L2_4_12, Ca_L2_4_34, Ca_L2_4_56, Ca_L2_4_78, Ca_L2_4_1234, Ca_L2_4_5678 ; 
wire [15:0] AB_L2_4_12, AB_L2_4_34, AB_L2_4_56, AB_L2_4_78, AB_L2_4_1234, AB_L2_4_5678 ;
    
wire Ca_L2_5_12, Ca_L2_5_34, Ca_L2_5_56, Ca_L2_5_78, Ca_L2_5_1234, Ca_L2_5_5678 ; 
wire [15:0] AB_L2_5_12, AB_L2_5_34, AB_L2_5_56, AB_L2_5_78, AB_L2_5_1234, AB_L2_5_5678 ;
    
wire Ca_L2_6_12, Ca_L2_6_34, Ca_L2_6_56, Ca_L2_6_78, Ca_L2_6_1234, Ca_L2_6_5678 ; 
wire [15:0] AB_L2_6_12, AB_L2_6_34, AB_L2_6_56, AB_L2_6_78, AB_L2_6_1234, AB_L2_6_5678 ;
    
wire Ca_L2_7_12, Ca_L2_7_34, Ca_L2_7_56, Ca_L2_7_78, Ca_L2_7_1234, Ca_L2_7_5678 ; 
wire [15:0] AB_L2_7_12, AB_L2_7_34, AB_L2_7_56, AB_L2_7_78, AB_L2_7_1234, AB_L2_7_5678 ;
    
wire Ca_L2_8_12, Ca_L2_8_34, Ca_L2_8_56, Ca_L2_8_78, Ca_L2_8_1234, Ca_L2_8_5678 ; 
wire [15:0] AB_L2_8_12, AB_L2_8_34, AB_L2_8_56, AB_L2_8_78, AB_L2_8_1234, AB_L2_8_5678 ;
    
wire Ca_L2_9_12, Ca_L2_9_34, Ca_L2_9_56, Ca_L2_9_78, Ca_L2_9_1234, Ca_L2_9_5678 ; 
wire [15:0] AB_L2_9_12, AB_L2_9_34, AB_L2_9_56, AB_L2_9_78, AB_L2_9_1234, AB_L2_9_5678 ;
    
wire Ca_L2_10_12, Ca_L2_10_34, Ca_L2_10_56, Ca_L2_10_78, Ca_L2_10_1234, Ca_L2_10_5678 ; 
wire [15:0] AB_L2_10_12, AB_L2_10_34, AB_L2_10_56, AB_L2_10_78, AB_L2_10_1234, AB_L2_10_5678 ;
    
wire Ca_L2_11_12, Ca_L2_11_34, Ca_L2_11_56, Ca_L2_11_78, Ca_L2_11_1234, Ca_L2_11_5678 ; 
wire [15:0] AB_L2_11_12, AB_L2_11_34, AB_L2_11_56, AB_L2_11_78, AB_L2_11_1234, AB_L2_11_5678 ;
    
wire Ca_L2_12_12, Ca_L2_12_34, Ca_L2_12_56, Ca_L2_12_78, Ca_L2_12_1234, Ca_L2_12_5678 ; 
wire [15:0] AB_L2_12_12, AB_L2_12_34, AB_L2_12_56, AB_L2_12_78, AB_L2_12_1234, AB_L2_12_5678 ; 
  
//layer 3 connections
wire [15:0] n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12;
wire [15:0] n1c,n2c,n3c,n4c,n5c,n6c,n7c,n8c,n9c,n10c,n11c,n12c;

wire co112, co123,co134,co145,co156,co167,co178,co189, co1910,co11011,co1112;
wire [15:0] s131,s132,s133,s134,s145,s156,s167,s178,s189,s1910,s11011;

wire co212, co223,co234,co245,co256,co267,co278,co289,co2910,co21011,co21112;
wire [15:0] s231,s232,s233,s234,s245,s256,s267,s278,s289,s2910,s21011;

wire co312, co323,co334,co345,co356,co367,co378,co389,co3910,co31011,co31112;
wire [15:0] s331,s332,s333,s334,s345,s356,s367,s378,s389,s3910,s31011;

wire co412, co423,co434,co445,co456,co467,co478,co489,co4910,co41011,co41112;
wire [15:0] s431,s432,s433,s434,s445,s456,s467,s478,s489,s4910,s41011;

wire co512, co523,co534,co545,co556,co567,co578,co589,co5910,co51011,co51112;
wire [15:0] s531,s532,s533,s534,s545,s556,s567,s578,s589,s5910,s51011;

wire co612, co623,co634,co645,co656,co667,co678,co689,co6910,co61011,co61112;
wire [15:0] s631,s632,s633,s634,s645,s656,s667,s678,s689,s6910,s61011;

// layer 4 connections
wire[15:0] y31,y32,y33,y34,y35,y36;
wire[15:0] y31c,y32c,y33c,y34c,y35c,y36c;

wire co6112, co6123,co6134,co6145,co6156;
wire [15:0] s6131,s6132,s6133,s6134,s6145;

wire co6212, co6223,co6234,co6245,co6256;
wire [15:0] s6231,s6232,s6233,s6234,s6245;

wire co6312, co6323,co6334,co6345,co6356;
wire [15:0] s6331,s6332,s6333,s6334,s6345;

wire co6412, co6423,co6434,co6445,co6456;
wire [15:0] s6431,s6432,s6433,s6434,s6445;


//output layer connection
wire[15:0] y41,y42,y43,y44;

wire co012, co023,co034;
wire [15:0] s01,s02,s03;
wire [15:0] sig_out; 
    
    //----------------------------------------- Hidden Layer1----------------------------------
    // Layer 1 Complements
complement_rejfdb CP_L1_x1 (x1, x1c);
complement_rejfdb CP_L1_x2 (x2, x2c);
    
    
    // Layer 1 Adders
clockadder_rejfdb CA_L1_1(Ca_L1_o1, AB_L1_o1, x1c, x2c, 1'b0);
clockadder_rejfdb CA_L1_2(Ca_L1_o2, AB_L1_o2, x1c, x2c, 1'b0);
clockadder_rejfdb CA_L1_3(Ca_L1_o3, AB_L1_o3, x1, x2c, 1'b0); 
clockadder_rejfdb CA_L1_4(Ca_L1_o4, AB_L1_o4, x1c, x2, 1'b0); 
clockadder_rejfdb CA_L1_5(Ca_L1_o5, AB_L1_o5, x1c, x2, 1'b0); 
clockadder_rejfdb CA_L1_6(Ca_L1_o6, AB_L1_o6, x1c, x2c, 1'b0);
clockadder_rejfdb CA_L1_7(Ca_L1_o7, AB_L1_o7, x1c, x2, 1'b0);  
clockadder_rejfdb CA_L1_8(Ca_L1_o8, AB_L1_o8, x1c, x2, 1'b0); 
    
    // Layer 1 Activation Function
relu16 RE_L1_o1(AB_L1_o1, y1);
relu16 RE_L1_o2(AB_L1_o2, y2);
relu16 RE_L1_o3(AB_L1_o3, y3);
relu16 RE_L1_o4(AB_L1_o4, y4);
relu16 RE_L1_o5(AB_L1_o5, y5);
relu16 RE_L1_o6(AB_L1_o6, y6);
relu16 RE_L1_o7(AB_L1_o7, y7);
relu16 RE_L1_o8(AB_L1_o8, y8);

    //----------------------------------------- Hidden Layer2----------------------------------
    // Layer 2 Complements
complement_rejfdb CP_L2_y1 (y1, y1c);
complement_rejfdb CP_L2_y2 (y2, y2c);
complement_rejfdb CP_L2_y3 (y3, y3c);
complement_rejfdb CP_L2_y4 (y4, y4c);
complement_rejfdb CP_L2_y5 (y5, y5c);
complement_rejfdb CP_L2_y6 (y6, y6c);
complement_rejfdb CP_L2_y7 (y7, y7c);
complement_rejfdb CP_L2_y8 (y8, y8c);
    
    // Layer 2 Adders
    
    // Neuron 1
clockadder_rejfdb CA_L2_11(Ca_L2_1_12, AB_L2_1_12, y1, y2c, "0");
clockadder_rejfdb CA_L2_12(Ca_L2_1_34, AB_L2_1_34, y3, y4c, "0");
clockadder_rejfdb CA_L2_13_56(Ca_L2_1_56, AB_L2_1_56, y5c, y6, "0");
clockadder_rejfdb CA_L2_14_78(Ca_L2_1_78, AB_L2_1_78, y7, y8c, "0");
    
clockadder_rejfdb CA_L2_15(Ca_L2_1_1234, AB_L2_1_1234, AB_L2_1_12, AB_L2_1_34, "0");
clockadder_rejfdb CA_L2_16(Ca_L2_1_5678, AB_L2_1_5678, AB_L2_1_56, AB_L2_1_78, "0");
clockadder_rejfdb CA_L2_17(Ca_L2_o1, AB_L2_o1, AB_L2_1_1234, AB_L2_1_5678, "0");
    
    // Neuron 2
clockadder_rejfdb CA_L2_21(Ca_L2_2_12, AB_L2_2_12, y1, y2c, "0");
clockadder_rejfdb CA_L2_22(Ca_L2_2_34, AB_L2_2_34, y3c, y4c, "0");
clockadder_rejfdb CA_L2_23(Ca_L2_2_56, AB_L2_2_56, y5, y6c, "0");  
clockadder_rejfdb CA_L2_24(Ca_L2_2_78, AB_L2_2_78, y7, y8, "0");
    
clockadder_rejfdb CA_L2_25(Ca_L2_2_1234, AB_L2_2_1234, AB_L2_2_12, AB_L2_2_34, "0");
clockadder_rejfdb CA_L2_26(Ca_L2_2_5678, AB_L2_2_5678, AB_L2_2_56, AB_L2_2_78, "0");
clockadder_rejfdb CA_L2_27(Ca_L2_o2, AB_L2_o2, AB_L2_2_1234, AB_L2_2_5678, "0");
    
    // Neuron 3
clockadder_rejfdb CA_L2_31(Ca_L2_3_12, AB_L2_3_12, y1, y2c, "0");
clockadder_rejfdb CA_L2_32(Ca_L2_3_34, AB_L2_3_34, y3, y4c, "0");
clockadder_rejfdb CA_L2_33(Ca_L2_3_56, AB_L2_3_56, y5c, y6, "0");  
clockadder_rejfdb CA_L2_34(Ca_L2_3_78, AB_L2_3_78, y7c, y8c, "0");
    
clockadder_rejfdb CA_L2_35(Ca_L2_3_1234, AB_L2_3_1234, AB_L2_3_12, AB_L2_3_34, "0");
clockadder_rejfdb CA_L2_36(Ca_L2_3_5678, AB_L2_3_5678, AB_L2_3_56, AB_L2_3_78, "0");
clockadder_rejfdb CA_L2_37(Ca_L2_o3, AB_L2_o3, AB_L2_3_1234, AB_L2_3_5678, "0");
    
    // Neuron 4
clockadder_rejfdb CA_L2_41(Ca_L2_4_12, AB_L2_4_12, y1, y2c, "0");   
clockadder_rejfdb CA_L2_42(Ca_L2_4_34, AB_L2_4_34, y3c, y4c, "0");    
clockadder_rejfdb CA_L2_43(Ca_L2_4_56, AB_L2_4_56, y5, y6, "0");    
clockadder_rejfdb CA_L2_44(Ca_L2_4_78, AB_L2_4_78, y7, y8, "0");
    
clockadder_rejfdb CA_L2_45(Ca_L2_4_1234, AB_L2_4_1234, AB_L2_4_12, AB_L2_4_34, "0");    
clockadder_rejfdb CA_L2_46(Ca_L2_4_5678, AB_L2_4_5678, AB_L2_4_56, AB_L2_4_78, "0");    
clockadder_rejfdb CA_L2_47(Ca_L2_o4, AB_L2_o4, AB_L2_4_1234, AB_L2_4_5678, "0");
    
    // Neuron 5
clockadder_rejfdb CA_L2_51(Ca_L2_5_12, AB_L2_5_12, y1, y2, "0"); 
clockadder_rejfdb CA_L2_52(Ca_L2_5_34, AB_L2_5_34, y3, y4, "0");   
clockadder_rejfdb CA_L2_53(Ca_L2_5_56, AB_L2_5_56, y5c, y6, "0");      
clockadder_rejfdb CA_L2_54(Ca_L2_5_78, AB_L2_5_78, y7c, y8c, "0");
    
clockadder_rejfdb CA_L2_55(Ca_L2_5_1234, AB_L2_5_1234, AB_L2_5_12, AB_L2_5_34, "0");    
clockadder_rejfdb CA_L2_56(Ca_L2_5_5678, AB_L2_5_5678, AB_L2_5_56, AB_L2_5_78, "0");    
clockadder_rejfdb CA_L2_57(Ca_L2_o5, AB_L2_o5, AB_L2_5_1234, AB_L2_5_5678, "0");
    
    // Neuron 6
clockadder_rejfdb CA_L2_61(Ca_L2_6_12, AB_L2_6_12, y1c, y2, "0"); 
clockadder_rejfdb CA_L2_62(Ca_L2_6_34, AB_L2_6_34, y3, y4, "0");   
clockadder_rejfdb CA_L2_63(Ca_L2_6_56, AB_L2_6_56, y5c, y6c, "0");      
clockadder_rejfdb CA_L2_64(Ca_L2_6_78, AB_L2_6_78, y7c, y8, "0");
    
clockadder_rejfdb CA_L2_65(Ca_L2_6_1234, AB_L2_6_1234, AB_L2_6_12, AB_L2_6_34, "0");    
clockadder_rejfdb CA_L2_66(Ca_L2_6_5678, AB_L2_6_5678, AB_L2_6_56, AB_L2_6_78, "0");    
clockadder_rejfdb CA_L2_67(Ca_L2_o6, AB_L2_o6, AB_L2_6_1234, AB_L2_6_5678, "0");
    
    // Neuron 7
clockadder_rejfdb CA_L2_71(Ca_L2_7_12, AB_L2_7_12, y1c, y2, "0"); 
clockadder_rejfdb CA_L2_72(Ca_L2_7_34, AB_L2_7_34, y3c, y4c, "0");   
clockadder_rejfdb CA_L2_73(Ca_L2_7_56, AB_L2_7_56, y5, y6c, "0");      
clockadder_rejfdb CA_L2_74(Ca_L2_7_78, AB_L2_7_78, y7c, y8, "0");
    
clockadder_rejfdb CA_L2_75(Ca_L2_7_1234, AB_L2_7_1234, AB_L2_7_12, AB_L2_7_34, "0");    
clockadder_rejfdb CA_L2_76(Ca_L2_7_5678, AB_L2_7_5678, AB_L2_7_56, AB_L2_7_78, "0");    
clockadder_rejfdb CA_L2_77(Ca_L2_o7, AB_L2_o7, AB_L2_7_1234, AB_L2_7_5678, "0");
    
    // Neuron 8
clockadder_rejfdb CA_L2_81_12(Ca_L2_8_12, AB_L2_8_12, y1c, y2c, "0"); 
clockadder_rejfdb CA_L2_82_34(Ca_L2_8_34, AB_L2_8_34, y3c, y4, "0");   
clockadder_rejfdb CA_L2_83_56(Ca_L2_8_56, AB_L2_8_56, y5, y6, "0");      
clockadder_rejfdb CA_L2_84_78(Ca_L2_8_78, AB_L2_8_78, y7, y8, "0");
    
clockadder_rejfdb CA_L2_85(Ca_L2_8_1234, AB_L2_8_1234, AB_L2_8_12, AB_L2_8_34, "0");    
clockadder_rejfdb CA_L2_86(Ca_L2_8_5678, AB_L2_8_5678, AB_L2_8_56, AB_L2_8_78, "0");    
clockadder_rejfdb CA_L2_87(Ca_L2_o8, AB_L2_o8, AB_L2_8_1234, AB_L2_8_5678, "0");
    
    // Neuron 9
clockadder_rejfdb CA_L2_91(Ca_L2_9_12, AB_L2_9_12, y1, y2, "0"); 
clockadder_rejfdb CA_L2_92(Ca_L2_9_34, AB_L2_9_34, y3, y4, "0");   
clockadder_rejfdb CA_L2_93(Ca_L2_9_56, AB_L2_9_56, y5c, y6c, "0");      
clockadder_rejfdb CA_L2_94(Ca_L2_9_78, AB_L2_9_78, y7, y8, "0");
    
clockadder_rejfdb CA_L2_95(Ca_L2_9_1234, AB_L2_9_1234, AB_L2_9_12, AB_L2_9_34, "0");    
clockadder_rejfdb CA_L2_96(Ca_L2_9_5678, AB_L2_9_5678, AB_L2_9_56, AB_L2_9_78, "0");    
clockadder_rejfdb CA_L2_97(Ca_L2_o9, AB_L2_o9, AB_L2_9_1234, AB_L2_9_5678, "0");
    
    // Neuron 10
clockadder_rejfdb CA_L2_101(Ca_L2_10_12, AB_L2_10_12, y1, y2, "0"); 
clockadder_rejfdb CA_L2_102(Ca_L2_10_34, AB_L2_10_34, y3, y4, "0");   
clockadder_rejfdb CA_L2_103(Ca_L2_10_56, AB_L2_10_56, y5c, y6, "0");
clockadder_rejfdb CA_L2_104(Ca_L2_10_78, AB_L2_10_78, y7c, y8c, "0");
    
clockadder_rejfdb CA_L2_105(Ca_L2_10_1234, AB_L2_10_1234, AB_L2_10_12, AB_L2_10_34, "0");    
clockadder_rejfdb CA_L2_106(Ca_L2_10_5678, AB_L2_10_5678, AB_L2_10_56, AB_L2_10_78, "0");    
clockadder_rejfdb CA_L2_107(Ca_L2_o10, AB_L2_o10, AB_L2_10_1234, AB_L2_10_5678, "0");
    
// Neuron 11
clockadder_rejfdb CA_L2_111(Ca_L2_11_12, AB_L2_11_12, y1, y2c, "0"); 
clockadder_rejfdb CA_L2_112(Ca_L2_11_34, AB_L2_11_34, y3c, y4, "0");   
clockadder_rejfdb CA_L2_113(Ca_L2_11_56, AB_L2_11_56, y5c, y6c, "0");      
clockadder_rejfdb CA_L2_114(Ca_L2_11_78, AB_L2_11_78, y7, y8, "0");
    
clockadder_rejfdb CA_L2_115(Ca_L2_11_1234, AB_L2_11_1234, AB_L2_11_12, AB_L2_11_34, "0");    
clockadder_rejfdb CA_L2_116(Ca_L2_11_5678, AB_L2_11_5678, AB_L2_11_56, AB_L2_11_78, "0");    
clockadder_rejfdb CA_L2_117(Ca_L2_o11, AB_L2_o11, AB_L2_11_1234, AB_L2_11_5678, "0");
    
// Neuron 12
clockadder_rejfdb CA_L2_121(Ca_L2_12_12, AB_L2_12_12, y1, y2, "0"); 
clockadder_rejfdb CA_L2_122(Ca_L2_12_34, AB_L2_12_34, y3, y4c, "0");   
clockadder_rejfdb CA_L2_123(Ca_L2_12_56, AB_L2_12_56, y5c, y6, "0");      
clockadder_rejfdb CA_L2_124(Ca_L2_12_78, AB_L2_12_78, y7, y8, "0");
    
clockadder_rejfdb CA_L2_125(Ca_L2_12_1234, AB_L2_12_1234, AB_L2_12_12, AB_L2_12_34, "0");    
clockadder_rejfdb CA_L2_126(Ca_L2_12_5678, AB_L2_12_5678, AB_L2_12_56, AB_L2_12_78, "0");    
clockadder_rejfdb CA_L2_127(Ca_L2_o12, AB_L2_o12, AB_L2_12_1234, AB_L2_12_5678, "0");

   
// Layer 2 Activation Function
relu16 RE_L2_o1(AB_L2_o1, n1);
relu16 RE_L2_o2(AB_L2_o2, n2);
relu16 RE_L2_o3(AB_L2_o3, n3);
relu16 RE_L2_o4(AB_L2_o4, n4);
relu16 RE_L2_o5(AB_L2_o5, n5);
relu16 RE_L2_o6(AB_L2_o6, n6);
relu16 RE_L2_o7(AB_L2_o7, n7);
relu16 RE_L2_o8(AB_L2_o8, n8);
relu16 RE_L2_o9(AB_L2_o9, n9);
relu16 RE_L2_o10(AB_L2_o10, n10);
relu16 RE_L2_o11(AB_L2_o11, n11);
relu16 RE_L2_o12(AB_L2_o12, n12);

//----------------------------------------- Hidden Layer3----------------------------------
//compliment the 12 inputs    
complement_rejfdb CP_L3_n1 (n1, n1c);
complement_rejfdb CP_L3_n2 (n2, n2c);
complement_rejfdb CP_L3_n3 (n3, n3c);
complement_rejfdb CP_L3_n4 (n4, n4c);
complement_rejfdb CP_L3_n5 (n5, n5c);
complement_rejfdb CP_L3_n6 (n6, n6c);
complement_rejfdb CP_L3_n7 (n7, n7c);
complement_rejfdb CP_L3_n8 (n8, n8c);
complement_rejfdb CP_L3_n9 (n9, n9c);
complement_rejfdb CP_L3_n10 (n10, n10c);
complement_rejfdb CP_L3_n11 (n11, n11c);
complement_rejfdb CP_L3_n12 (n12, n12c);

//layer 3
//Neuron1
clockadder_rejfdb CA_L3_6_11(co112, s131, n1c, n2c, "0"); 
clockadder_rejfdb CA_L3_6_12(co123, s132, s131, n3, "0"); 
clockadder_rejfdb CA_L3_6_13(co134, s133, s132, n4c, "0"); 
clockadder_rejfdb CA_L3_6_14(co145, s134, s133, n5c, "0");
clockadder_rejfdb CA_L3_6_15(co156, s145, s134, n6, "0");
clockadder_rejfdb CA_L3_6_16(co167, s156, s145, n7c, "0");
clockadder_rejfdb CA_L3_6_17(co178, s167, s156, n8c, "0");
clockadder_rejfdb CA_L3_6_18(co189, s178, s167, n9, "0");
clockadder_rejfdb CA_L3_6_19(co1910,s189, s178, n10, "0");
clockadder_rejfdb CA_L3_6_110(co11011,s1910, s189, n11, "0");
clockadder_rejfdb CA_L3_6_111(co1112, s11011, s1910, n12, "0");   

//Neuron 2
clockadder_rejfdb CA_L3_6_21(co212, s231, n1c, n2, "0"); 
clockadder_rejfdb CA_L3_6_22(co223, s232, s231, n3, "0"); 
clockadder_rejfdb CA_L3_6_23(co234, s233, s232, n4c, "0"); 
clockadder_rejfdb CA_L3_6_24(co245, s234, s233, n5c, "0");
clockadder_rejfdb CA_L3_6_25(co256, s245, s234, n6, "0");
clockadder_rejfdb CA_L3_6_26(co267, s256, s245, n7c, "0");
clockadder_rejfdb CA_L3_6_27(co278, s267, s256, n8c, "0");
clockadder_rejfdb CA_L3_6_28(co289, s278, s267, n9, "0");
clockadder_rejfdb CA_L3_6_29(co2910,s289, s278, n10, "0");
clockadder_rejfdb CA_L3_6_210(co21011,s2910, s289, n11, "0");
clockadder_rejfdb CA_L3_6_211(co21112, s21011, s2910, n12, "0");   

//Neuron3
clockadder_rejfdb CA_L3_6_31(co312, s331, n1c, n2, "0"); 
clockadder_rejfdb CA_L3_6_32(co323, s332, s331, n3c, "0"); 
clockadder_rejfdb CA_L3_6_33(co334, s333, s332, n4c, "0"); 
clockadder_rejfdb CA_L3_6_34(co345, s334, s333, n5, "0");
clockadder_rejfdb CA_L3_6_35(co356, s345, s334, n6c, "0");
clockadder_rejfdb CA_L3_6_36(co367, s356, s345, n7c, "0");
clockadder_rejfdb CA_L3_6_37(co378, s367, s356, n8, "0");
clockadder_rejfdb CA_L3_6_38(co389, s378, s367, n9, "0");
clockadder_rejfdb CA_L3_6_39(co3910,s389, s378, n10c, "0");
clockadder_rejfdb CA_L3_6_310(co31011,s3910, s389, n11, "0");
clockadder_rejfdb CA_L3_6_311(co31112, s31011, s3910, n12c, "0"); 

//Neuron4
clockadder_rejfdb CA_L3_6_41(co412, s431, n1, n2c, "0"); 
clockadder_rejfdb CA_L3_6_42(co423, s432, s431, n3, "0"); 
clockadder_rejfdb CA_L3_6_43(co434, s433, s432, n4, "0"); 
clockadder_rejfdb CA_L3_6_44(co445, s434, s433, n5, "0");
clockadder_rejfdb CA_L3_6_45(co456, s445, s434, n6c, "0");
clockadder_rejfdb CA_L3_6_46(co467, s456, s445, n7, "0");
clockadder_rejfdb CA_L3_6_47(co478, s467, s456, n8, "0");
clockadder_rejfdb CA_L3_6_48(co489, s478, s467, n9, "0");
clockadder_rejfdb CA_L3_6_49(co4910,s489, s478, n10c, "0");
clockadder_rejfdb CA_L3_6_410(co41011,s4910, s489, n11c, "0");
clockadder_rejfdb CA_L3_6_411(co41112, s41011, s4910, n12c, "0"); 

//Neuron5
clockadder_rejfdb CA_L3_6_51(co512, s531, n1c, n2c, "0"); 
clockadder_rejfdb CA_L3_6_52(co523, s532, s531, n3c, "0"); 
clockadder_rejfdb CA_L3_6_53(co534, s533, s532, n4, "0"); 
clockadder_rejfdb CA_L3_6_54(co545, s534, s533, n5, "0");
clockadder_rejfdb CA_L3_6_55(co556, s545, s534, n6, "0");
clockadder_rejfdb CA_L3_6_56(co567, s556, s545, n7, "0");
clockadder_rejfdb CA_L3_6_57(co578, s567, s556, n8c, "0");
clockadder_rejfdb CA_L3_6_58(co589, s578, s567, n9, "0");
clockadder_rejfdb CA_L3_6_59(co5910,s589, s578, n10, "0");
clockadder_rejfdb CA_L3_6_510(co51011,s5910, s589, n11, "0");
clockadder_rejfdb CA_L3_6_511(co51112, s51011, s5910, n12, "0"); 

//Neuron6
clockadder_rejfdb CA_L3_6_61(co612, s631, n1c, n2c, "0"); 
clockadder_rejfdb CA_L3_6_62(co623, s632, s631, n3, "0"); 
clockadder_rejfdb CA_L3_6_63(co634, s633, s632, n4, "0"); 
clockadder_rejfdb CA_L3_6_64(co645, s634, s633, n5c, "0");
clockadder_rejfdb CA_L3_6_65(co656, s645, s634, n6c, "0");
clockadder_rejfdb CA_L3_6_66(co667, s656, s645, n7, "0");
clockadder_rejfdb CA_L3_6_67(co678, s667, s656, n8, "0");
clockadder_rejfdb CA_L3_6_68(co689, s678, s667, n9c, "0");
clockadder_rejfdb CA_L3_6_69(co6910,s689, s678, n10c, "0");
clockadder_rejfdb CA_L3_6_610(co61011,s6910, s689, n11, "0");
clockadder_rejfdb CA_L3_6_611(co61112, s61011, s6910, n12, "0");

//relu out
relu16 RE_L3_o1(s11011, y31);
relu16 RE_L3_o2(s21011, y32);
relu16 RE_L3_o3(s31011, y33);
relu16 RE_L3_o4(s41011, y34);
relu16 RE_L3_o5(s51011, y35);
relu16 RE_L3_o6(s61011, y36);

//----------------------------------------- Hidden Layer 4----------------------------------
//compliment the 6 input
complement_rejfdb CP_L4_n1 (y31, y31c);
complement_rejfdb CP_L4_n2 (y32, y32c);
complement_rejfdb CP_L4_n3 (y33, y33c);
complement_rejfdb CP_L4_n4 (y34, y34c);
complement_rejfdb CP_L4_n5 (y35, y35c);
complement_rejfdb CP_L4_n6 (y36, y36c);

//Neuron 1
clockadder_rejfdb CA_L3_4_11(co6112, s6131, y31c, y32c, "0"); 
clockadder_rejfdb CA_L3_4_12(co6123, s6132, s6131, y33c, "0"); 
clockadder_rejfdb CA_L3_4_13(co6134, s6133, s6132, y34c, "0"); 
clockadder_rejfdb CA_L3_4_14(co6145, s6134, s6133, y35c, "0");
clockadder_rejfdb CA_L3_4_15(co6156, s6145, s6134, y36c, "0");

//Neuron 2
clockadder_rejfdb CA_L3_4_21(co6212, s6231, y31c, y32c, "0"); 
clockadder_rejfdb CA_L3_4_22(co6223, s6232, s6231, y33c, "0"); 
clockadder_rejfdb CA_L3_4_23(co6234, s6233, s6232, y34c, "0"); 
clockadder_rejfdb CA_L3_4_24(co6245, s6234, s6233, y35c, "0");
clockadder_rejfdb CA_L3_4_25(co6256, s6245, s6234, y36c, "0");

//Neuron3
clockadder_rejfdb CA_L3_4_31(co6312, s6331, y31, y32, "0"); 
clockadder_rejfdb CA_L3_4_32(co6323, s6332, s6331, y33c, "0"); 
clockadder_rejfdb CA_L3_4_33(co6334, s6333, s6332, y34c, "0"); 
clockadder_rejfdb CA_L3_4_34(co6345, s6334, s6333, y35, "0");
clockadder_rejfdb CA_L3_4_35(co6356, s6345, s6334, y36c, "0");

//Neuron4
clockadder_rejfdb CA_L3_4_41(co6412, s6431, y31, y32, "0"); 
clockadder_rejfdb CA_L3_4_42(co6423, s6432, s6431, y33c, "0"); 
clockadder_rejfdb CA_L3_4_43(co6434, s6433, s6432, y34c, "0"); 
clockadder_rejfdb CA_L3_4_44(co6445, s6434, s6433, y35, "0");
clockadder_rejfdb CA_L3_4_45(co6456, s6445, s6434, y36c, "0");

//relu out
relu16 RE_L4_o1(s6145, y41);
relu16 RE_L4_o2(s6245, y42);
relu16 RE_L4_o3(s6345, y43);
relu16 RE_L4_o4(s6445, y44);

//----------------------------------------- output Layer----------------------------------

//Neuron1
clockadder_rejfdb CA_L3_out_41(co012, s01, y41, y42, "0"); 
clockadder_rejfdb CA_L3_out_42(co023, s02, s01, y43, "0"); 
clockadder_rejfdb CA_L3_out_43(co034, s03, s02, y44, "0"); 

//sigmoid out
sigmoid_ohbk4 SIG_L_out(sig_out, clk, s03);

//decision
convert16_to_1 conv16(sig_out, class);

endmodule

//sigmoid function
module sigmoid_ohbk4(sig, clk, x);
input [15:0] x; 
input clk;
output[15:0] sig;
wire [1:0] s;
wire [15:0] x1,x2,x3;
wire [15:0] c1,c2;
wire co;

begin
shiftback2bit S2(x1, x, clk);
shiftback3bit S3(x2, x, clk);
shiftback5bit S5(x3, x, clk);
ifstatement IS(x, s);
compare comp(s,x1,x2,x3,c1);
compare2 comp2(s, c2);
clockadder_rejfdb ad(co, sig, c1, c2, "0");
end

endmodule

// 5bit shifter

module shiftback5bit( 
dout,
din, 
clk 
);
output reg [15:0] dout;
input [15:0] din; 
input clk;
always @(posedge clk)
begin
dout[10:0] <= din[15:5];
dout[15:11] <= 5'b00000;
end 

endmodule

// 2bit shifter
module shiftback2bit( 
dout,
din, 
clk 
);
output reg [15:0] dout;
input [15:0] din; 
input  clk;
always @(posedge clk)
begin
dout[13:0] <= din[15:2];
dout [15:14] <= 2'b00;
end 
endmodule

// 3bit shifter
module shiftback3bit( 
dout,
din, 
clk 
);

output reg [15:0] dout;
input [15:0] din; 
input clk;
always @(posedge clk)
begin
dout[12:0] <= din[15:3];
dout[15:13] <= 3'b000;
end 

endmodule

//compare module
module compare(
s, x1, x2, x3, y
    );
input [1:0] s;
input [15:0] x1,x2,x3;
output reg[15:0] y;


always @(s,x1,x2,x3)
begin
case(s)
2'b00: y = x1; //2bit shifter
2'b01: y = x2; //3bit shifter
2'b10: y = x3; //5bit shifter
default: y = 0;
endcase
end
endmodule

//2nd compare
module compare2(s, y);

input [1:0] s;
output reg [15:0] y;
always @(s)
begin
case(s)
2'b00: y = 16'b0000001000000000; //2bit shifter
2'b01: y = 16'b0000001010000000; //3bit shifter
2'b10: y = 16'b0000001101100000; //5bit shifter
2'b11: y = 16'b0000010000000000; //direct 1024
default: y = 0;
endcase
end
endmodule

// if-statement
module ifstatement(x,y);

input [15:0] x;
output reg [1:0] y;

always @(x)
if (x > 16'b000000000000000 &&  x< 16'b0000010000000000) y <= 2'b00 ;
else if (x == 16'b0000000000000000) y <= 2'b00 ; 
else if (x > 16'b0000010000000000 &&  x< 16'b0000100110000000) y <= 2'b01 ;
else if (x > 16'b0000100110000000 &&  x< 16'b0001010000000000) y <= 2'b10 ;
else if (x > 16'b0001010000000000) y <= 2'b11 ;

endmodule

//adder 16 bit
module clockadder_rejfdb(
    output cout,
    output [15:0]s,
    input [15:0]a,
    input [15:0]b,
    input cin
    );
    
wire [15:0] bin;
    assign bin[0]=b[0]^cin;
    assign bin[1]=b[1]^cin;
    assign bin[2]=b[2]^cin;
    assign bin[3]=b[3]^cin;
    assign bin[4]=b[4]^cin;
    assign bin[5]=b[5]^cin;
    assign bin[6]=b[6]^cin;
    assign bin[7]=b[7]^cin;
    assign bin[8]=b[8]^cin;
    assign bin[9]=b[9]^cin;
    assign bin[10]=b[10]^cin;
    assign bin[11]=b[11]^cin;
    assign bin[12]=b[12]^cin;
    assign bin[13]=b[13]^cin;
    assign bin[14]=b[14]^cin;
    assign bin[15]=b[15]^cin;

wire [15:1] carry;
 Full_Adder FA0(carry[1],s[0],a[0],bin[0],cin);
 Full_Adder FA1(carry[2],s[1],a[1],bin[1],carry[1]);
 Full_Adder FA2(carry[3],s[2],a[2],bin[2],carry[2]);
 Full_Adder FA3(carry[4],s[3],a[3],bin[3],carry[3]);
 Full_Adder FA4(carry[5],s[4],a[4],bin[4],carry[4]);
 Full_Adder FA5(carry[6],s[5],a[5],bin[5],carry[5]);
 Full_Adder FA6(carry[7],s[6],a[6],bin[6],carry[6]);
 Full_Adder FA7(carry[8],s[7],a[7],bin[7],carry[7]);
 Full_Adder FA8(carry[9],s[8],a[8],bin[8],carry[8]);
 Full_Adder FA9(carry[10],s[9],a[9],bin[9],carry[9]);
 Full_Adder FA10(carry[11],s[10],a[10],bin[10],carry[10]);
 Full_Adder FA11(carry[12],s[11],a[11],bin[11],carry[11]);
 Full_Adder FA12(carry[13],s[12],a[12],bin[12],carry[12]);
 Full_Adder FA13(carry[14],s[13],a[13],bin[13],carry[13]);
 Full_Adder FA14(carry[15],s[14],a[14],bin[14],carry[14]);
 Full_Adder FA15(cout,s[15],a[15],bin[15],carry[15]);
 
endmodule

module Full_Adder(
    cout,
    sum,
    ain,
    bin,
    cin
    );
    
output reg sum, cout;
input wire ain, bin, cin;


always @ (ain, bin, cin)
begin 
sum = ain^bin^cin; 
cout=  (ain&bin)|(ain&cin)|(bin&cin);

end 
endmodule

// 2s compliment
module complement_rejfdb(in,out);
    input [15:0]in;
    output [15:0]out;
    assign out=(~in);
endmodule

//relu
module relu16(
input [15:0] din_relu,
output[15:0] dout_relu
    );
    assign dout_relu = (din_relu[15]==0)? din_relu: 0;
endmodule

//decision function
module convert16_to_1(sig_out, class);

input [15:0] sig_out;
output reg class;

always @(sig_out)
if(sig_out< 16'b0000001000000000 || sig_out == 16'b0000001000000000) class <=1'b0;
else if (sig_out > 16'b0000001000000000) class <= 1'b1;

endmodule	// user_project_wrapper

`default_nettype wire
