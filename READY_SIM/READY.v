module READY(
  input CLK, RST, READY_1P, READY_2P,
  input [3:0] STATE,
  output reg[3:0] NUM, NUM_2,
  output reg OK,
  output reg OK_2,
  output LED
);


reg  run_in;//??????????????????1????
reg  keep_1;
reg  keep_2;
//reg READY_2P;

initial begin
  run_in <= 0;
  keep_1 = 0;
  keep_2 = 0;//2p???????????
  //READY_2P <= 0;
end

always @(posedge CLK)begin
  if(READY_1P)   //1Pがレディ押したとき
    keep_1 <= 1;
    else if(STATE == 4'b0110 || STATE == 4'b1000 || STATE == 4'b1001 || STATE == 4'b1010 || STATE == 4'b1011 || RST) //STATE == DRAW,GOOD,OUCH,WIN,LOSE
    keep_1 <= 0;
    else
    keep_1 <= keep_1;
end 

always @(posedge CLK)begin
  if(READY_2P)   //2Pがレディ押したとき
    keep_2 <= 1;
    else if(STATE == 4'b0110 || STATE == 4'b1000 || STATE == 4'b1001 || STATE == 4'b1010 || STATE == 4'b1011 || RST) //STATE == DRAW,GOOD,OUCH,WIN,LOSE
    keep_2 <= 0;
    else
    keep_2 <= keep_2;
end 

always @(posedge CLK)begin
  if(keep_1 && keep_2)                   //二人おした
    run_in <= 1;
  else 
    run_in <= 0;
end

reg LED_r;
initial begin
  LED_r <= 0;
end
always @(posedge CLK) begin
  if(keep_2)begin
    LED_r <= 1;
  end
  else begin
    LED_r <= 0;
  end
end

assign LED = LED_r;

reg [25:0] cnt;
wire en1hz = (cnt == 26'd49_999_99);
always @(posedge CLK)begin
  if(RST)
    cnt <= 26'b0;
  else if(en1hz)
    cnt <= 26'b0;
  else
    cnt <= cnt + 26'b1;//??????????????????????????
end//10?????

reg [3:0] sec;
always @(posedge CLK)begin
  if(RST)
    sec <= 4'h0;
  else if(en1hz)
    if(sec == 4'h9)
      sec <= 4'h0;
    else if(run_in != 1)
      sec <= sec + 4'h1;    //sec?en1hz???????????????. sec??????????????????????
end


always @(posedge CLK)begin
  if(run_in)begin
    //NUM <= 4'd5;
    NUM <= sec + 1;//自分のDBに送信
    NUM_2 <= sec + 1;//2PのDBに送信
    OK <= 1;//自分のコントロール部に送信
    OK_2 <= 1;//2Pのコントロール部に送信
  end
  else begin
    NUM <= 4'b0;
    NUM_2 <= 4'b0;
    OK <= 0;
    OK_2 <= 0;
  end
end
endmodule