module CHECK(
input CLK,RST,
input [11:0] CHECK_IN,
input [25:0] NUM_ARRAY,
output reg [1:0] RESULT//LEDにわたす
);

reg [11:0] answer;  //正解
reg [11:0] answer_check; //1Pの回答

always@(posedge CLK)begin
  answer <= NUM_ARRAY[11:0];//正解切り出し

  answer_check <= CHECK_IN;
end


always @(posedge CLK)begin
  if(answer_check == 12'b0) begin
    RESULT <= RESULT;
  end
  else if(RST)
    RESULT <= 2'b00;
  else if(answer == answer_check)
    RESULT <= 2'b01;
  else if(answer != answer_check)
    RESULT <= 2'b11;    
  else
    RESULT <= 2'b00;  
end


endmodule