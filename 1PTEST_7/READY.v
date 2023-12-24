module READY(
  input CLK, RST, READY_1P, READY_2P,
  input [3:0] STATE,
  input [2:0] char_num_2p,

   input [2:0] SEL,  //modi

  output reg[3:0] NUM, NUM_2,
  output reg OK,
  output reg OK_2,
  output LED,
  output LED_1P,
  output LED_RST,  //modi

  output reg[2:0] char_num  //modi
);

localparam  READY = 4'b0010, QUESTION = 4'b0011, INPUT = 4'b0100, DRAW = 4'b0110
            , WRONG = 4'b0111, GOOD = 4'b1000, OUCH = 4'b1001, WIN = 4'b1010, LOSE = 4'b1011;
reg  run_in;//??????????????????1????
reg  keep_1;
reg  keep_2;
//reg READY_2P;



initial begin
  run_in <= 0;
  keep_1 = 0;
  keep_2 = 0;//2p???????????
  //READY_2P <= 0;

  char_num = 3'b0; //modi
end

  


// if(RST)
//        char_num <= 3'b000;
//         else
always @(posedge CLK) begin                       //modi
  if(RST)
   char_num <= 3'b000;
  else if(STATE == READY)begin//
        if(SEL[2] == 1)begin
         char_num <= char_num + 1;
             if(char_num == 3'b011)begin
               char_num <= 3'b000;
             end
        end  
    end  
        else if(STATE != READY)begin   
          char_num <= 3'b000;
          
        end
end



always @(posedge CLK)begin
  if(READY_1P && char_num == 3'b011)   //1Pがレディ押したとき
    keep_1 <= 1;
    else if(STATE == DRAW || STATE == GOOD || STATE == OUCH || STATE == WIN || STATE == LOSE || RST) //STATE == DRAW,GOOD,OUCH,WIN,LOSE
    keep_1 <= 0;
    else
    keep_1 <= keep_1;
end 

always @(posedge CLK)begin
  if(READY_2P && char_num_2p == 3'b011)   //2Pがレディ押したとき
    keep_2 <= 1;
    else if(STATE == DRAW || STATE == GOOD || STATE == OUCH || STATE == WIN || STATE == LOSE || RST) //STATE == DRAW,GOOD,OUCH,WIN,LOSE
    keep_2 <= 0;
    else
    keep_2 <= keep_2;
end 

always @(posedge CLK)begin
  if(RST)
    run_in <= 0;
  else if(keep_1 && keep_2)                   //二人おした
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

reg LED_r2;
initial begin
  LED_r2 <= 0;
end
always @(posedge CLK) begin
  if(keep_1)begin
    LED_r2 <= 1;
  end
  else begin
    LED_r2 <= 0;
  end
end
assign LED_1P = LED_r2;

reg LED_r3;     //modi
initial begin
  LED_r3 <= 0;
end
always @(posedge CLK) begin
  if(RST)begin
    LED_r3 <= 1;
  end
  else begin
    LED_r3 <= 0;
  end
end
assign LED_RST = LED_r3;



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
  if(RST)begin
    NUM <= 4'b0;
    NUM_2 <= 4'b0;
    OK <= 0;
    OK_2 <= 0;
  end
  else if(run_in)begin
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