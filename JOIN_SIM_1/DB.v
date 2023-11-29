module DB (
    input  CLK,
    input  [3:0] NUM_IN, //0 ~ 11 ??
    output reg [23:0] QUESTION
);

 reg [23:0] Q_table[8:0];   //26bit?32?




 initial begin
    //QUESTION <= 24'b0;
    
    Q_table[0] <=  24'b000000000000000000000000;
                    //000000110000?4bit????0000 0011 0000?????????????0,3,0????????????????????????
    Q_table[1] <=  24'b000000100111001000100010;
                    //???00 ??=>27 ?? 3 3 3 - - -
    Q_table[2] <=  24'b000001000010000100100100;
                    //????01  101010 => 42  - - - 2 3 7=>1 2 4???  

    Q_table[3] <=  24'b000000110000000100100011;
               
    Q_table[4] <=  24'b000000100111001000100010;
                       
    Q_table[5] <=  24'b000001000010000100100100;
                        

    Q_table[6] <=  24'b000000110000000100100011;

    Q_table[7] <=  24'b000000100111001000100010;

    Q_table[8] <=  24'b000001000010000100100100;

end



always @(posedge CLK)begin
  if(NUM_IN == 4'b0)begin
    QUESTION <= Q_table[0];
  end
  else if(NUM_IN != 4'b0)begin
    QUESTION <= Q_table[NUM_IN];
  end
end
/*always @( posedge CLK)begin    
    QUESTION <= Q_table[NUM_IN];
end*/

endmodule