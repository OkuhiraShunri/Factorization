<<<<<<< HEAD
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
=======
module DB (
    input  CLK,RST,
    input  [2:0]RANDOM, //0 ~ 11 まで
    output reg [25:0] QUESTION
);

 
 reg [25:0] Q_table[0:31];   //36bitを32個
 reg [2:0] ra;

 initial begin
 ra = 0;



 //2bit 難易度　4bit*3　問題3桁 10bit 答え 6桁
//答え数列　-,2,3,5,7,11,13,17,19,23
//         0,1,2,3,4, 5, 6, 7, 8, 9

 Q_table[0] =  010000011110 0010 0011 0101;
                 //難易度00 問題11110=>30 答え　2*3*5,- - -
 Q_table[1] =  01 0001000010 0010 0011 1011;
                 //難易度00 問題1000010=>66 答え 2 3 11 - - -
 Q_table[2] =  01 0000101010 0010 0011 0111;
                  //難易度　01  101010 => 42  - - - 2 3 7  
 Q_table[3] =  01 0001001011 0011 0101 0101;
                  //           1001011 => 75
 Q_table[4] =  10 0001100110 0111 0011 0010;
                    //難易度　2 102   17 3 2
 Q_table[5] =  11 1101101010 1001 1000 0001;
                    //難易度　3 874  23 19 2
//assign Q_table[6]

//assign Q_table[7]
 end

always @( posedge CLK)begin    
ra = RANDOM;
QUESTION = Q_table[ra]; 

>>>>>>> 93dac56dcb7ebc0469186f4905017b0a7127d620
end

endmodule