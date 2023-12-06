module DB (
    input  CLK,
    input  [3:0] NUM_IN, //0 ~ 11 ??
    output reg [23:0] QUESTION
);

 reg [23:0] Q_table[10:0];   //26bit?32?




 initial begin
    //QUESTION <= 24'b0;
    
    // Q_table[0] <=  24'b000000000000000000000000;
    //                 //000000110000?4bit????0000 0011 0000?????????????0,3,0????????????????????????
    // Q_table[1] <=  24'b000000100111001000100010;
    //                 //???00 ??=>27 ?? 3 3 3 - - -
    // Q_table[2] <=  24'b0000_0100_0010_000100100100;
    //                 //????01  101010 => 42  - - - 2 3 7=>1 2 4???  

    // Q_table[3] <=  24'b000000110000000100100011;
               
    // Q_table[4] <=  24'b000000100111001000100010;
                       
    // Q_table[5] <=  24'b000001000010000100100100;
                        

    // Q_table[6] <=  24'b000000110000000100100011;

    // Q_table[7] <=  24'b000000100111001000100010;

    // Q_table[8] <=  24'b000001000010000100100100;

    Q_table[0] <=  24'b0000_0000_0000_0000_0000_0000;
                    //000000110000は4bit区切りで0000 0011 0000である。そして、各ビットは0,3,0をあらわす。問題を直接二進数にして格納はしない。
    Q_table[1] <=  24'b0000_0010_0111_0010_0010_0010;//QUE > 27 ANS > 2 2 2
                    
    Q_table[2] <=  24'b0000_0100_0010_0100_0010_0001;//QUE > 42 ANS > 4 2 1

    Q_table[3] <=  24'b0000_0011_0000_0011_0010_0001;//QUE > 30 ANS > 3 2 1 
               
    Q_table[4] <=  24'b0011_0100_0011_0100_0100_0100;//QUE > 343 ANS > 4 4 4 
                       
    Q_table[5] <=  24'b0001_0110_0001_0000_1001_0100;//QUE > 161 ANS > 0 9 4                        

    Q_table[6] <=  24'b0001_1001_0101_0110_0011_0010;//QUE > 195 ANS > 6 3 2 

    Q_table[7] <=  24'b0000_0101_0111_0000_0100_0010;//QUE > 57 ANS > 0 8 2 

    Q_table[8] <=  24'b0010_0100_0111_0000_0100_0110;//QUE > 247 ANS > 0 8 6 

    Q_table[9] <=  24'b0000_0101_0001_0000_0111_0010;//QUE > 51 ANS > 0 7 2 

    Q_table[10] <=  24'b0001_0100_0100_0100_0010_0001;//QUE > 144 ANS > 8 2 1 

end



// always @(posedge CLK)begin
//   if(NUM_IN == 4'b0)begin
//     QUESTION <= Q_table[0];
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