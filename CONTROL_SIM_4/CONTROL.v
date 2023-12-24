module CONTROL(
    input [2:0] SEL,
    input CLK, RST, READY_IN, QUE_IN, DEC, CLR_IN,//QUE_IN is BOUT
    input OK_IN, //????????????READY?????????????????
    input [1:0] HP_IN,//00????,01??????,10??????
    input QUE,//QUE is INPUT's q_ok    Question is already  not 0 or  0
    input [1:0] JUDG_IN,  //???????????
    input [1:0] WRONG_IN, //??????????????

  

    output reg READY_OUT,
    output reg [3:0] STATE, 
	 //output reg [2:0] SEL_OUT,
	 //output reg DEC_OUT, CLR_OUT,
	 output LED
);

reg[3:0] cur,nxt;
localparam  READY = 4'b0010, QUESTION = 4'b0011, INPUT = 4'b0100, DRAW = 4'b0110
            , WRONG = 4'b0111, GOOD = 4'b1000, OUCH = 4'b1001, WIN = 4'b1010, LOSE = 4'b1011;

reg SW0;
initial begin
  SW0 <= 0;
end
always @(posedge CLK) begin
     if(SW0 == 0 && QUE_IN)   //R is Flag of QUESTION   QUE_IN is SW9
	      SW0 <= 1;             
		else if(SW0 == 1 && QUE_IN || STATE == READY || RST) //if question is not prepared ,don't go next
		   SW0 <= 0;
end


// always @( posedge CLK) begin // When Clear
//   if(RST)
//     cur <= READY;
//   else
//     cur <= nxt;
// end


always @(posedge CLK) begin //Change State
  case(nxt)
    READY:   STATE <= READY; //modi NEED_1SECを0に戻す処理
    QUESTION: STATE <= QUESTION; //modi
    INPUT:   STATE <= INPUT; //modi
    WRONG:   STATE <= WRONG; 
    GOOD:    STATE <= GOOD;
    OUCH:    STATE <= OUCH; 
    DRAW:    STATE <= DRAW; 
    WIN:     STATE <= WIN; 
    LOSE:    STATE <= LOSE;  
  endcase
end

always @(posedge CLK) begin
  if(nxt == READY)begin
    READY_OUT <= READY_IN;
  end
  // else if(nxt == INPUT)begin
  //     SEL_OUT <= SEL;        //Through  reg ...
  //     DEC_OUT <= DEC;        //Through  reg ...
  //     CLR_OUT <= CLR_IN;   
  // end
  
end

reg NEED_1SEC;//一秒タイマーを起動させるためのフラグ
initial begin
  NEED_1SEC <= 0;
end



always @(posedge  CLK) begin
    case(nxt)
      READY:   NEED_1SEC <= 0; //modi NEED_1SECを0に戻す処理
      QUESTION:NEED_1SEC <= 0; //modi
      INPUT:   NEED_1SEC <= 0; //modi
      WRONG:   NEED_1SEC <= 1; 
      GOOD:    NEED_1SEC <= 1;
      OUCH:    NEED_1SEC <= 1; 
      DRAW:    NEED_1SEC <= 1; 
      WIN:     NEED_1SEC <= 1; 
      LOSE:    NEED_1SEC <= 1;  
  endcase
end



reg [25:0] cnt;
wire EN1HZ = (cnt==26'd49_999_999);

always @(posedge CLK)begin   //Count 1sec
    if(RST)
      cnt <= 26'b0;
    else if(EN1HZ) // Enough = 0 || First =0
    //else if(EN1HZ)
      cnt <= 26'b0;
    else if(NEED_1SEC == 1) // When  WRONG ,GOOD,OUCH,DRAW ,WIN ,LOSE
    //else if(STATE == GOOD || STATE == WRONG || STATE == OUCH || STATE == DRAW || STATE == LOSE || STATE == WIN)  
       cnt <= cnt + 26'b1;  //inc
       //cnt <= cnt ;
    else 
      cnt <= 26'b0;  //cnt <= cnt is error
end


reg LED_r;
initial begin
  LED_r <= 0;
end
always @(posedge CLK) begin
  if(RST)begin
    LED_r <= 1;
  end
  else begin
    LED_r <= 0;
  end
end
assign LED = LED_r;

always @(posedge CLK)begin
    
    case(nxt)   
        READY: 
                if(OK_IN && QUE)//OK_INは二人ともスタートボタン押した信号、QUEは問題が格納されたことを入力モジュールから受け取る信号
                    nxt <= QUESTION; //????
                else
                    nxt <= READY;
        QUESTION:
                   if(RST)
                    nxt <= READY;
                   else if(SW0 == 1 && QUE)
                    nxt <= INPUT;
                   else if((JUDG_IN == 2'b10 && WRONG_IN == 2'b00) || (JUDG_IN == 2'b10 && WRONG_IN == 2'b11))
                    nxt <= OUCH;
                   else   
                    nxt <= QUESTION;
                    //nxt <= READY; 
        
        INPUT:   
                if(RST)
                    nxt <= READY;
                else if(SW0 == 0 && QUE)
                    nxt <= QUESTION;
                else if(WRONG_IN == 2'b11)
                    nxt <= WRONG;
                else if(JUDG_IN == 2'b01 && WRONG_IN == 2'b01)
                    nxt <= GOOD;
                else if((JUDG_IN == 2'b10 && WRONG_IN == 2'b00) || (JUDG_IN == 2'b10 && WRONG_IN == 2'b11))
                    nxt <= OUCH;
                else if(JUDG_IN == 2'b11 && WRONG_IN == 2'b01)
                    nxt <= DRAW;
                else 
                    nxt <= INPUT;
                    //nxt <= READY;

        WRONG: //Fail
               if(RST)
                nxt <= READY;
               else if(EN1HZ)
                nxt <= INPUT;
               else 
                nxt <= WRONG;
        
        GOOD: 
              if(RST)
                nxt <= READY;
              else if(EN1HZ)
                nxt <= READY;
              else if(HP_IN == 2'b10) 
                nxt <= WIN;
              else
                nxt <= GOOD;

        OUCH: 
              if(RST)
                nxt <= READY;
              else if(EN1HZ)
                nxt <= READY;
              else if(HP_IN == 2'b01)
                nxt <= LOSE;
              else 
                nxt <= OUCH;

        DRAW: 
              if(RST)
                nxt <= READY;
              else if(EN1HZ)
                nxt <= READY;
              else
                nxt <= DRAW;

        WIN: 
              if(RST)
                nxt <= READY;
              else if(EN1HZ)
                nxt <= READY;
              else 
                nxt <= WIN;

        LOSE:
              if(RST)
                nxt <= READY;
              else if(EN1HZ)
                nxt <= READY;
              else 
                nxt <= LOSE;

        default: nxt <= READY;
    endcase
end





endmodule