module CONTROL(
    input [2:0] SEL,
    input CLK, RST, READY_IN, QUE_IN, DEC, CLR_IN,//QUE_IN??????????????????????
    input OK_IN, //????????????READY?????????????????
    input [1:0] HP_IN,//00????,01??????,10??????
    input QUE,//??????????????1????????0?QUE????????????????
    input [1:0] JUDG_IN,  //???????????
    input WRONG_IN, //??????????????
    output reg READY_OUT,
    output reg [3:0] STATE, 
	 output reg [2:0] SEL_OUT,
	 output reg DEC_OUT, CLR_OUT
);

reg R;
initial begin
  R <= 0;
end
always @(posedge CLK) begin
     if(R == 0 && QUE_IN)
	      R <= 1;
		else if(R == 1 && QUE_IN)
		   R <= 0;
end



reg[3:0] cur,nxt;
localparam  READY = 4'b0010, QUESTION = 4'b0011, INPUT = 4'b0100, DRAW = 4'b0110
            , WRONG = 4'b0111, GOOD = 4'b1000, OUCH = 4'b1001, WIN = 4'b1010, LOSE = 4'b1011;


always @( posedge CLK) begin //
  if(RST)
    cur <= READY;
  else
    cur <= nxt;
end


always @(posedge CLK) begin
  if(cur == READY)begin
      READY_OUT <= READY_IN;
      STATE <= 4'b0010;
  end
  else if(cur == QUESTION)begin
      STATE <= 4'b0011;
  end
  else if(cur == INPUT)begin
      STATE <= 4'b0100;
      SEL_OUT <= SEL;
      DEC_OUT <= DEC;
      CLR_OUT <= CLR_IN;
  end
  
end

reg NEED_1SEC;//??????????????
initial begin
  NEED_1SEC <= 0;
end


always @(posedge  CLK) begin
    case(cur)
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
initial begin
    cnt <= 0;
end

always @(posedge CLK)begin
    if(RST)
      cnt <= 26'b0;
    else if(EN1HZ || NEED_1SEC == 0)
      cnt <= 26'b0;
    else if(NEED_1SEC == 1)
      cnt <= cnt + 26'b1; 
    else 
      cnt <= cnt;   
end


// reg QUE_r;
// initial begin
//   QUE_r <= 0;
// end
// always @(posedge CLK) begin
//   QUE_r <= QUE_IN;
// end

always @(posedge CLK)begin
    
    case(cur)   
        READY: 
                //if(OK_IN && QUE) //????????????????????????????????
                if(OK_IN && QUE)
                    nxt <= QUESTION; //????
                else
                    nxt <= READY;

        QUESTION:
                   //if(R6 == 1 && QUE) //???????????????????????????????????
                   if(R == 1 && QUE)
                    nxt <= INPUT;
                   else 
                    nxt <= QUESTION;
                    //nxt <= READY; 
        
        INPUT: 
                if(R == 0 && QUE)
                    nxt <= QUESTION;
                else if(WRONG_IN)
                    nxt <= WRONG;
                else if(JUDG_IN == 01)
                    nxt <= GOOD;
                else if(JUDG_IN == 10)
                    nxt <= OUCH;
                else if(JUDG_IN == 11)
                    nxt <= DRAW;
                else
                    nxt <= INPUT;
                    //nxt <= READY;

        WRONG: 
               
               if(EN1HZ)
                nxt <= INPUT;
               else 
                nxt <= WRONG;
        
        GOOD: 
             
              if(EN1HZ)
                nxt <= READY;
              else if(HP_IN == 01) 
                nxt <= WIN;
              else
                nxt <= GOOD;

        OUCH: 
              
              if(EN1HZ)
                nxt <= READY;
              else if(HP_IN == 10)
                nxt <= LOSE;
              else 
                nxt <= OUCH;

        DRAW: 
              
              if(EN1HZ)
                nxt <= READY;
              else
                nxt <= DRAW;

        WIN: 
            
             if(EN1HZ)
               nxt <= READY;
             else 
               nxt <= WIN;

        LOSE:
             
             if(EN1HZ)
               nxt <= READY;
             else 
               nxt <= LOSE;

        default: nxt <= READY;
    endcase
end





endmodule