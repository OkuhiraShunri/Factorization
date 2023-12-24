module SEG7DEC_2(
     //input CLK,
     input [3:0] STATE,
     input [3:0] DIN,//SEG_Q??4bit????????
     input [3:0] QUE,
     output reg [6:0] nHEX
);

always @* begin
     if(STATE == 4'b0010)begin//READY
         nHEX = 7'b0100001;//d
     end
    else if(STATE == 4'b0011)begin//QUESTION
        case(QUE)
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
        //nHEX = 7'b0000000;
    end
    else if(STATE == 4'b0100)begin//INPUT
        case(DIN)
            4'h0:	nHEX = 7'b0111111;//??
            4'h1:	nHEX = 7'b0111111;//??
            4'h2:	nHEX = 7'b0111111;//??
            4'h3:	nHEX = 7'b0111111;//??
            4'h4:	nHEX = 7'b0111111;//??
            4'h5:	nHEX = 7'b1111001;//1
            4'h6:	nHEX = 7'b1111001;//1
            4'h7:	nHEX = 7'b1111001;//1
            4'h8:	nHEX = 7'b1111001;//1
            4'h9:	nHEX = 7'b0100100;//2
            default:nHEX = 7'b1111111;
        endcase
    end
    else if(STATE == 4'b1000)begin//GOOD
        nHEX = 7'b1000000;//O
    end
    else if(STATE == 4'b0111)begin//WRONG(fail)
        nHEX = 7'b1001111;//i
    end
    else if(STATE == 4'b1001)begin//OUCH
        nHEX = 7'b1000110;//C
    end
    else if(STATE == 4'b0110)begin//DRAW(tie)
        nHEX = 7'b1001111;//i
    end
    else if(STATE == 4'b1010)begin//WIN(beat)
        nHEX = 7'b0001000;//A
    end
    else if(STATE == 4'b1011)begin//LOSE
        nHEX = 7'b0010010;//S
    end
end




/*always @* begin
	case(STATE)
    QUESTION:
    begin
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
    end
    INPUT:
    begin
        4'h0:	nHEX = 7'b0111111;//??
		4'h1:	nHEX = 7'b0111111;//??
		4'h2:	nHEX = 7'b0111111;//??
		4'h3:	nHEX = 7'b0111111;//??
		4'h4:	nHEX = 7'b0111111;//??
		4'h5:	nHEX = 7'b1111001;//1
		4'h6:	nHEX = 7'b1111001;//1
		4'h7:	nHEX = 7'b1111001;//1
		4'h8:	nHEX = 7'b1111001;//1
		4'h9:	nHEX = 7'b0100100;//2
		default:nHEX = 7'b1111111;
    end
   endcase
end*/

endmodule