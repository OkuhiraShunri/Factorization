module CHECK(
input CLK,RST,
input [3:0] ANSWER_1, ANSWER_2, ANSWER_3,//1P回答 12bit
input [23:0] QUESTION,//DBからの問題と答え情報 24bit
output reg [1:0] RESULT//LEDにわたす
);

reg [3:0] answer_1, answer_2, answer_3;
reg [3:0] check_1, check_2, check_3;

always@(posedge CLK)begin
  answer_1 <= ANSWER_1;
  answer_2 <= ANSWER_2;
  answer_3 <= ANSWER_3;
  check_1 <= QUESTION[3:0];
  check_2 <= QUESTION[7:4];
  check_3 <= QUESTION[11:8];
end


always @(posedge CLK)begin
  if(check_1 == 4'b0 && check_2 == 4'b0 && check_3 == 4'b0) begin
    RESULT <= RESULT;
  end
  else if(RST)
    RESULT <= 2'b00;
  else if(answer_1 == check_1 && answer_2 == check_2 && answer_3 == check_3)//正しい
    RESULT <= 2'b01;
  else if(answer_1 != check_1 || answer_2 != check_2 || answer_3 != check_3)//誤り
    RESULT <= 2'b11;    
  else
    RESULT <= 2'b00;//正誤判定するまえはずっとゼロ出力  
end


endmodule