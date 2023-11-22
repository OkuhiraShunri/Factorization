module INPUT(
    input [2:0] SEL,//SW[9] = SEL[2]:HEX[4], SW[8] = SEL[1]:HEX[2], SW[7] = SEL[0]:HEX[0]
    input [3:0] STATE,
    input  DEC, CLK, RST,
	 //input [1:0] RESULT, 
    output reg [3:0] SEG1, SEG2, SEG3, SEG4, SEG5, SEG6,
	 output reg [3:0] COUNT1_out, COUNT2_out, COUNT3_out
);


reg [3:0] COUNT1, COUNT2, COUNT3;

initial begin
      COUNT1 <= 4'b0;//4bitの理由は0から9までのカウントのため
      COUNT2 <= 4'b0;
      COUNT3 <= 4'b0;
      SEG1 <= 0;
      SEG2 <= 0;
      SEG3 <= 0;
      SEG4 <= 0;
      SEG5 <= 0;
      SEG6 <= 0;
end

always@(posedge CLK)begin
    if(RST)begin
        SEG1 <= 0;
        SEG2 <= 0;
        SEG3 <= 0;
        SEG4 <= 0;
        SEG5 <= 0;
        SEG6 <= 0;
    end
    else if(RESULT == 2'b01)begin//wrong
      SEG1 <= 4'd1;
      SEG2 <= 4'd1;
      SEG3 <= 4'd1;
      SEG4 <= 4'd1;
      SEG5 <= 4'd1;
      SEG6 <= 4'd1;
	 end
	 else if(RESULT == 2'b11)begin//correct
      SEG1 <= 4'd2;
      SEG2 <= 4'd2;
      SEG3 <= 4'd2;
      SEG4 <= 4'd2;
      SEG5 <= 4'd2;
      SEG6 <= 4'd2;
	 end
	 else begin
      SEG1 <= COUNT1;
      SEG2 <= COUNT1;

      SEG3 <= COUNT2;
      SEG4 <= COUNT2;
      
      SEG5 <= COUNT3;
      SEG6 <= COUNT3;
	end
end

always @(posedge CLK) begin
  if(SEL[0])begin
    COUNT1 <= COUNT1 + 1;
      if(COUNT1 == 9)begin
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
end

always @(posedge CLK)begin
	if(DEC)begin
		COUNT1_out <= COUNT1;
		COUNT2_out <= COUNT2;
		COUNT3_out <= COUNT3;
	end
	else begin
    COUNT1_out <= COUNT1_out;
		COUNT2_out <= COUNT2_out;
		COUNT3_out <= COUNT3_out;
   end

end

endmodule