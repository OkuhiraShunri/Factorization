`timescale 1ns / 100ps

module SEG7_SIM();

reg [3:0] state, din, que;
wire [6:0] hex;

SEG7DEC_1 s0(
    .STATE(state),
    .DIN(din),
    .QUE(que),
    .nHEX(hex)
);

initial begin
    state = 4'b0010;
  #50 state = 4'b0011;
      que = 4'h3;
  #50 state = 4'b0100;
      din = 4'h3;
  #50 state = 4'b0011;
  #50 state = 4'b0100; 
end

endmodule









