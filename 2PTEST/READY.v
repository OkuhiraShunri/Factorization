module READY(
  input CLK, RST, IN_1P, IN_2P, //1p,2pのinput追加
  input [3:0]STATE,
  output reg[3:0] num
);//1HZイネーブル信号生成

reg  run_in;
reg  keep_1;

initial begin
  keep_1 = 0;
  end

always @(posedge CLK)begin
  if(IN_1P)   //1発来たらずっと1
    keep_1 = 1;
    else if(STATE == ) //最後の状態で0 exp) lose win
    keep_1 = 0;
     
 end 

always @(posedge CLK)begin
  if(keep_1 && IN_2P)                   //チャタリングを噛ますか考えて
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
    if(sec == 4'h6)         //0 ~ 5 
      sec <= 4'h0;
    else
      sec <= sec + 4'h1;    //secはen1hzに同期してインクリメントされる
end

always @(posedge CLK)begin
  if(run_in)
    num <= sec;
  else
    num <= num;
end
endmodule