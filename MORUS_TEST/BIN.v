module BIN(
    input CLK, RST,
    input  BIN, 
    output reg BOUT
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

reg ff1, ff2;

always @(posedge CLK) begin
    if(RST) begin
    ff2 <= 0;
	ff1 <= 0;
    end
    else if(en40hz) begin
	ff2 <= ff1;
	ff1 <= BIN;
    end
end

wire temp = ~ff1 & ff2 & en40hz;

always @(posedge CLK) begin
    if(RST)
	BOUT <= 0;
    else
	BOUT <= temp;
end

endmodule	
