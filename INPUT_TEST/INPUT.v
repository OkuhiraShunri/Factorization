module INPUT(
    input [2:0] SEL_IN,//SW[9] = SEL_IN[2]:HEX[4], SW[8] = SEL_IN[1]:HEX[2], SW[7] = SEL_IN[0]:HEX[0]
    input INC_IN, CLR_IN, CLK, RST
    output reg [3:0] SEG1, SEG2, SEG3, SEG4, SEG5, SEG6;

);

reg [7:0] num[9:0]//8bitのレジスタnumが9個

initial begin//正誤判定用
    r_QUE <= QUE_IN;
    r_STATE <= STATE_IN;

    num[0] <= 8'd0;
    num[1] <= 8'd2;
    num[2] <= 8'd3;
    num[3] <= 8'd5;
    num[4] <= 8'd7;
    num[5] <= 8'd11;
    num[6] <= 8'd13;
    num[7] <= 8'd17;
    num[8] <= 8'd19;
    num[9] <= 8'd23;
    
end




reg [11:0] ANS_SHEET;//回答用紙レジスタ
//reg [3:0] ANS


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
end


reg [3:0] COUNT = 0;//4bitの理由は0から9までのカウントのため
always @(posedge CLK) begin
    if(INC_IN && SEL_IN != 3'b0)begin
        COUNT = COUNT + 1;
        if(COUNT == 10)begin
            COUNT = 0;
        end    
    end    
end

always @(posedge CLK)begin
    if(COUNT > 4)begin


    end


end    


endmodule