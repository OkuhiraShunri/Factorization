module WIN_LOSE ( //どっちの正解が早かったかというモジュール
    input   CLK,RST,
    input [1:0] MINE ,//正誤判定のoutput
    //input   ENEMY, //相手の正解を受け取る   1が正解 [1:0]が不要かも
    output  reg [1:0] WL_OUT //HP管理に送られる 00 無入力　01 自分勝ち 10　相手勝ち　11　ドロー
);

reg [1:0] ENEMY;
initial begin
  ENEMY <= 2'b00;
  WL_OUT <= 2'b00;
 end   

always @(posedge CLK) begin
    if(ENEMY == 01 && MINE == 01)
        WL_OUT <= 2'b11; //ドロー
    else if(ENEMY == 01 && MINE != 01)
        WL_OUT <= 2'b10; //相手勝ち
    else if(MINE  == 01 && ENEMY != 01)
        WL_OUT <= 2'b01; //�分勝ち
    else
        WL_OUT <= 2'b00; //無入力、その他 勝利判定してないときはWL_OUTは00出力
          
end

    
endmodule