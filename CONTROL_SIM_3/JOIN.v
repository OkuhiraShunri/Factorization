module JOIN(
    input [2:0] SEL,
    input CLK, RST, READY_IN, QUE_IN, DEC, CLR_IN,//QUE_IN is BOUT
    input OK_IN, //
    input [1:0] HP_IN,//
    input QUE,//QUE is INPUT's q_ok    Question is already  not 0 or  0
    input [1:0] JUDG_IN,  //
    input [1:0] RESULT //

    // output reg  READY_OUT,
	// output reg [2:0] SEL_OUT,
	// output reg DEC_OUT, CLR_OUT
);

wire[3:0] state;
wire cnt1;

CONTROL c0(.CLK(CLK), .RST(RST), .SEL(SEL), .READY_IN(READY_IN), .QUE_IN(QUE_IN), .DEC(DEC), .CLR_IN(CLR_IN), .OK_IN(OK_IN),
           .HP_IN(HP_IN), .QUE(QUE), .JUDG_IN(JUDG_IN), .RESULT(RESULT), .CNT1S(cnt1),  .STATE(state));

CNT1SEC cn1(.CLK(CLK), .RST(RST), .STATE(state), .CNT1S(cnt1));
endmodule