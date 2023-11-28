`timescale 1ns / 100ps

module INPUT_SIM();

reg clk, rst, dec, clr;
reg [3:0] state;
reg [2:0] sel;
reg [23:0] que;

wire [3:0] seg1, seg2, seg3, seg4, seg5, seg6, seg1_q, seg2_q, seg3_q, count1, count2, count3;
wire led, ok;

INPUT i0(
    .CLK(clk),
    .RST(rst),
    .STATE(state),
    .SEL(sel),
    .DEC(dec),
    .CLR(clr),
    .QUESTION(que),
    
    .SEG1(seg1),
    .SEG2(seg2),
    .SEG3(seg3),
    .SEG4(seg4),
    .SEG5(seg5),
    .SEG6(seg6),

    .SEG1_Q(seg1_q),
    .SEG2_Q(seg2_q),
    .SEG3_Q(seg3_q),
    
    .COUNT1_OUT(count1),
    .COUNT2_OUT(count2),
    .COUNT3_OUT(count3),
    .LED(led),
    .QUE_OK(ok)

);

always begin
        clk = 1;
  #0.8  clk = 0;
  #0.8;
end


initial begin
    num = 4'd4;
  #50 num = 4'd0;
end

endmodule