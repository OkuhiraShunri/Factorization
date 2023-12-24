module MANAGE_HP(
input CLK,RST,
input [1:0] HP_IN,  //win_loseのoutput 00 無入力　01 自分勝ち 10　相手勝ち　11　ドロー
output reg [1:0] RESULT,// 00 無出力　01 相手HP0 (自分の勝ち)   10　自分のHP0 (相手の勝ち) 　
output reg [3:0] HP_OUT //HPをoutputするレジスタ
);

reg [3:0]MY_HP; 
reg [3:0]ENEMY_HP;
//reg [1:0] NUM; //難易度　2bit を取り出す
reg [3:0] LEVEL; //難易度 HPから引く　3bit
reg [1:0] cur, nxt;
reg win_f;
reg lose_f;

initial begin//HPの初期値10
MY_HP <= 4'd5;
ENEMY_HP <= 4'd5;
LEVEL <= 4'd1;
cur <= 0;
nxt <= 0;
win_f <= 0;
lose_f <= 0;
end

always @(posedge CLK) begin
    cur <= HP_IN;
end

always @(posedge CLK)begin
    nxt <= cur;
end


//00から10の立ち上がり検出をあとで追加
always @(posedge CLK) begin
    if(RST)begin
        win_f <= 0;
        lose_f <= 0;
    end
    else if(nxt == 2'b00 && cur == 2'b10)begin
        win_f <= 1;
    end
    else if(nxt == 2'b00 && cur == 2'b01)begin
        lose_f <= 1;
    end
    else begin
        win_f <= 0;
        lose_f <= 0;
    end
end

// always @(posedge CLK) begin
//     if(nxt == 2'b00 && cur == 2'b01)begin
//         lose_f <= 1;
//     end
//     // else if(nxt == 2'b00 && cur == 2'b01)begin
//     //     lose_f <= 1;
//     // end
//     else begin
//         //win_f <= 0;
//         lose_f <= 0;
//     end
// end

always @( posedge CLK)begin //HPを減らしていく
    //if(HP_IN == 2'b01) //先に自分が正解
    if(win_f)
        ENEMY_HP <= ENEMY_HP - LEVEL;
        //MY_HP <= MY_HP - LEVEL;
    else if (lose_f) //相手が先に正解
        MY_HP <= MY_HP - LEVEL;
	else if(ENEMY_HP == 4'b0 || MY_HP == 4'b0 || RST)begin
        MY_HP <= 4'd5;
	 	ENEMY_HP <= 4'd5;   
    end
    else
        //HP_OUT <= MY_HP; //自分のHPをoutput
        HP_OUT <= MY_HP;
 end

always @( posedge CLK)begin  //最終的にHPが0になった時
    if(RST)begin
        RESULT <= 2'b00;    
    end
    else if(ENEMY_HP == 4'b0)begin //相手HP0 自分の勝ち
        RESULT <= 2'b10;
	end	  
    else if(MY_HP == 4'b0)begin //自分HP0 自分負け
        RESULT <= 2'b01;
	end
    else
        RESULT <= 2'b00;  //それ以外
      

 end   


endmodule