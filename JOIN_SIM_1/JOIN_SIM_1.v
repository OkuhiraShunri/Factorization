`timescale 1ns / 100ps

module JOIN_SIM_1();

reg clk, rst, redy, que, wrong, q_ok;
reg [1:0] judg, hp;

wire [23:0] question;


JOIN j0(
//----------------input-----------
    .CLK(clk),
    .RST(rst),
    .READY(redy),
    .JUDG(judg),
    .QUE(que),
    .WRONG(wrong),
    .QUE_OK(q_ok),
    
    .HP(hp),
    
 //----------------output----------   
    .QUESTION(question)
  

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
  q_ok = 0;
  judg = 2'b0;
  hp = 2'b0;

#20 redy = 1;
#30 q_ok = 1;

end


endmodule