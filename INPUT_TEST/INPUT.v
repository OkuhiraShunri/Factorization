module INPUT(
    input [2:0] SEL_IN,//SW[9] = SEL_IN[2]:HEX[4], SW[8] = SEL_IN[1]:HEX[2], SW[7] = SEL_IN[0]:HEX[0]
    input INC_IN, CLR_IN, CLK, RST
    output reg [3:0] SEG1, SEG2, SEG3, SEG4, SEG5, SEG6;

);

/*reg [11:0] ANS_SHEET;//回答用紙レジスタ

always@(posedge CLK)begin//ANSの書き込み
    if(SEL_IN[0] == 1)begin
        ANS_SHEET[3:0] <= COUNT; 
    end
    else if(SEL_IN[1] == 1)begin
        ANS_SHEET[7:4] <= COUNT; 
    end
    else if(SEL_IN[2] == 1)begin
        ANS_SHEET[11:8] <= COUNT; 
    end
end*/

always@(posedge CLK)begin
    if(RST | CLR_IN)begin
        SEG1 <= 0;
        SEG2 <= 0;
        SEG3 <= 0;
        SEG4 <= 0;
        SEG5 <= 0;
        SEG6 <= 0;
    end
    else if(SEL_IN[0] == 1)begin
        SEG1 <= COUNT;
        SEG2 <= COUNT;
    end
    else if(SEL_IN[1] == 1)begin
        SEG3 <= COUNT;
        SEG4 <= COUNT;
    end
    else if(SEL_IN[2] == 1)begin
        SEG5 <= COUNT;
        SEG6 <= COUNT;
    end
end



reg [3:0] COUNT = 4'b0;//4bitの理由は0から9までのカウントのため

always @(posedge CLK) begin
    if(INC_IN && SEL_IN != 3'b0)begin//インクリメントボタン押された かつ どこかがセレクトされた
        COUNT <= COUNT + 1;
        if(COUNT == 10)begin
            COUNT = 1;
        end    
    end    
end

endmodule