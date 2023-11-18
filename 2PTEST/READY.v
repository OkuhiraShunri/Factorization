module READY(
    input CLK,RST,
    input IN_2P,
    input IN_1P,

    output reg STSART
);
 always @(posedge CLK)begin
    STSART <= 0;
    if(IN_1P ==1 && IN_2P ==1)
        STSART <= 1;
     
 end

endmodule