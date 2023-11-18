module TEST2p(
    input CLK,RST,
    output reg [1:0] IN_READY,
    output reg [1:0] IN_WIN_LOSE

);
always @(posedge CLK)begin
 IN_READY     <= 1;
 IN_WIN_LOSE  <= 1;
 end

endmodule