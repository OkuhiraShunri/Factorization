module JOIN(
    input CLK, RST, READY_1P, READY_2P, QUE, QUE_IN,  
    input [1:0] WRONG_IN, JUDG_IN, HP_IN,
    output OK_2, LED_1P, LED_2P,
    output [3:0] NUM, NUM_2
);

wire ready_w, ok;
wire [3:0] state; 

READY r0(.CLK(CLK), .RST(RST), .READY_1P(ready_w), .READY_2P(READY_2P), .OK(ok), .OK_2(OK_2), .STATE(state), .NUM(NUM), .NUM_2(NUM_2), .LED_2P(LED_2P), .LED_1P(LED_1P));
CONTROL c0(.CLK(CLK), .RST(RST), .READY_OUT(ready_w), .OK_IN(ok), .STATE(state), .QUE(QUE), .JUDG_IN(JUDG_IN), .WRONG_IN(WRONG_IN), .QUE_IN(QUE_IN), .READY_IN(READY_1P),
           .HP_IN(HP_IN), .LED(LED));
endmodule