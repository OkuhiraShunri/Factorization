module READY(
  input CLK, RST, READY_1P,
  input [3:0] STATE,
//>>>>>>> a931610401cb96d25d58121868e8e0fe056ed320
  output reg[3:0] NUM
  output reg OK;
);//1HZイネーブル信号生成

/*reg READY_2P;
initial begin
  READY_2P <= 1;//2P
end
always @(posedge CLK)begin
  if(READY_1P == 1 && READY_2P == 1)                   //チャタリングを噛ますか考えて
    OK <= 1;
  else
   RUN_IN <= 0;
end*/


reg  run_in;
reg  keep_1;

initial begin
  keep_1 = 0;
//>>>>>>> a931610401cb96d25d58121868e8e0fe056ed320
end

always @(posedge CLK)begin
  if(READY_1P)   //1発来たらずっと1
    keep_1 = 1;
    else if(STATE == ) //最後の状態で0 exp) lose win
    keep_1 = 0;
     
 end 




reg [25:0] cnt;
wire en1hz = (cnt == 26'd49_999_99);
always @(posedge CLK)begin
  if(RST)
    cnt <= 26'b0;
  else if(en1hz)
    cnt <= 26'b0;
  else
    cnt <= cnt + 26'b1;//このカウントはクロックに同期してインクリメントされる
end//10進カウンタ

reg [3:0] sec;
always @(posedge CLK)begin
  if(RST)
    sec <= 4'h0;
  else if(en1hz)
    if(sec == 4'h9)
      sec <= 4'h0;
    else
      sec <= sec + 4'h1;    //secはen1hzに同期してインクリメントされる. secは内部で常に可動しているタイマーみたいなもの
end

reg READY_2P;
initial begin
    READY_2P <= 1;//2pもボタン押してるとする
end
always @(posedge CLK)begin
  if(OK)
    NUM <= sec;
  else
    NUM <= NUM;
end
endmodule