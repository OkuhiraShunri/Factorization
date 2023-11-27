module RANDOM(
    input CLK,RST,
    input  KEY,
    output [6:0]HEX0

);

wire  run;
wire  [3:0] disp;

btn_in  b0 (.CLK(CLK), .RST(RST), .nBIN(KEY), .BOUT(run)) ;

//rand  r0 (.CLK(CLK), .RST(RST), .run_in(run), .num(disp));

//cnt1msec r0 (.CLK(CLK), .RST(RST), .run_out(disp),.run_in(run));

READY r0 (.CLK(CLK), .RST(RST), .run_in(run), .num(disp));

seg7dec  s0 ( .DIN(disp), .nHEX(HEX0) );



endmodule