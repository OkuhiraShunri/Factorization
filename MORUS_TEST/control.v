module control(
		input CLK, MORUS_IN, RST,
		input  BIN, 
		output MORUS_LED, MORUS_OUT
);

reg [1:0] cur, nxt;
localparam ON = 1, OFF = 0;  

reg R1;
initial begin
    R1 = 0;
end
always @(posedge CLK) begin   //Generate Toggle Wave
     if(R1 == 0 && BIN)
	      R1 <= 1;
	 else if(R1 == 1 && BIN)
		  R1 <= 0;
end    

//assign MORUS_LED = BIN;
assign MORUS_LED = MORUS_IN;
assign MORUS_OUT = R1;

always @( posedge CLK) begin
	  if(RST)
		 cur <= OFF;
	  else
		 cur <= nxt;
end
always @(posedge CLK) begin
		case(cur)
			OFF: if(MORUS_IN)
				     nxt = ON;
					else
					  nxt = OFF;
			ON:  if(MORUS_IN == 0)
					  nxt = OFF;
					else
					  nxt = ON;
			default: nxt = OFF;
	   endcase
end 

endmodule