module JOIN(
    //input CLK, RST, READY, QUE, WRONG, DEC, CLR,
    input [1:0] JUDG, HP,
    input  CLK, RST, WRONG,
    input [6:0] KEY,
    output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, 
    output [3:0] COUNT1_OUT, COUNT2_OUT, COUNT3_OUT,
    output LEDR
);

wire [2:0] sel;
wire dec, clr, que, ready, ready2;

wire  ok, q_ok;
wire [3:0] num;
wire [3:0] state;
wire [23:0] question;
wire [3:0] seg1, seg2, seg3, seg4, seg5, seg6, seg1_q, seg2_q, seg3_q;

BTN_IN b0(.CLK(CLK), .RST(RST), .nBIN(KEY), .BOUT({sel, dec, clr, que, ready}));//
 
CONTROL c0(.CLK(CLK), .RST(RST), .READY_IN(ready), .QUE_IN(que), .WRONG_IN(WRONG), .JUDG_IN(JUDG), .HP_IN(HP),
           .QUE(q_ok), .OK_IN(ok), .READY_OUT(ready2), .STATE(state));

READY r0(.CLK(CLK), .RST(RST), .OK(ok), .STATE(state), .NUM(num), .READY_1P(ready2));

DB d0(.CLK(CLK), .NUM_IN(num), .QUESTION(question)); 


INPUT i0(.CLK(CLK), .RST(RST), .QUESTION(question), .STATE(state), .SEL(sel), .DEC(dec), .CLR(clr), .SEG1(seg1), .SEG2(seg2), .SEG3(seg3),
         .SEG4(seg4), .SEG5(seg5), .SEG6(seg6), .SEG1_Q(seg1_q), .SEG2_Q(seg2_q), .SEG3_Q(seg3_q), 
         .COUNT1_OUT(COUNT1_OUT), .COUNT2_OUT(COUNT2_OUT), .COUNT3_OUT(COUNT3_OUT), .QUE_OK(q_ok), .LED(LEDR)
	);

SEG7DEC_1 s0(.STATE(state), .DIN(seg1), .QUE(seg1_q), .nHEX(HEX0));
SEG7DEC_2 s1(.STATE(state), .DIN(seg2), .QUE(seg2_q), .nHEX(HEX1));

SEG7DEC_1 s2(.STATE(state), .DIN(seg3), .QUE(seg3_q), .nHEX(HEX2));
SEG7DEC_2 s3(.STATE(state), .DIN(seg4), .QUE(seg1_q), .nHEX(HEX3));

SEG7DEC_1 s4(.STATE(state), .DIN(seg5), .QUE(seg2_q), .nHEX(HEX4));
SEG7DEC_2 s5(.STATE(state), .DIN(seg6), .QUE(seg3_q), .nHEX(HEX5));

endmodule