`timescale 1ns / 100ps

module JOIN_SIM_3();

reg clk, rst, redy, que, wrong, dec, clr;
reg [1:0] judg, hp;
reg [2:0] sel;

//wire [3:0] seg1, seg2, seg3, seg4, seg5, seg6, seg1_q, seg2_q, seg3_q, count1, count2, count3;
wire [6:0] hex0, hex1, hex2, hex3, hex4, hex5;
wire [3:0] count1, count2, count3;
wire led;

JOIN j0(
//----------------input-----------
    .CLK(clk),
    .RST(rst),
    .READY(redy),
    .JUDG(judg),
    .QUE(que),
    .WRONG(wrong),
    .HP(hp),
    .SEL(sel),
    .DEC(dec),
    .CLR(clr),

 //----------------output----------   
    .HEX0(hex0),
    .HEX1(hex1),
    .HEX2(hex2),
    .HEX3(hex3),
    .HEX4(hex4),
    .HEX5(hex5),
    .COUNT1_OUT(count1),
    .COUNT2_OUT(count2),
    .COUNT3_OUT(count3),
    .LEDR(led)

);


always begin
        clk = 1;
  #0.8  clk = 0;
  #0.8;
end


initial begin


  rst = 0;
  redy = 0;
  que = 0;
  wrong = 0;
  judg = 2'b0;
  hp = 2'b0;
  sel = 3'b0;
  dec = 0;
  clr = 0;


#20 redy = 1;
#40 que = 1; //Switch to "INPUT"

end


endmodule