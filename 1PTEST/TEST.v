module TEST(
    input CLK, RST,
    input [6:0] KEY,
    output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, LEDR
);


wire [2:0] sel;
wire dec, clr, que, ready;

BTN_IN b0 (.CLK(CLK), .RST(RST), .nBIN(KEY), .BOUT({sel, dec, clr, que, ready}));

//wire [2:0] sel2;
wire [3:0] state;
//wire dec2, clr2, que2, ready2, ok;
wire ready2, ok;
// CONTROL c0 (.CLK(CLK), .RST(RST), .SEL(sel), .DEC(dec), .CLR_IN(clr), .QUE_IN(que), .READY_IN(ready), .OK_IN(ok), .QUE(que2), .STATE(state),
//             .SEL_OUT(sel2), .DEC_OUT(dec2), .READY_OUT(ready2), .CLR_OUT(clr2));

CONTROL c0 (.CLK(CLK), .RST(RST), .QUE_IN(que), .READY_IN(ready), .OK_IN(ok), .QUE(que2), .STATE(state), .READY_OUT(ready2));



wire [3:0] num;
READY r0 (.CLK(CLK), .RST(RST), .READY_1P(ready2), .STATE(state), .NUM(num), .OK(ok));


wire [23:0] que3;
//DB d0 (.CLK(CLK), .RST(RST), .NUM_IN(num), .QUESTION(que3));
DB d0(.CLK(CLK), .RST(RST), .OK(ok), .QUESTION(que3));

wire [3:0] seg1, seg2, seg3, seg4, seg5, seg6, seg1_q, seg2_q, seg3_q;
// INPUT i0 (.CLK(CLK), .RST(RST), .SEL(sel2), .DEC(dec2), .CLR_IN(clr2), .STATE(state), .QUESTION(que3), .QUE_OK(que2), 
//           .SEG1(seg1), .SEG2(seg2), .SEG3(seg3), .SEG4(seg4), .SEG5(seg5), .SEG6(seg6), .SEG1_Q(seg1_q), .SEG2_Q(seg2_q), .SEG3_Q(seg3_q), .LED(LEDR) );
INPUT i0 (.CLK(CLK), .RST(RST), .SEL(sel), .DEC(dec), .CLR(clr), .STATE(state), .QUESTION(que3), .QUE_OK(que2), 
          .SEG1(seg1), .SEG2(seg2), .SEG3(seg3), .SEG4(seg4), .SEG5(seg5), .SEG6(seg6), .SEG1_Q(seg1_q), .SEG2_Q(seg2_q), .SEG3_Q(seg3_q), .LED(LEDR) );

SEG7DEC_1 s0(.STATE(state), .DIN(seg1), .QUE(seg1_q), .nHEX(HEX0));
SEG7DEC_2 s1(.STATE(state), .DIN(seg2), .QUE(seg2_q), .nHEX(HEX1));

SEG7DEC_1 s2(.STATE(state), .DIN(seg3), .QUE(seg3_q), .nHEX(HEX2));
SEG7DEC_2 s3(.STATE(state), .DIN(seg4), .QUE(seg1_q), .nHEX(HEX3));

SEG7DEC_1 s4(.STATE(state), .DIN(seg5), .QUE(seg2_q), .nHEX(HEX4));
SEG7DEC_2 s5(.STATE(state), .DIN(seg6), .QUE(seg3_q), .nHEX(HEX5));


endmodule
