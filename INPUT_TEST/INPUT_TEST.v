module INPUT_TEST(
    input CLK, RST,
    input [4:0] KEY,
    output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5
);

wire [2:0] select;
wire inc, dec;
BTN_IN b0(.CLK(CLK), .RST(RST), .nBIN(KEY), .BOUT({select, inc, dec}));

wire [3:0] seg1, seg2, seg3, seg4, seg5, seg6;
wire [3:0] answer1, answer2, answer3;
wire [1:0] result;

INPUT i0(.CLK(CLK), .RST(RST), .SEL_IN(select), .INC_IN(inc), .DEC_IN(dec),
         .SEG1(seg1), .SEG2(seg2), .SEG3(seg3), .SEG4(seg4), .SEG5(seg5), .SEG6(seg6),
         .COUNT1_out(answer1), .COUNT2_out(answer2), .COUNT3_out(answer3), .RESULT_IN(result));
			

CHECK c0(.CLK(CLK), .RST(RST), .COUNT1_IN(answer1), .COUNT2_IN(answer2), .COUNT3_IN(answer3), .RESULT(result));

SEG7DEC_ONE s1(.DIN(seg1), .nHEX(HEX0));
SEG7DEC_TEN s2(.DIN(seg2), .nHEX(HEX1));

SEG7DEC_ONE s3(.DIN(seg3), .nHEX(HEX2));
SEG7DEC_TEN s4(.DIN(seg4), .nHEX(HEX3));

SEG7DEC_ONE s5(.DIN(seg5), .nHEX(HEX4));
SEG7DEC_TEN s6(.DIN(seg6), .nHEX(HEX5));


endmodule