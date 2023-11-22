module DB(
input CLK,RST,
input [3:0] NUM_IN,//問題番号受け取り
output reg [35:0] NUM_ARRAY,//入力モジュールにわたす
output reg [??] ANSER,//CHECKモジュールにわたす
output reg [??] LEVEL
);

reg [35:0] QUESTION [9:0]; //36bitのレジスタを10個

initial begin
    QUESTION[0] <= 36'b100000100100000000000010001000110011;//2進数でなく10進数で格納させたい
    QUESTION[1] <= 3

end

always@(posedge CLK)begin
    if(RST)begin
        NUM_ARRAY <= 36'b0;
    end
    else begin
        NUM_ARRAY <= QUESTION[NUM_IN];
        ANSER <= QUESTION[NUM_IN][??]//ここで配列に対してビットの指定はどのようにやる？
        LEVEL <= QUESTION[NUM_IN][??]
    end
end

endmodule