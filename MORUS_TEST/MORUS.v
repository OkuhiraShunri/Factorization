module MORUS(
    input CLK, RST, in_GPIO,
    input KEY,
    output LEDR, out_GPIO
    //output morus2
);
//in_GPIO(in_GPIO);
wire bin;
BIN b0(.CLK(CLK), .RST(RST), .BIN(KEY), .BOUT(bin));

wire led_in;
control c0(.CLK(CLK), .RST(RST), .MORUS_IN(in_GPIO), .MORUS_OUT(out_GPIO), .BIN(bin), .MORUS_LED(led_in) );

//wire led_out;
LED l0(.CLK(CLK), .RST(RST), .MORUS_LED(led_in), .LED(LEDR));


endmodule