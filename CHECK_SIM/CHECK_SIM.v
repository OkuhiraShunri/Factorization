`timescale 1ns / 100ps
module CHECK_SIM();


reg  clk, rst;
reg [3:0] anser1, anser2, anser3;
reg [23:0] que;


wire [1:0] result;
//wire [2:0] cnt;



CHECK a1(

//------------------INPUT---------------------------
 .CLK(clk),
 .RST(rst),
 .ANSWER_1(anser1),
 .ANSWER_2(anser2),
 .ANSWER_3(anser3),
 .QUESTION(que),
 //----------------OUTPUT----------------------------
 .RESULT(result)
);

always begin
        clk = 1;
  #0.8  clk = 0;
  #0.8;
end


initial begin
     rst = 0;
     anser1 = 4'b0;
     anser2 = 4'b0;
     anser3 = 4'b0;
     que = 24'b0;

#10 que = 24'b000000100111001000100010;
#10 anser1 = 4'b0010;
    anser2 = 4'b0011;
    anser3 = 4'b0010;
#10 anser1 = 4'b0000;
    anser2 = 4'b0000;
    anser3 = 4'b0000;
end

endmodule