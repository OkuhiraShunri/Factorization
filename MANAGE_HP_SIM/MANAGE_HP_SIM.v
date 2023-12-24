`timescale 1ns / 100ps
module MANAGE_HP_SIM();


reg  clk, rst, ready, que, ok, que2;
reg [1:0]  judg, wrong;



//wire ready_out;
//wire [2:0] sel_out;
//wire dec_out, clr_out;
//wire [2:0] cnt;
wire [3:0] state;
wire led1, led2, led3, led4, led5, led6, led7, led8, led9;


JOIN a1(

//------------------INPUT---------------------------
 .CLK(clk),
 .RST(rst),
 .READY_IN(ready),
 .WRONG_IN(wrong),
 .QUE_IN(que),
 .OK(ok),
 .QUE(que2),
 .JUDG(judg),//2
 //.STATE(state),
 
 //----------------OUTPUT----------------------------
 .STATE(state),
 .LEDR1(led1),
 .LEDR2(led2),
 .LEDR3(led3),
 .LEDR4(led4),
 .LEDR5(led5),
 .LEDR6(led6),
 .LEDR7(led7),
 .LEDR8(led8),
 .LEDR9(led9)
);

always begin
        clk = 1;
  #0.8  clk = 0;
  #0.8;
end


initial begin
//--------------初期化-------------------    
    rst = 0;
    ready = 0;
    wrong = 2'b0;
    que = 0;
    ok = 0;
    que2 = 0;
    judg = 2'b0;
//---------------------------------------    

#10 ok = 1;
#2  que2 = 1;//入力モジュールから受け取る信号
//-------------ここでSTATEはQUESTION-----------
#5 que = 1; // QUESTION -> INPUT
// #5 judg = 2'b01; //問題を解いた
//    wrong = 2'b01; 
// #5 judg = 2'b0;
//    wrong = 2'b00;

// #5 judg = 2'b10;//相手が先に解いた
//    wrong = 2'b0;
// #5 judg = 2'b0;
//    wrong = 2'b0;

#5 


end


// always begin
//   que = 0;
// #150 que = 1;
// #150;  
// end



endmodule