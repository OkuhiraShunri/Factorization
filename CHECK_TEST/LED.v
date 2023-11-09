module LED(
    input [1:0] result_in,
    input  CLK, RST, 
    output LED
);

reg r_LED;

always@(posedge CLK)begin
    if(RST)
     r_LED <= 0;
    else if(result_in == 01)
     r_LED <= 1;  //
    else
     r_LED <= 0;  //なにも受け取ってないときはなにも光らない 
end

assign LED = r_LED;


endmodule