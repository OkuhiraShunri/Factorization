module LED(
    input MORUS_LED, CLK, RST, 
    output LED
);

reg r_LED;
always @(posedge CLK)begin
    if(RST)begin
        r_LED <= 0;
    end
    else if(MORUS_LED)begin
        r_LED <= 1;
    end
    else
        r_LED <= 0;
end

assign LED = r_LED;



endmodule