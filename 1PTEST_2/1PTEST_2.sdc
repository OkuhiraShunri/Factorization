## Generated SDC file "1PTEST_2.sdc"

## Copyright (C) 2018  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 18.0.0 Build 614 04/24/2018 SJ Standard Edition"

## DATE    "Mon Dec 04 19:48:28 2023"

##
## DEVICE  "10M50DAF484C6GES"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {CLK} -period 20.000 -waveform { 0.000 10.000 } [get_ports {ADC_CLK_10 ARDUINO_IO[0] ARDUINO_IO[1] ARDUINO_IO[2] ARDUINO_IO[3] ARDUINO_IO[4] ARDUINO_IO[5] ARDUINO_IO[6] ARDUINO_IO[7] ARDUINO_IO[8] ARDUINO_IO[9] ARDUINO_IO[10] ARDUINO_IO[11] ARDUINO_IO[12] ARDUINO_IO[13] ARDUINO_IO[14] ARDUINO_IO[15] ARDUINO_RESET_N DRAM_ADDR[0] DRAM_ADDR[1] DRAM_ADDR[2] DRAM_ADDR[3] DRAM_ADDR[4] DRAM_ADDR[5] DRAM_ADDR[6] DRAM_ADDR[7] DRAM_ADDR[8] DRAM_ADDR[9] DRAM_ADDR[10] DRAM_ADDR[11] DRAM_ADDR[12] DRAM_BA[0] DRAM_BA[1] DRAM_CAS_N DRAM_CKE DRAM_CLK DRAM_CS_N DRAM_DQ[0] DRAM_DQ[1] DRAM_DQ[2] DRAM_DQ[3] DRAM_DQ[4] DRAM_DQ[5] DRAM_DQ[6] DRAM_DQ[7] DRAM_DQ[8] DRAM_DQ[9] DRAM_DQ[10] DRAM_DQ[11] DRAM_DQ[12] DRAM_DQ[13] DRAM_DQ[14] DRAM_DQ[15] DRAM_LDQM DRAM_RAS_N DRAM_UDQM DRAM_WE_N GPIO[0] GPIO[1] GPIO[2] GPIO[3] GPIO[4] GPIO[5] GPIO[6] GPIO[7] GPIO[8] GPIO[9] GPIO[10] GPIO[11] GPIO[12] GPIO[13] GPIO[14] GPIO[15] GPIO[16] GPIO[17] GPIO[18] GPIO[19] GPIO[20] GPIO[21] GPIO[22] GPIO[23] GPIO[24] GPIO[25] GPIO[26] GPIO[27] GPIO[28] GPIO[29] GPIO[30] GPIO[31] GPIO[32] GPIO[33] GPIO[34] GPIO[35] GSENSOR_CS_N GSENSOR_INT[1] GSENSOR_INT[2] GSENSOR_SCLK GSENSOR_SDI GSENSOR_SDO HEX0[0] HEX0[1] HEX0[2] HEX0[3] HEX0[4] HEX0[5] HEX0[6] HEX0[7] HEX1[0] HEX1[1] HEX1[2] HEX1[3] HEX1[4] HEX1[5] HEX1[6] HEX1[7] HEX2[0] HEX2[1] HEX2[2] HEX2[3] HEX2[4] HEX2[5] HEX2[6] HEX2[7] HEX3[0] HEX3[1] HEX3[2] HEX3[3] HEX3[4] HEX3[5] HEX3[6] HEX3[7] HEX4[0] HEX4[1] HEX4[2] HEX4[3] HEX4[4] HEX4[5] HEX4[6] HEX4[7] HEX5[0] HEX5[1] HEX5[2] HEX5[3] HEX5[4] HEX5[5] HEX5[6] HEX5[7] KEY[0] KEY[1] LEDR[0] LEDR[1] LEDR[2] LEDR[3] LEDR[4] LEDR[5] LEDR[6] LEDR[7] LEDR[8] LEDR[9] MAX10_CLK1_50 MAX10_CLK2_50 SW[0] SW[1] SW[2] SW[3] SW[4] SW[5] SW[6] SW[7] SW[8] SW[9] VGA_B[0] VGA_B[1] VGA_B[2] VGA_B[3] VGA_G[0] VGA_G[1] VGA_G[2] VGA_G[3] VGA_HS VGA_R[0] VGA_R[1] VGA_R[2] VGA_R[3] VGA_VS}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ADC_CLK_10}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[0]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[1]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[2]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[3]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[4]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[5]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[6]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[7]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[8]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[9]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[10]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[11]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[12]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[13]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[14]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[15]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_RESET_N}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[0]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[1]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[2]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[3]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[4]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[5]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[6]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[7]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[8]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[9]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[10]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[11]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[12]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[13]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[14]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[15]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[0]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[1]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[2]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[3]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[4]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[5]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[6]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[7]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[8]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[9]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[10]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[11]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[12]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[13]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[14]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[15]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[16]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[17]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[18]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[19]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[20]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[21]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[22]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[23]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[24]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[25]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[26]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[27]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[28]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[29]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[30]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[31]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[32]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[33]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[34]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[35]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GSENSOR_INT[1]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GSENSOR_INT[2]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GSENSOR_SDI}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GSENSOR_SDO}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {KEY[0]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {KEY[1]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {MAX10_CLK1_50}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {MAX10_CLK2_50}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {SW[0]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {SW[1]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {SW[2]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {SW[3]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {SW[4]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {SW[5]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {SW[6]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {SW[7]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {SW[8]}]
set_input_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {SW[9]}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[8]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[9]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[10]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[11]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[12]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[13]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[14]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_IO[15]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {ARDUINO_RESET_N}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_ADDR[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_ADDR[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_ADDR[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_ADDR[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_ADDR[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_ADDR[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_ADDR[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_ADDR[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_ADDR[8]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_ADDR[9]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_ADDR[10]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_ADDR[11]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_ADDR[12]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_BA[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_BA[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_CAS_N}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_CKE}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_CLK}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_CS_N}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[8]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[9]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[10]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[11]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[12]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[13]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[14]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_DQ[15]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_LDQM}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_RAS_N}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_UDQM}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {DRAM_WE_N}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[8]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[9]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[10]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[11]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[12]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[13]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[14]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[15]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[16]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[17]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[18]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[19]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[20]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[21]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[22]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[23]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[24]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[25]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[26]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[27]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[28]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[29]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[30]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[31]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[32]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[33]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[34]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GPIO[35]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GSENSOR_CS_N}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GSENSOR_SCLK}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GSENSOR_SDI}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {GSENSOR_SDO}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX0[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX0[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX0[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX0[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX0[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX0[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX0[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX0[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX1[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX1[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX1[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX1[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX1[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX1[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX1[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX1[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX2[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX2[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX2[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX2[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX2[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX2[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX2[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX2[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX3[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX3[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX3[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX3[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX3[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX3[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX3[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX3[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX4[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX4[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX4[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX4[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX4[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX4[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX4[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX4[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX5[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX5[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX5[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX5[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX5[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX5[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX5[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {HEX5[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {LEDR[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {LEDR[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {LEDR[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {LEDR[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {LEDR[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {LEDR[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {LEDR[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {LEDR[7]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {LEDR[8]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {LEDR[9]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_B[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_B[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_B[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_B[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_G[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_G[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_G[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_G[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_HS}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_R[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_R[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_R[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_R[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLK}]  1.000 [get_ports {VGA_VS}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

