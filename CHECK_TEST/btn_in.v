module btn_in(
   input   CLK,RST,
   input [1:0]  nBIN,
   output  reg [1:0] BOUT
);

reg[20:0] cnt;

wire en40hz = (cnt ==1250000 -1);

always  @(posedge CLK) begin
	if(RST)
	  cnt <= 21'b0;
	else if(en40hz)
	  cnt <= 21'b0;
	else
	  cnt <= cnt + 21'b1;
end

reg [1:0] ff1,ff2;

always  @(posedge CLK )begin
	if(RST) begin
	  ff2<=2'b0;
	  ff1<=2'b0;
	end
	else if(en40hz) begin
	  ff2<=ff1;
	  ff1<=nBIN;
  end
end

wire [1:0] temp = ~ff1 &ff2 & {2{en40hz}};

always@(posedge CLK)begin
	if(RST)
	   BOUT <= 2'b0;
	else
	   BOUT<=temp;
end
endmodule




