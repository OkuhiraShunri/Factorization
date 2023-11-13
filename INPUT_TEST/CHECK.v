module CHECK(
input CLK,RST,
input [3:0] COUNT1_IN, COUNT2_IN, COUNT3_IN,
output reg [1:0] RESULT//LEDにわたす
);


reg [3:0] ANSWER_CHECK1, ANSWER_CHECK2, ANSWER_CHECK3;

always@(posedge CLK)begin

ANSWER_CHECK1 <= COUNT1_IN;
ANSWER_CHECK2 <= COUNT2_IN;
ANSWER_CHECK3 <= COUNT3_IN;
end


always @(posedge CLK)begin
  if(ANSWER_CHECK1 == 0 && ANSWER_CHECK2 == 0 && ANSWER_CHECK3 == 0) 
    RESULT <= RESULT;
  else if(RST)
    RESULT <= 2'b00;
  else if(ANSWER_CHECK1 == 4'd3 && ANSWER_CHECK2 == 4'd5 && ANSWER_CHECK3 == 4'd9)//correct
    RESULT <= 2'b11;
  else if(ANSWER_CHECK1 != 4'd3 || ANSWER_CHECK2 != 4'd5 || ANSWER_CHECK3 != 4'd9)//wrong
    RESULT <= 2'b01;    
  else
    RESULT <= 2'b00;  
end


endmodule