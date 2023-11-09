module check(
input CLK,RST,
input [23:0] check_in,
input [35:0] num_array,
output reg [1:0] result//LEDにわたす
);

reg [23:0] answer;
reg [23:0] answer_check;

always@(posedge CLK)begin
answer <= num_array[23:0];//回答切り出し

answer_check <= check_in;
end


always @(posedge CLK)begin
  if(answer_check == 24'b0) begin
    result <= result;
  end
  else if(RST)
    result <= 2'b00;
  else if(answer == answer_check)
    result <= 2'b01;
  else if(answer != answer_check)
    result <= 2'b11;    
  else
    result <= 2'b00;  
end


endmodule