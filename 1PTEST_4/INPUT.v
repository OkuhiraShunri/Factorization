module INPUT(
  input [2:0] SEL,//SW[9] = SEL[2]:HEX[4], SW[8] = SEL[1]:HEX[2], SW[7] = SEL[0]:HEX[0]
  input [3:0] STATE,
  input [23:0] QUESTION,
  input  DEC, CLK, RST, CLR,//DEC???


	 //input [1:0] RESULT, 
  output reg [3:0] SEG1, SEG2, SEG3, SEG4, SEG5, SEG6,
  output reg [3:0] SEG1_Q, SEG2_Q, SEG3_Q, 
	output reg [3:0] COUNT1_OUT, COUNT2_OUT, COUNT3_OUT,
  output reg QUE_OK,//INPUT?????????????????????????
  output LED
);


reg [3:0] COUNT1, COUNT2, COUNT3;

initial begin
      COUNT1 <= 4'b0;//4bit????0??9??????????
      COUNT2 <= 4'b0;
      COUNT3 <= 4'b0;
      SEG1 <= 4'b0;
      SEG2 <= 4'b0;
      SEG3 <= 4'b0;
      SEG4 <= 4'b0;
      SEG5 <= 4'b0;
      SEG6 <= 4'b0;
      SEG1_Q <= 4'b0;
      SEG2_Q <= 4'b0;
      SEG3_Q <= 4'b0;


      COUNT1_OUT <= 4'b0;
      COUNT2_OUT <= 4'b0;
      COUNT3_OUT <= 4'b0;

end




reg [11:0] QUESTION_r;// ??? + ???????

initial begin
  QUESTION_r <= 12'b0;//??????????
end




always @(posedge CLK)begin
  if((STATE == 4'b0010 && QUESTION != 24'b0)|| STATE == 4'b0011 || STATE == 4'b0100 || STATE == 4'b0111)begin//READY, QUESTION, INPUT, WRONG
    QUESTION_r <= QUESTION[23:12];

  end
  else begin
    QUESTION_r <= 12'b0;
  end
end


always @(posedge CLK)begin
  if(QUESTION_r == 12'b0)begin
    QUE_OK <= 0;
  end
  else if(QUESTION_r != 12'b0)begin//QUESTION_r????????
    QUE_OK <= 1;
  end
end

// initial begin
//   QUE_OK <= 1;
// end


reg LED_r;
initial begin
  LED_r <= 0;
end
always @(posedge CLK) begin
  if(QUE_OK)begin
    LED_r <= 1;
  end
  else begin
    LED_r <= 0;
  end
end

assign LED = LED_r;




always @(posedge CLK) begin//?
   if(STATE == 4'b0100)begin
      SEG1 <= COUNT1; //INPUT
      SEG2 <= COUNT1;

      SEG3 <= COUNT2;
      SEG4 <= COUNT2;
      
      SEG5 <= COUNT3;
      SEG6 <= COUNT3;
   end
   else begin
      SEG1 <= 4'b0;
      SEG2 <= 4'b0;

      SEG3 <= 4'b0;
      SEG4 <= 4'b0;
      
      SEG5 <= 4'b0;
      SEG6 <= 4'b0;
    end
end
     


always @(posedge CLK) begin
   if(STATE == 4'b0011)begin
      SEG1_Q <= QUESTION_r[3:0];
      SEG2_Q <= QUESTION_r[7:4];
      SEG3_Q <= QUESTION_r[11:8];
   end
   else begin
      SEG1_Q <= 4'b0;
      SEG2_Q <= 4'b0;
      SEG3_Q <= 4'b0;
    end
end


always @(posedge CLK) begin//COUNT??????
  if(STATE == 4'b0100)begin//STATE?INPUT????????????
    if(SEL[0])begin
      COUNT1 <= COUNT1 + 1;
        if(COUNT1 == 9)begin//9??????1???
          COUNT1 <= 1;
        end
    end	 
    else if(SEL[1])begin
      COUNT2 <= COUNT2 + 1;
        if(COUNT2 == 9)begin
          COUNT2 <= 1;
        end
    end	  
    else if(SEL[2])begin
      COUNT3 <= COUNT3 + 1;
        if(COUNT3 == 9)begin
          COUNT3 <= 1;
        end
    end
    else if(CLR)begin//CLR??
      COUNT1 <= 0;
      COUNT2 <= 0;
      COUNT3 <= 0;
    end
  end
  else if(STATE == 4'b0110 || STATE == 4'b1000 || STATE == 4'b1001 || STATE == 4'b1010 || STATE == 4'b1011 || STATE == 4'b0111)begin//自分の回答をリセット
  //DRAW GOOD OUCH WIN  LOSE  wrong //modif
      
      COUNT1 <= 0;
      COUNT2 <= 0;
      COUNT3 <= 0;
  end
end

always @(posedge CLK)begin//????????????????????????????????????????STATE?INPUT??????????
	if(STATE == 4'b0100)begin//STATE == INPUT
    if(DEC)begin
      COUNT1_OUT <= COUNT1;
      COUNT2_OUT <= COUNT2;
      COUNT3_OUT <= COUNT3;
    end
    // else begin
    //   COUNT1_OUT <= COUNT1_OUT;
    //   COUNT2_OUT <= COUNT2_OUT;
    //   COUNT3_OUT <= COUNT3_OUT;
    // end
  end
  else if(STATE == 4'b0111 || STATE == 4'b1000) begin
     COUNT1_OUT <= 4'b0;
     COUNT2_OUT <= 4'b0;
     COUNT3_OUT <= 4'b0;
  end
  else begin
      COUNT1_OUT <= COUNT1_OUT;
      COUNT2_OUT <= COUNT2_OUT;
      COUNT3_OUT <= COUNT3_OUT;
  end
end

endmodule