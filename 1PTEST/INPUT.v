module INPUT(
  input [2:0] SEL,//SW[9] = SEL[2]:HEX[4], SW[8] = SEL[1]:HEX[2], SW[7] = SEL[0]:HEX[0]
  input [3:0] STATE,
  input [23:0] QUESTION,
  input  DEC, CLK, RST, CLR_IN,//DECは決定
	 //input [1:0] RESULT, 
  output reg [3:0] SEG1, SEG2, SEG3, SEG4, SEG5, SEG6,
  output reg [3:0] SEG1_Q, SEG2_Q, SEG3_Q, 
	output reg [3:0] COUNT1_OUT, COUNT2_OUT, COUNT3_OUT,
  output reg QUE_OK,//INPUTモジュールに問題を格納できたと制御部に伝える信号。
  output LED
);

/*
INPUTモジュールの役割は二つ
1. プレイヤーが入力する値(回答)を管理し、それを7セグモジュールに表示を依頼(STATEがINPUTならリアルタイムで入力中の値を7SEGで表示させるようにする)
2. 今現在の問題と難易度が何なのかを管理して、それを7セグモジュールに表示を依頼(STATEがQUESTIONなら問題と難易度を表示させるようにする)
*/
/*
COUNTについて      
COUNT = 0 => -
COUNT = 1 => 2
COUNT = 2 => 3
COUNT = 3 => 5
COUNT = 4 => 7 
*/


initial begin
      COUNT1 <= 4'b0;//4bitの理由は0から9までのカウントのため
      COUNT2 <= 4'b0;
      COUNT3 <= 4'b0;
      SEG1 <= 4'b0;
      SEG2 <= 4'b0;
      SEG3 <= 4'b0;
      SEG4 <= 4'b0;
      SEG5 <= 4'b0;
      SEG6 <= 4'b0;
		SEG1_Q <= 4'b0;
		SEG2_Q <= 4'b0;
		SEG3_Q <= 4'b0;
end

reg [3:0] COUNT1, COUNT2, COUNT3;
reg [11:0] QUESTION_r;// 難易度 + 問題をいれる箱

initial begin
  QUESTION_r <= 12'b0;//初期値はゼロで空っぽ
end

always @(posedge CLK)begin
  if(STATE == 4'b0110 || STATE == 4'b1000 || STATE == 4'b1001 || STATE == 4'b1010 || STATE == 4'b1011)begin
    QUESTION_r <= 12'b0;
  end
  else begin
    QUESTION_r <= QUESTION[23:11];//DBから受け取った問題セットから、難易度と問題だけを切り取り、保存しておく
  end
end

always @(posedge CLK)begin
  if(QUESTION_r == 12'b0)begin
    QUE_OK <= QUE_OK;
  end
	else if(QUESTION_r != 12'b0)begin//QUESTION_rの中身が空でない
		QUE_OK <= 1;
	end
end


reg LED_r;
initial begin
  LED_r <= 0;
end
always @(posedge CLK) begin
  if(QUE_OK)begin
    LED_r <= 1;
  end
  else begin
    LED_r <= 0;
  end
end

assign LED = LED_r;

always @(posedge CLK) begin
  if(STATE == 4'b0110 || STATE == 4'b1000 || STATE == 4'b1001 || STATE == 4'b1010 || STATE == 4'b1011)begin//DRAW, GOOD, OUCH, WIN, LOSE
    SEG1 <= 0;
    SEG2 <= 0;
    SEG3 <= 0;
    SEG4 <= 0;
    SEG5 <= 0;
    SEG6 <= 0;
  end
  else if(STATE == 4'b0100)begin//入力
		SEG1 <= COUNT1;//1の位
    SEG2 <= COUNT1;//10の位

    SEG3 <= COUNT2;
    SEG4 <= COUNT2;
      
    SEG5 <= COUNT3;
    SEG6 <= COUNT3;
	end

end



always@(posedge CLK)begin
  if(STATE == 4'b0110 || STATE == 4'b1000 || STATE == 4'b1001 || STATE == 4'b1010 || STATE == 4'b1011)begin//DRAW, GOOD, OUCH, WIN, LOSE
      SEG1_Q <= 0;
      SEG2_Q <= 0;
      SEG3_Q <= 0;
  end
	else begin
	//else if(STATE == 4'b0011)begin//問題表示
		SEG1_Q <= QUESTION_r[3:0];  //1の位    SEG7DEC_ONEモジュールにわたす4bit
      SEG2_Q <= QUESTION_r[7:4];  //10の位   SEG7DEC_TENモジュールにわたす4bit
      SEG3_Q <= QUESTION_r[11:8]; //100の位
	end
end


always @(posedge CLK) begin//COUNT値の更新処理
  if(STATE == 4'b0100)begin//STATEがINPUT時のみ限り更新が許される
    if(SEL[0])begin
      COUNT1 <= COUNT1 + 1;
        if(COUNT1 == 9)begin//9までいったら1に戻す
          COUNT1 <= 1;
        end
    end	 
    else if(SEL[1])begin
      COUNT2 <= COUNT2 + 1;
        if(COUNT2 == 9)begin
          COUNT2 <= 1;
        end
    end	  
    else if(SEL[2])begin
      COUNT3 <= COUNT3 + 1;
        if(COUNT3 == 9)begin
          COUNT3 <= 1;
        end
    end
    else if(CLR_IN || (STATE == 4'b0110 || STATE == 4'b1000 || STATE == 4'b1001 || STATE == 4'b1010 || STATE == 4'b1011))begin//CLR処理
      COUNT1 <= 0;
      COUNT2 <= 0;
      COUNT3 <= 0;
    end
  end
  else begin//STATEがINPUTでないときはなにもしない
    COUNT1 <= COUNT1;
    COUNT2 <= COUNT2;
    COUNT3 <= COUNT3;
  end
end

always @(posedge CLK)begin//決定ボタンを押して正誤判定モジュールに自身の回答を送信させる処理。これも上と同様STATEがINPUTのときだけ許させる。
	if(STATE == 4'b0100)begin
    if(DEC)begin
      COUNT1_OUT <= COUNT1;
      COUNT2_OUT <= COUNT2;
      COUNT3_OUT <= COUNT3;
    end
    else begin
      COUNT1_OUT <= COUNT1_OUT;
      COUNT2_OUT <= COUNT2_OUT;
      COUNT3_OUT <= COUNT3_OUT;
    end
  end
end

endmodule