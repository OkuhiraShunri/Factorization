module READY(
  input CLK, RST, READY_1P,
  input [3:0] STATE,
  output reg[3:0] NUM,
  output reg OK
);//1HZ?????????


reg  run_in;//??????????????????1????
reg  keep_1;
reg READY_2P;

initial begin
  keep_1 = 0;
  READY_2P <= 1;//2p???????????
end

always @(posedge CLK)begin
  if(READY_1P)   //?????1????????????keep_1?1???????
    keep_1 <= 1;
    else if(STATE == 2'b0110 || STATE == 2'b1000 || STATE == 2'b1001 || STATE == 2'b1010 || STATE == 2'b1011) //???STATE??DRAW,GOOD,OUCH,WIN,LOSE?????
    keep_1 <= 0;
    else
    keep_1 <= keep_1;
end 

always @(posedge CLK)begin
  if(keep_1 && READY_2P)                   //?????????
    run_in <= 1;
  else 
    run_in <= 0;
end



/*reg [25:0] cnt;
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
    else
      sec <= sec + 4'h1;    //sec?en1hz???????????????. sec??????????????????????
end*/


always @(posedge CLK)begin
  if(run_in)begin
    NUM <= 4'd5;
    //NUM <= sec;//DB?????????
    OK <= 1;//????????????
  end
  else begin
    NUM <= 4'b0;
    OK <= 0;
  end
end
endmodule