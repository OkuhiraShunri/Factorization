module MANAGE_HP(
input CLK,RST,
input [2:0] HP_IN,  //win_loseのoutput 00 無入力　01 自分勝ち 10　相手勝ち　11　ドロー
input [35:0] DB_IN, //DBから数列を取得
output reg [2:0] RESULT,// 00 無出力　01 相手HP0 (自分の勝ち)   10　自分のHP0 (相手の勝ち) 　
output reg [3:0] HP_OUT //HPをoutputするレジスタ
);

reg [3:0]MY_HP; 
reg [3:0]ENEMY_HP;
reg [1:0] NUM; //難易度　2bit を取り出す
reg [3:0] LEVEL; //難易度 HPから引く　3bit

initial begin//HPの初期値10
MY_HP <= 3'd10;
ENEMY_HP <= 3'd10;
end


//一度HPが0になった後HPを10に戻す処理
//always @( posedge CLK)begin 
//state が最後の時
//MY_HP <= 3'd10;
//ENEMY_HP <= 3'd10;
//end

always @( posedge CLK)begin
 NUM = DB_IN[35:34];
 LEVEL  = NUM; //3bitに拡張
end


always @( posedge CLK)begin //HPを減らしていく
    if(HP_IN = 2'b01)begin //先に自分が正解
        ENEMY_HP <= ENEMY_HP - LEVEL;
     else if(HP_IN = 2'b10) //相手が先に正解
        MY_HP <= MY_HP - LEVEL;
     end
     HP_OUT <= MY_HP; //自分のHPをoutput
 end

always @( posedge CLK)begin  //最終的にHPが0になった時
    if(ENEMY_HP == 0)begin //相手HP0 自分の勝ち
        RESULT <= 2'b10;
    else if(MY_HP == 0) //自分HP0 自分負け
        RESULT <= 2'b01;
    else
        RESULT <= 2'b00;  //それ以外
    end  

 end   


endmodule