module WIN_LOSE ( //どっちの正解が早かったかというモジュール
    input   CLK,RST,
    input   [1:0] MINE ,//正誤判定のoutput
    input   [1:0] ENEMY, //相手の正解を受け取る   1が正解
    output  reg [2:0] WL_OUT //HP管理に送られる 00 無入力　01 自分勝ち 10　相手勝ち　11　ドロー
);

initial begin
 WL_OUT <= 2b'00;
 end   

always @(posedge CLK) begin
    if(ENEMY && MINE)begin
        WL_OUT <= 11; //ドロー
    else if(ENEMY == 1 && MINE == 0)
        WL_OUT <= 10; //相手勝ち
    else if(MINE  == 1 && ENEMY == 0)
        WL_OUT <= 01; //自分勝ち
    else
        WL_OUT <= 00; //無入力、その他
    end            
end

    
endmodule