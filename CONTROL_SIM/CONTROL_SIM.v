`timescale 1ns / 100ps
module CONTROL_SIM();

//reg  ready, que, que2, clr, dec, ok, clk, rst, wrong;
reg  ready, que, que2, ok, clk, rst, wrong;
reg [1:0] hp, judg;
//reg [2:0] sel;

//wire dec_out, clr_out, ready_out;
//wire [2:0] sel_out;
wire ready_out;
wire [3:0] state; 
//reg  ready_out;


CONTROL a1(
 .CLK(clk),//INPUT
 .RST(rst),
 //.READY_IN(ready),
 .QUE_IN(que),
 //.CLR_IN(clr),
 .DEC(dec),
 .SEL(sel),
 .OK_IN(ok),
 .HP_IN(hp),
 .QUE(que2),
 .JUDG_IN(judg),
 .WRONG_IN(wrong),

 .READY_OUT(ready_out),//OUTPUT
 .STATE(state)
 //.SEL_OUT(sel_out),
 //.DEC_OUT(dec_out),
 //.CLR_OUT(clr_out)
);



/*process begin//create CLK
  clk <= '0';
 wait for 5ns;
  clk <= '1';
 wait for 5ns;
end process;*/


always begin
        clk = 1;
  #0.8  clk = 0;
  #0.8;
end


initial begin
     ready = 0;
     //ready_out = 0;

     ok = 0;

     //dec = 0;
     //sel = 3'b0;
     que = 0;
     que2 = 0;
     wrong = 0;
     judg = 2'b0;
     hp = 2'b0;
     //clr = 0;
     rst = 0;
#50 ok = 1;//150ns
#50  que2 = 1;
#50  que = 1;

end

endmodule