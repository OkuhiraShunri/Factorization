module DB (
    input  CLK,
    input  [3:0] NUM_IN, //0 ~ 11 まで
    output reg [23:0] QUESTION
);

 /*always @(posedge CLK) begin
    if(OK)begin
       QUESTION <=  0000_0100_0010_0001_0010_0100;
    end
    else begin
       QUESTION <= QUESTION; 
    end
 end*/
 reg [23:0] Q_table[10:0];   //26bitを32個
 //reg [2:0] ra;



 initial begin
    //ra <= 0;
    //2bit 難易度　4bit*3　問題3桁 10bit 答え 6桁
    //答え数列　-,2,3,5,7,11,13,17,19,23
    //         0,1,2,3,4, 5, 6, 7, 8, 9

    Q_table[0] <=  24'b0000_0000_0000_0000_0000_0000;
                    //000000110000は4bit区切りで0000 0011 0000である。そして、各ビットは0,3,0をあらわす。問題を直接二進数にして格納はしない。
    Q_table[1] <=  24'b0000_0010_0111_0010_0010_0010;//QUE > 27 ANS > 2 2 2
                    
    Q_table[2] <=  24'b0000_0100_0010_0001_0010_0100;//QUE > 42 ANS > 1 2 4

    Q_table[3] <=  24'b0000_0011_0000_0001_0010_0011;//QUE > 30 ANS > 
               
    Q_table[4] <=  24'b0011_0100_0011_0010_0010_0010;//QUE > 343 ANS > 4 4 4 
                       
    Q_table[5] <=  24'b0001_0110_0001_0001_0010_0100;//QUE > 161 ANS >                        

    Q_table[6] <=  24'b0001_1001_0101_0001_0010_0011;//QUE > 195 ANS > 

    Q_table[7] <=  24'b0000_0101_0111_0010_0010_0010;//QUE > 57 ANS > 

    Q_table[8] <=  24'b0010_0100_0111_0001_0010_0100;//QUE > 247 ANS > 

    Q_table[9] <=  24'b0000_0101_0111_0010_0010_0010;//QUE > 57 ANS > 

    Q_table[10] <=  24'b0010_0100_0111_0001_0010_0100;//QUE > 247 ANS > 



end

// always @( posedge CLK)begin    
//     //ra = NUM_IN;
//     QUESTION <= Q_table[NUM_IN];
//    // QUESTION <=  000001000010000100100100; 
// end

// always @(posedge CLK)begin
//   if(NUM_IN == 4'b0)begin
// 	QUESTION <= Q_table[0];//questionのwireの不定値を防止
//   end
//   else if(NUM_IN != 4'b0)begin
//     QUESTION <= Q_table[NUM_IN];
//   end
// end

always @(posedge CLK) begin
   if(NUM_IN != 4'b0)begin
      QUESTION <= Q_table[NUM_IN];
   end
   else begin
      QUESTION <= 24'b0;
   end
   
end

endmodule