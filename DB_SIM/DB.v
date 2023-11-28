module DB (
    input  CLK,
    input  [3:0] NUM_IN, //0 ~ 11 ??
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
 reg [23:0] Q_table[8:0];   //26bit?32?
 //reg [2:0] ra;



 initial begin
    //ra <= 0;
    //2bit ????4bit*3???3? 10bit ?? 6?
    //?????-,2,3,5,7,11,13,17,19,23
    //         0,1,2,3,4, 5, 6, 7, 8, 9

    Q_table[0] <=  24'b0000_0011_0000_0001_0010_0011;
                    //000000110000?4bit????0000 0011 0000?????????????0,3,0????????????????????????
    Q_table[1] <=  24'b0000_0010_0111_0010_0010_0010;
                    //???00 ??=>27 ?? 3 3 3 - - -
    Q_table[2] <=  24'b0000_0100_0010_0001_0010_0100;
                    //????01  101010 => 42  - - - 2 3 7=>1 2 4???  

    Q_table[3] <=  24'b0000_0011_0000_0001_0010_0011;
               
    Q_table[4] <=  24'b0000_0010_0111_0010_0010_0010;
                       
    Q_table[5] <=  24'b0000_0100_0010_0001_0010_0100;
                        

    Q_table[6] <=  24'b0000_0011_0000_0001_0010_0011;

    Q_table[7] <=  24'b0000_0010_0111_0010_0010_0010;

    Q_table[8] <=  24'b0000_0100_0010_0001_0010_0100;

end

always @( posedge CLK)begin    
    //ra = NUM_IN;
    QUESTION <= Q_table[NUM_IN];
   // QUESTION <=  000001000010000100100100; 
end

endmodule