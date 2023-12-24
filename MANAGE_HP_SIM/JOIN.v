module JOIN(
    input CLK, RST, READY_IN, QUE_IN, QUE, OK, 
    input[1:0] WRONG_IN, JUDG,
    //input[3:0] STATE,
    // input[2:0] SEL,  
    // input DEC, CLR,
    // output [2:0] SEL_OUT,
    // output DEC_OUT, CLR_OUT
    output [3:0] STATE,
    output LEDR1, LEDR2, LEDR3, LEDR4, LEDR5, LEDR6, LEDR7, LEDR8, LEDR9
);




wire [1:0] hp;
wire [3:0] hp2;

// CONTROL c0(.CLK(CLK), .RST(RST), .READY_IN(READY_IN), .QUE_IN(QUE_IN), .WRONG_IN(WRONG_IN), .JUDG_IN(JUDG), .HP_IN(hp), 
//            .QUE(QUE), .OK_IN(OK), .READY_OUT(READY_OUT), .STATE(STATE), .SEL(SEL), .DEC(DEC), .CLR_IN(CLR), .SEL_OUT(SEL_OUT), .DEC_OUT(DEC_OUT), .CLR_OUT(CLR_OUT));
CONTROL c0(.CLK(CLK), .RST(RST), .READY_IN(READY_IN), .QUE_IN(QUE_IN), .WRONG_IN(WRONG_IN), .JUDG_IN(JUDG), .HP_IN(hp), 
           .QUE(QUE), .OK_IN(OK), .STATE(STATE));

MANAGE_HP m0(.CLK(CLK), .RST(RST), .HP_IN(JUDG), .RESULT(hp), .HP_OUT(hp2));

HP_LED hled(.CLK(CLK), .RST(RST), .IN_HP(hp2), .LED1(LEDR1), .LED2(LEDR2), .LED3(LEDR3), .LED4(LEDR4), .LED5(LEDR5), .LED6(LEDR6), .LED7(LEDR7), .LED8(LEDR8), .LED9(LEDR9));


endmodule