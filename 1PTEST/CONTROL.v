module CONTROL(
    input [2:0] SEL_IN,
    input CLK, RST, DEC_IN, CLR_IN, QUE_IN, READY_IN,
    input OK_IN, //二人ともスタート押して、READYモジュールからその信号を受け取る。
    input [1:0] HP_IN,//00は無入力,01は自分の勝ち,10は相手の勝ち
    input QUE,//入力側に問題が入ってれば値は1、入ってなければ0
    input JUDG_IN,  //勝利判定結果の信号受取
    input WRONG_IN, //回答を間違えたときの信号受取
    output reg READY_OUT,
    output reg [3:0] STATE, //
    output reg [2:0] SEL_OUT,
    output reg DEC_OUT, CLR_OUT 
);

reg[3:0] cur,nxt;
localparam  READY = 4'b0010, QUESTION = 4'b0011, INPUT = 4'b0100, DRAW = 4'b0110
            , WRONG = 4'b0111, GOOD = 4'b1000, OUCH = 4'b1001, WIN = 4'b1010, LOSE = 4'b1011;

reg R1 , R2, R3, R4, R5, R6;
initial begin 
	 R1 = 0; //SEL_IN[0]
	 R2 = 0; //SEL_IN[1]
	 R3 = 0; //SEL_IN[2]
   R4 = 0; //DEC_IN
   R5 = 0; //CLR_IN
   R6 = 0; //QUE_IN


end
	
always @(posedge CLK) begin   //Generate Toggle Wave → 信号を出しぱなしにする
    if(R1 == 0 && SEL_IN[0]) //最初は上記initial文より、R1の値は0です。そこで、SWをオンにして、SEL_IN[0]が1になったら、R1は1を放出し続けます。
	    R1 <= 1;
	else if(R1 == 1 && SEL_IN[0])//そして、またもう一回swをオンにしたら、さっきR1は1を放出してたけど、次は0を放出し続けるようになります。
		R1 <= 0;
end

always @(posedge CLK) begin   //Generate Toggle Wave
    if(R2 == 0 && SEL_IN[1])
	    R2 <= 1;
	else if(R2 == 1 && SEL_IN[1])
		R2 <= 0;
end

always @(posedge CLK) begin   //Generate Toggle Wave
    if(R3 == 0 && SEL_IN[2])
	    R3 <= 1;
	else if(R3 == 1 && SEL_IN[2])
		R3 <= 0;
end

always @(posedge CLK) begin   //Generate Toggle Wave
    if(R4 == 0 && DEC_IN)
	    R4 <= 1;
	else if(R4 == 1 && DEC_IN)
		R4 <= 0;
end

always @(posedge CLK) begin   //Generate Toggle Wave
    if(R5 == 0 && CLR_IN)
	    R5 <= 1;
	else if(R5 == 1 && CLR_IN)
		R5 <= 0;
end

always @(posedge CLK) begin   //Generate Toggle Wave
    if(R6 == 0 && QUE_IN)
	    R6 <= 1;
	else if(R6 == 1 && QUE_IN)
		R6 <= 0;
end


always @( posedge CLK) begin //
	  if(RST)
		 cur <= READY;
	  else
		 cur <= nxt;
end



always @(posedge CLK)begin //output
    if(cur == READY)
        READY_OUT <= READY_IN;
    if(cur == INPUT)begin    
        SEL_OUT <= SEL_IN;
        DEC_OUT <= DEC_IN;
        CLR_OUT <= CLR_IN;
    end
end


reg NEED_1SEC;//タイマーを動かすためのフラグ

always @(posedge  CLK) begin
    case(cur)
      READY:    STATE <= 4'b0010;//入力モジュールに現在の状態をわたす。
      QUESTION: STATE <= 4'b0011;
      INPUT:    STATE <= 4'b0100;
      WRONG:    STATE <= 4'b0111;
      GOOD:     STATE <= 4'b1000;
      OUCH:     STATE <= 4'b1001;
      DRAW:     STATE <= 4'b0110;
      WIN:      STATE <= 4'b1010;
      LOSE:     STATE <= 4'b1011; 
  endcase
end

always @(posedge  CLK) begin
  NEED_1SEC <= 0;
    case(cur)
      WRONG:   NEED_1SEC <= 1; 
      GOOD:    NEED_1SEC <= 1;
      OUCH:    NEED_1SEC <= 1; 
      DRAW:    NEED_1SEC <= 1; 
      WIN:     NEED_1SEC <= 1; 
      LOSE:    NEED_1SEC <= 1;  
  endcase
end




always @(posedge CLK)begin
    
    case(cur)   
        READY: 
                if(OK_IN && QUE) //二人ともスタート押した、かつ入力モジュールに問題が格納されている
                    nxt <= QUESTION; //問題表示
                else
                    nxt <= READY;

        QUESTION:
                   if(R6 == 1 && QUE) //入力画面に遷移するボタン押す、かつ入力モジュールに問題が格納されている
                    nxt <= INPUT;
                   else 
                    nxt <= QUESTION; 
        
        INPUT: 
                if(R6 == 0 && QUE)
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
        
    endcase
end


reg [25:0] cnt;
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

assign EN1HZ = (cnt==26'd49_999_999);

endmodule