`timescale 1ns / 100ps
module CONTROL_SIM_4();

reg  clk, rst, ready_1p, ready_2p, que_in, que;
reg [1:0] hp, judg, wrong;

wire ok_2, led_1p, led_2p;
wire [3:0] num, num_2;

JOIN j0(
//---------input---------------
    .CLK(clk),
    .RST(rst),
    .READY_1P(ready_1p),
    .READY_2P(ready_2p),
    .QUE_IN(que_in),
    .HP_IN(hp),//2
    .QUE(que),
    .JUDG_IN(judg),//2
    .WRONG_IN(wrong),//2

//---------output---------------    
	.OK_2(ok_2),
    .LED_1P(led_1p),
    .LED_2P(led_2p),
    .NUM(num),
    .NUM_2(num_2)
);


always begin
        clk = 1;
  #0.8  clk = 0;
  #0.8;
end


initial begin
    rst = 0;
    ready_1p = 0;
    ready_2p = 0;
    que = 0;
    que_in = 0;
    hp = 2'b0;
    judg = 2'b0;
    wrong = 2'b0;


#2  ready_1p = 1;//1PがREADYおした
#2  ready_1p = 0;
#3  ready_2p = 1;//
#2  ready_2p = 0;
#5  que = 1;
//-------ここで問題表示-----
#3  que_in = 1; //入力画面へ切り替え
#3  rst = 1;
#3  rst = 0;
//-------リセット-------
#2  ready_1p = 1;//1PがREADYおした
#2  ready_1p = 0;
#3  ready_2p = 1;//2PがREADYおした
#2  ready_2p = 0;
#5  que = 1;
end
always@(posedge clk) begin
    if(rst)
        que = 0;
        que_in = 0;
end




endmodule