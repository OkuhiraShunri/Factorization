module test_check(
    input CLK, RST,
    input [1:0] KEY,//KEY[0]は間違い回答を送る。KEY[1]は正解回答を送る
    output [1:0] LEDR
);

wire [1:0] bout;
wire [35:0] num;    
wire [23:0] w_check;
wire [1:0] w_result;

btn_in b0(.CLK(CLK), .RST(RST), .nBIN(KEY), .BOUT(bout));
pro_in p0(.CLK(CLK), .RST(RST), .num_array(num), .key(bout), .check(w_check));
testDB db(.CLK(CLK), .RST(RST), .num_array(num));
check c0(.CLK(CLK), .RST(RST), .check_in(w_check), .num_array(num), .result(w_result));
LED l0(.CLK(CLK), .RST(RST), .result_in(w_result), .LED(LEDR[0]));
LED2 l1(.CLK(CLK), .RST(RST), .result_in(w_result), .LED(LEDR[1]));




endmodule