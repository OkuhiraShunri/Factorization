`timescale 1ns / 100ps

module READY_SIM();

reg clk, rst, ready_1, ready_2;
reg [3:0] state;

wire [3:0] num, num_2;
wire ok, ok_2, led;




READY r0(
//----------------input-----------
    .CLK(clk),
    .RST(rst),
    .READY_1P(ready_1),
    .READY_2P(ready_2),
    .STATE(state),
    
 //----------------output----------   
    .NUM(num),
    .NUM_2(num_2),
    .OK(ok),
    .OK_2(ok_2),
    .LED(led)

);

always begin
        clk = 1;
  #0.8  clk = 0;
  #0.8;
end


initial begin
  rst = 0;
  ready_1 = 0;
  ready_2 = 0;
  state = 4'b0010;//READY
#5 ready_1 = 1;
#5 ready_2 = 1;
end

endmodule