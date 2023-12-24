module SEG7DEC_5(//
     //input CLK,
      input [2:0] char_num, 
     input [3:0] STATE,
     input [3:0] DIN,//SEG_Q??4bit????????
     input [3:0] QUE,
     output reg [6:0] nHEX
);

localparam  READY = 4'b0010, QUESTION = 4'b0011, INPUT = 4'b0100, DRAW = 4'b0110
            , WRONG = 4'b0111, GOOD = 4'b1000, OUCH = 4'b1001, WIN = 4'b1010, LOSE = 4'b1011;

always @* begin
    if(STATE == READY)begin
        case(char_num)
            3'b000:    nHEX = 7'b1001111; //はずれ
            3'b001:    nHEX = 7'b0011111; //はずれ
            3'b010:    nHEX = 7'b1100111; //はずれ
            3'b011:    nHEX = 7'b0101111; //R

        endcase
    end
    else if(STATE == INPUT)begin//INPUT
        case(DIN)
            4'h0:	nHEX = 7'b0111111;//??
            4'h1:	nHEX = 7'b0100100;//2
            4'h2:	nHEX = 7'b0110000;//3
            4'h3:	nHEX = 7'b0010010;//5
            4'h4:	nHEX = 7'b1011000;//7
            4'h5:	nHEX = 7'b1111001;//1
            4'h6:	nHEX = 7'b0110000;//3
            4'h7:	nHEX = 7'b1011000;//7
            4'h8:	nHEX = 7'b0010000;//9
            4'h9:	nHEX = 7'b0110000;//3
            default:nHEX = 7'b1111111;//?????
        endcase
    end
    else begin
        nHEX = 7'b1111111;//nothing
    end

end



endmodule