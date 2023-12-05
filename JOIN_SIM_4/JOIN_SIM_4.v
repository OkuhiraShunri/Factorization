`timescale 1ns / 100ps

module JOIN_SIM_4();

reg clk, rst, wrong;
reg [1:0] judg, hp;
reg [6:0] key;

//wire [3:0] seg1, seg2, seg3, seg4, seg5, seg6, seg1_q, seg2_q, seg3_q, count1, count2, count3;
wire [6:0] hex0, hex1, hex2, hex3, hex4, hex5;
wire [3:0] count1, count2, count3;
wire led;

JOIN j0(
//----------------input-----------
    .CLK(clk),
    .RST(rst),
    .JUDG(judg),
    .WRONG(wrong),
    .HP(hp),
    .KEY(key),

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
  key = 7'b0000000;
  rst = 0;
  wrong = 0;
  judg = 2'b0;
  hp = 2'b0;
 


#20 key = 7'b0000001;
#40 key = 7'b0000011; //Switch to "INPUT"

end


endmodule