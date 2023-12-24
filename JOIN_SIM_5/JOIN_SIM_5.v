`timescale 1ns / 100ps

module JOIN_SIM_5();

reg clk, rst, que, dec, clr, ready;
reg [2:0] sel;
reg [1:0] hp;

wire [6:0] hex0, hex1, hex2, hex3, hex4, hex5;
wire led;

JOIN j0(
//----------------input-----------
    .CLK(clk),
    .RST(rst),
    .HP(hp),
    .SEL(sel),
    .DEC(dec),
    .CLR(clr),
    .READY(ready),
    .QUE(que),


 //----------------output----------   
    .HEX0(hex0),
    .HEX1(hex1),
    .HEX2(hex2),
    .HEX3(hex3),
    .HEX4(hex4),
    .HEX5(hex5),
    .LEDR(led)

);


always begin
        clk = 1;
  #0.8  clk = 0;
  #0.8;
end


initial begin
  rst = 0;
  hp = 2'b0;
  sel = 3'b0;
  dec = 0;
  clr = 0;
  ready = 0;
  que = 0;
 
#20 ready = 1;
#20 que = 1; //Swich INPUT
#20 sel = 3'b001;
#10 sel = 3'b000;
#15 dec = 1;
#10 dec = 0;
#10 que = 0; 
end


endmodule