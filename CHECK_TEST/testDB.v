module testDB(
input CLK,RST,
output reg [35:0] num_array
);

always@(posedge CLK)begin
num_array = 36'b100000100100000000000010001000110011; 
 //                2  36        0 0 2 2 3 3 
end

endmodule