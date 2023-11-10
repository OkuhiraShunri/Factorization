module BTN_IN(
    input CLK, RST,
    input [4:0] nBIN, // KEY[0], 
    output reg [4:0] BOUT
);

reg [20:0] cnt;

wire en40hz = (cnt == 1250000-1);

always @(posedge CLK) begin
    if(RST)
	cnt <= 21'b0;
    else if(en40hz)
	cnt <= 21'b0;
    else
	cnt <= cnt + 21'b1;
end

reg [4:0] ff1, ff2;

always @(posedge CLK) begin
    if(RST) begin
    ff2 <= 5'b0;
	ff1 <= 5'b0;
    end
    else if(en40hz) begin
	ff2 <= ff1;
	ff1 <= nBIN;
    end
end

wire [4:0] temp = ~ff1 & ff2 & {5{en40hz}};

always @(posedge CLK) begin
    if(RST)
	BOUT <= 5'b0;
    else
	BOUT <= temp;
end

endmodule