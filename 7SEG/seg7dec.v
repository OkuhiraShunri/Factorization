module seg7dec(
input 	[3:0] DIN,
input   [3:0] STATE,
output reg [6:0] nHEX
);

always @* begin
	case(DIN)
	4'h0:	nHEX = 7'b1000000;
	4'h1:	nHEX = 7'b1111001;
	4'h2:	nHEX = 7'b0100100;
	4'h3:	nHEX = 7'b0110000;
	4'h4:	nHEX = 7'b0011001;
	4'h5:	nHEX = 7'b0010010;
	4'h6:	nHEX = 7'b0000010;
	4'h7:	nHEX = 7'b1011000;
	4'h8:	nHEX = 7'b0000000;
	4'h9:	nHEX = 7'b0010000;
	default:nHEX = 7'b1111111;
   endcase
end

always @* begin
	case(STATE)
	//READY = 4'b0010, QUESTION = 4'b0011, INPUT = 4'b0100, DRAW = 4'b0110
	// , WRONG = 4'b0111, GOOD = 4'b1000, OUCH = 4'b1001, WIN = 4'b1010, LOSE = 4'b1011;
	 4'b0110:  nHEX = 7'b //DRAW 
	 4'b0111: //WRONG
	 4'b1000: //GOOD
	 4'b1001: //OUCH 
	 4'b1010: //WIN
	 4'b1011: //LOSE
	 //D, R A W O N G U C H I L S E
	 //D 0111101
	 //R 1111010
	 //A 1110111
	 //W
	 //O 0011101
	 //N 0010101
	 //G 10
	 //U
	 //C
	 //H
	 //I
	 //L
	 //S
	 //E
	 //t
	endcase
end

endmodule 



