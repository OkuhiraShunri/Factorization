module SEG7DEC_1(
     //input CLK,
     input [3:0] STATE,
     input [3:0] DIN,//SEG_Qの値4bitをここで受信する
     input [3:0] QUE,
     output reg [6:0] nHEX
);


/*always @* begin
    case(STATE)
        4'b0010 : nHEX = 7'b1111011;
        4'b0011 : //nHEX = 7'b1000110;
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
                //default:nHEX = 7'b1111111;
            endcase
        4'b0100 :
            case(DIN)
                4'h0:	nHEX = 7'b0111111;//横棒
                4'h1:	nHEX = 7'b0100100;//2
                4'h2:	nHEX = 7'b0110000;//3
                4'h3:	nHEX = 7'b0010010;//5
                4'h4:	nHEX = 7'b1011000;//7
                4'h5:	nHEX = 7'b1111001;//1
                4'h6:	nHEX = 7'b0110000;//3
                4'h7:	nHEX = 7'b1011000;//7
                4'h8:	nHEX = 7'b0010000;//9
                4'h9:	nHEX = 7'b0110000;//3
                //default:nHEX = 7'b1111111;//光ってない
            endcase
    endcase
    
end*/






always @* begin
    if(STATE == 4'b0010)begin//READY
        nHEX = 7'b1111011;
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
            4'h0:	nHEX = 7'b0111111;//横棒
            4'h1:	nHEX = 7'b0100100;//2
            4'h2:	nHEX = 7'b0110000;//3
            4'h3:	nHEX = 7'b0010010;//5
            4'h4:	nHEX = 7'b1011000;//7
            4'h5:	nHEX = 7'b1111001;//1
            4'h6:	nHEX = 7'b0110000;//3
            4'h7:	nHEX = 7'b1011000;//7
            4'h8:	nHEX = 7'b0010000;//9
            4'h9:	nHEX = 7'b0110000;//3
            default:nHEX = 7'b1111111;//光ってない
        endcase
    end
    //else nHEX = 7'b1111111;

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
        4'h0:	nHEX = 7'b0111111;//横棒
        4'h1:	nHEX = 7'b0100100;//2
        4'h2:	nHEX = 7'b0110000;//3
        4'h3:	nHEX = 7'b0010010;//5
        4'h4:	nHEX = 7'b1011000;//7
        4'h5:	nHEX = 7'b1111001;//1
        4'h6:	nHEX = 7'b0110000;//3
        4'h7:	nHEX = 7'b1011000;//7
        4'h8:	nHEX = 7'b0010000;//9
        4'h9:	nHEX = 7'b0110000;//3
        default:nHEX = 7'b1111111;//光ってない
    end
   endcase
end*/





endmodule