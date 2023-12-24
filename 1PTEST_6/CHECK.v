module CHECK(
input CLK,RST,
input [3:0] ANSWER_1, ANSWER_2, ANSWER_3,//1P回答 12bit
input [23:0] QUESTION,//DBからの問題と答え情報 24bit
//input [3:0] STATE,
output reg [1:0] RESULT//LEDにわたす
);

reg [3:0] answer_1, answer_2, answer_3;
reg [3:0] check_1, check_2, check_3;

// always@(posedge CLK)begin
//   if(STATE == 4'b0111)begin//WRONG  
//     answer_1 <= 4'b0;
//     answer_2 <= 4'b0;
//     answer_3 <= 4'b0;
//   end
//   else begin
//   answer_1 <= ANSWER_1;
//   answer_2 <= ANSWER_2;
//   answer_3 <= ANSWER_3;
//   check_1 <= QUESTION[3:0];
//   check_2 <= QUESTION[7:4];
//   check_3 <= QUESTION[11:8];
//   end
// end

initial begin
  answer_1 <= 4'b0;
  answer_2 <= 4'b0;
  answer_3 <= 4'b0;
  check_1 <= 4'b0;
  check_2 <= 4'b0;
  check_3 <= 4'b0;
  RESULT <= 2'b00;
end

always @(posedge CLK) begin
  if(RST)begin
    answer_1 <= 4'b0;
    answer_2 <= 4'b0;
    answer_3 <= 4'b0;
    check_1 <= 4'b0;
    check_2 <= 4'b0;
    check_3 <= 4'b0;
  end
  else begin
    answer_1 <= ANSWER_1;
    answer_2 <= ANSWER_2;
    answer_3 <= ANSWER_3;
    check_1 <= QUESTION[3:0];
    check_2 <= QUESTION[7:4];
    check_3 <= QUESTION[11:8];
  end
end




always @(posedge CLK)begin
  if(answer_1 == 4'b0 && answer_2 == 4'b0 && answer_3 == 4'b0) begin 
    //RESULT <= RESULT;
    RESULT <= 2'b00;
  end
  else if(RST)
    RESULT <= 2'b00;
  else if((answer_1 == check_1) && (answer_2 == check_2) && (answer_3 == check_3))//正しい
    RESULT <= 2'b01;
  else if((answer_1 != check_1) || (answer_2 != check_2) || (answer_3 != check_3))//誤り
    RESULT <= 2'b11;    
  else 
    RESULT <= 2'b00; //正誤判定するまえはずっとゼロ出力
  
end


endmodule