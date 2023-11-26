module DB (
    input  CLK,RST,OK,
    //input  [3:0] NUM_IN, //0 ~ 11 まで
    output reg [23:0] QUESTION
);

 always @(posedge CLK) begin
    if(OK)begin
       QUESTION <=  0000_0100_0010_0001_0010_0100;
    end
    else begin
       QUESTION <= QUESTION; 
    end
 end
 /*reg [23:0] Q_table[8:0];   //26bitを32個
 //reg [2:0] ra;



 initial begin
    //ra <= 0;
    //2bit 難易度　4bit*3　問題3桁 10bit 答え 6桁
    //答え数列　-,2,3,5,7,11,13,17,19,23
    //         0,1,2,3,4, 5, 6, 7, 8, 9

    Q_table[0] <=  0000_0011_0000_0001_0010_0011;
                    //000000110000は4bit区切りで0000 0011 0000である。そして、各ビットは0,3,0をあらわす。問題を直接二進数にして格納はしない。
    Q_table[1] <=  0000_0010_0111_0010_0010_0010;
                    //難易度00 問題=>27 答え 3 3 3 - - -
    Q_table[2] <=  000001000010000100100100;
                    //難易度　01  101010 => 42  - - - 2 3 7=>1 2 4にする  

    Q_table[3] <=  000000110000000100100011;
               
    Q_table[4] <=  000000100111001000100010;
                       
    Q_table[5] <=  000001000010000100100100;
                        

    Q_table[6] <=  0000_0011_0000_0001_0010_0011;

    Q_table[7] <=  000000100111001000100010;

    Q_table[8] <=  000001000010000100100100;

end

always @( posedge CLK)begin    
    //ra = NUM_IN;
    //QUESTION = Q_table[NUM_IN];
    QUESTION <=  000001000010000100100100; 
end*/

endmodule