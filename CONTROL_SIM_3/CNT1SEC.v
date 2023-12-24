module CNT1SEC(
    input CLK, RST,
    input [3:0] STATE,
    output CNT1S
);

localparam WRONG = 4'b0111, GOOD = 4'b1000, OUCH = 4'b1001, WIN = 4'b1010, LOSE = 4'b1011, DRAW = 4'b0110;

reg [2:0] cnt;
reg [2:0] sec;
wire EN1HZ;
initial begin
    sec <= 3'b0;
    cnt <= 3'b0;
end

assign EN1HZ = (cnt == 3'd7);
assign CNT1S = (sec == 3'd1);

always @(posedge CLK or posedge RST) begin
    if (RST)
        cnt <= 3'b0;
    else if (EN1HZ)
        cnt <= 3'b0;
    else if (STATE == WRONG || STATE == GOOD)
        cnt <= cnt + 3'b1;
    else
        cnt <= 3'b0;
end

always @(posedge CLK or posedge RST) begin
    if (RST)
        sec <= 3'd0;
    else if (sec == 3'd1)
        sec <= 3'd0;
    else if (EN1HZ)
        sec <= sec + 3'd1;
end

endmodule