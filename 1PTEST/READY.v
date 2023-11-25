module READY(
  input CLK, RST, READY_1P,
  input [3:0] STATE,
  output reg[3:0] NUM,
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


reg  run_in;//二人ともボタン押したらこのレジスタが1にかわる
reg  keep_1;
reg READY_2P;

initial begin
  keep_1 = 0;
  READY_2P <= 1;//2pもボタン押してるとする
end

always @(posedge CLK)begin
  if(READY_1P)   //制御部から1発のパルスが来たらずっとkeep_1が1を保持しておく
    keep_1 <= 1;
    else if(STATE == 2'b0110 || STATE == 2'b1000 || STATE == 2'b1001 || STATE == 2'b1010 || STATE == 2'b1011) //順番にSTATEは、DRAW,GOOD,OUCH,WIN,LOSEをあらわす
    keep_1 <= 0;
    else
    keep_1 <= keep_1;
end 

always @(posedge CLK)begin
  if(keep_1 && READY_2P)                   //二人とも押した状態
    run_in <= 1;
  else 
    run_in <= 0;
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


always @(posedge CLK)begin
  if(run_in)begin
    NUM <= sec;//DBに渡すアウトプット
    OK <= 1;//制御部に渡すアウトプット
  end
  else begin
    NUM <= NUM;
  end
end
endmodule