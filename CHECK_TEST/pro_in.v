module pro_in(
input CLK,RST,
input [35:0] num_array,
input [1:0] key,
output reg [23:0] check
);

reg [23:0] correct;
reg [23:0] wrong;
//eg [11:0] problem;

//problem <= num_array[35:24];
initial begin
check <= 24'b0;    
correct <= 24'b000000000010001000110011;//正解の回答
// 0 0 2 2 3 3 
wrong <= 24'b000000000000000000000001;//間違いの回答
end

always @( posedge CLK)begin
    if(key[1])
     check <= correct;//正しい回答を出力
    else if(key[0])
     check <= wrong;//間違いの回答を出力
    else
     //check <= problem;//問題を出力
     check <= check;
end
endmodule