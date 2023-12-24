`timescale 1ns / 100ps
module CONTROL_SIM();


reg  clk, rst, ready, que, dec, clr, ok, que2;
reg [1:0] hp, judg, wrong;
reg [2:0] sel;


wire ready_out;
wire [3:0] state; 
wire [2:0] sel_out;
wire dec_out, clr_out;
//wire [2:0] cnt;



CONTROL a1(

//------------------INPUT---------------------------
 .CLK(clk),
 .RST(rst),
 .READY_IN(ready),
 .QUE_IN(que),
 .SEL(sel),//3
 .DEC(dec),
 .CLR_IN(clr),
 .OK_IN(ok),
 .HP_IN(hp),//2
 .QUE(que2),
 .JUDG_IN(judg),//2
 .WRONG_IN(wrong),//2
 
 //----------------OUTPUT----------------------------
 .READY_OUT(ready_out),
 .STATE(state),
 .SEL_OUT(sel_out),
 .DEC_OUT(dec_out),
 .CLR_OUT(clr_out)
 //.CNT(cnt),
 //.NEED_1SEC(need)
);

always begin
        clk = 1;
  #0.8  clk = 0;
  #0.8;
end


initial begin
     rst = 0;
     ready = 0;
     que = 0;
     dec = 0;
     clr = 0;
     ok = 0;
     que2 = 0;
     hp = 2'b0;
     judg = 2'b0;
     wrong = 2'b0;
     sel = 3'b0;
#20 ok = 1;
    que2 = 1;//Swich QUESTION
#20 que = 1;//Swich INPUT
#20 wrong = 2'b11;//Swich WRONG  
#5 wrong = 2'b00;
//#10 wrong = 2'b00;  

end


// always begin
//   que = 0;
// #150 que = 1;
// #150;  
// end



endmodule