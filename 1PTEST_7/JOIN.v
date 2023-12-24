module JOIN(
    input [1:0] HP,
    input  CLK, RST,
    input READY_in_GPIO_0, 
    input [1:0] RESULT_in_GPIO_8_9,
    input [2:0] char_num_in_GPIO_13_15,
    input [6:0] KEY,
    output OK_out_GPIO_1, LED_out_GPIO_12,
    output [3:0] NUM_out_GPIO_2_5,
    output [1:0] JUDG_out_GPIO_6_7, JUDG_out_GPIO_10_11,
    output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, 
    output LEDR0, LEDR1, LEDR2, LEDR3, LEDR4, LEDR5, LEDR6, LEDR7, LEDR8, LEDR9
);

wire [2:0] sel, sel2, sel3;
wire dec, dec2, clr, clr2, que, ready, ready2;

wire  ok, q_ok;
wire [3:0] num;
wire [3:0] state;
wire [23:0] question;
wire [3:0] seg1, seg2, seg3, seg4, seg5, seg6, seg1_q, seg2_q, seg3_q;
wire [3:0] answer1, answer2, answer3;
wire [1:0] result, judg;
wire [1:0] hp;
wire [3:0] hp2;
wire [2:0] char_num;


//BTN_IN b0(.CLK(CLK), .RST(RST), .nBIN(KEY), .BOUT({sel, dec, clr, ready}));//SW[0]チャタリングなし
BTN_IN b0(.CLK(CLK), .RST(RST), .nBIN(KEY), .BOUT({sel, dec, clr, que, ready}));//

 
// CONTROL c0(.CLK(CLK), .RST(RST), .READY_IN(ready), .QUE_IN(QUE), .WRONG_IN(WRONG), .JUDG_IN(JUDG), .HP_IN(HP), 
//            .QUE(q_ok), .OK_IN(ok), .READY_OUT(ready2), .STATE(state), .SEL(sel), .DEC(dec), .CLR_IN(clr), .SEL_OUT(sel2), .DEC_OUT(dec2), .CLR_OUT(clr2));

CONTROL c0(.CLK(CLK), .RST(RST), .READY_IN(ready), .QUE_IN(que), .WRONG_IN(result), .JUDG_IN(judg), .HP_IN(hp), 
           .QUE(q_ok), .OK_IN(ok), .READY_OUT(ready2), .STATE(state), .SEL(sel), .DEC(dec), .CLR_IN(clr), .SEL_OUT1(sel2), .SEL_OUT2(sel3), .DEC_OUT(dec2), .CLR_OUT(clr2), .LED(LEDR2));

READY r0(.CLK(CLK), .RST(RST), .OK(ok), .STATE(state), .NUM(num), .NUM_2(NUM_out_GPIO_2_5), .READY_1P(ready2), .READY_2P(READY_in_GPIO_0), .OK_2(OK_out_GPIO_1), .LED(LEDR1),
         .LED_1P(LED_out_GPIO_12), .SEL(sel3), .char_num(char_num), .char_num_2p(char_num_in_GPIO_13_15), .LED_RST(LEDR3));

DB d0(.CLK(CLK), .RST(RST), .NUM_IN(num), .QUESTION(question)); 


INPUT i0(.CLK(CLK), .RST(RST), .QUESTION(question), .STATE(state), .SEL(sel2), .DEC(dec2), .CLR(clr2), .SEG1(seg1), .SEG2(seg2), .SEG3(seg3),
         .SEG4(seg4), .SEG5(seg5), .SEG6(seg6), .SEG1_Q(seg1_q), .SEG2_Q(seg2_q), .SEG3_Q(seg3_q), 
         .COUNT1_OUT(answer1), .COUNT2_OUT(answer2), .COUNT3_OUT(answer3), .QUE_OK(q_ok), .LED(LEDR0)
	);

CHECK ch0(.CLK(CLK), .RST(RST), .ANSWER_1(answer1), .ANSWER_2(answer2), .ANSWER_3(answer3), .QUESTION(question), .RESULT(result));

WIN_LOSE w0(.CLK(CLK), .RST(RST), .MINE(result), .WL_OUT(judg), .WL_OUT_2_control(JUDG_out_GPIO_6_7), .WL_OUT_2_hp(JUDG_out_GPIO_10_11), .ENEMY(RESULT_in_GPIO_8_9));

MANAGE_HP m0(.CLK(CLK), .RST(RST), .HP_IN(judg), .RESULT(hp), .HP_OUT(hp2));

HP_LED hled(.CLK(CLK), .RST(RST), .IN_HP(hp2),   .LED4(LEDR4), .LED5(LEDR5), .LED6(LEDR6), .LED7(LEDR7), .LED8(LEDR8), .LED9(LEDR9));

SEG7DEC_1 s0(.STATE(state), .DIN(seg1), .QUE(seg1_q), .nHEX(HEX0));
SEG7DEC_2 s1(.STATE(state), .DIN(seg2), .QUE(seg2_q), .nHEX(HEX1));

SEG7DEC_3 s2(.STATE(state), .DIN(seg3), .QUE(seg3_q), .nHEX(HEX2));
SEG7DEC_4 s3(.STATE(state), .DIN(seg4), .QUE(seg1_q), .nHEX(HEX3));

SEG7DEC_5 s4(.STATE(state), .DIN(seg5), .QUE(seg2_q), .nHEX(HEX4), .char_num(char_num));
SEG7DEC_6 s5(.STATE(state), .DIN(seg6), .QUE(seg3_q), .nHEX(HEX5));

endmodule