module HP_LED(
 input CLK,RST, LED_1P_in,
 input [3:0] IN_HP,
 output reg LED1, LED2, LED3,LED4,LED5,LED6,LED7,LED8,LED9
 );

//reg LED2;
initial begin
   LED1  =0;
   LED2  =0; 
   LED3  =0;
   LED4  =0;
   LED5  =1;
   LED6  =1;
   LED7  =1;
   LED8  =1;
   LED9  =1;
 end
 
 always @(posedge CLK) begin
        if(LED_1P_in)
         LED1 = 1;
        else 
         LED1 = 0;
 end
 
 always@(posedge CLK)begin
 case (IN_HP)
    4'd0:   begin
             //LED0  <= 0:
             //LED1  = 0;
	     LED2 = 0;
             LED3  = 0;
             LED4  = 0;
             LED5  = 0;
             LED6  = 0;
             LED7  = 0;
             LED8  = 0;
             LED9  = 0;
             end

    4'b0001:   begin
             //LED0  <= 0;
             //LED1  = 0;
             LED2  = 0;
             LED3  = 0;
             LED4  = 0;
             LED5  = 0;
             LED6  = 0;
             LED7  = 0;
             LED8  = 0;
             LED9  = 1;
            end

    4'd2:   begin
             //LED0  <=0;
             //LED1  = 0;
             LED2  = 0; 
             LED3  = 0;
             LED4  = 0;
             LED5  = 0;
             LED6  = 0;
             LED7  = 0;
             LED8  = 1;
             LED9  = 1;
            end

    4'd3:   begin
             //LED0  <=0;
             //LED1  = 0;
             LED2  = 0; 
             LED3  = 0;
             LED4  = 0;
             LED5  = 0;
             LED6  = 0;
             LED7  = 1;
             LED8  = 1;
             LED9  = 1;
            end

    4'd4:   begin
             //LED0  <=0;
             //LED1  = 0;
             LED2  = 0; 
             LED3  = 0;
             LED4  = 0;
             LED5  = 0;
             LED6  = 1;
             LED7  = 1;
             LED8  = 1;
             LED9  = 1;
            end

    4'd5:   begin
             //LED0  <=0;
             //LED1  = 0;
             LED2  = 0; 
             LED3  = 0;
             LED4  = 0;
             LED5  = 1;
             LED6  = 1;
             LED7  = 1;
             LED8  = 1;
             LED9  = 1;
            end

    4'd6:   begin
             //LED0  <=0;
             //LED1  = 0;
             LED2  = 0; 
             LED3  = 0;
             LED4  = 1;
             LED5  = 1;
             LED6  = 1;
             LED7  = 1;
             LED8  = 1;
             LED9  = 1;
            end

    4'd7:   begin
             //LED0  <=0;
             //LED1  = 0;
             LED2  = 0; 
             LED3  = 1;
             LED4  = 1;
             LED5  = 1;
             LED6  = 1;
             LED7  = 1;
             LED8  = 1;
             LED9  = 1;
            end

    4'd8:   begin
             //LED0  <=0;
             //LED1  = 0;
             LED2  = 1; 
             LED3  = 1;
             LED4  = 1;
             LED5  = 1;
             LED6  = 1;
             LED7  = 1;
             LED8  = 1;
             LED9  = 1;
            end

    4'd9:   begin
             //LED0  <=0;
             //LED1  = 1;
             LED2  = 1;
             LED3  = 1;
             LED4  = 1;
             LED5  = 1;
             LED6  = 1;
             LED7  = 1;
             LED8  = 1;
             LED9  = 1;
            end

    4'd10:  begin 
             //LED0  <=1;
             //LED1  = 1;
             LED2  = 1;
             LED3  = 1;
             LED4  = 1;
             LED5  = 1;
             LED6  = 1;
             LED7  = 1;
             LED8  = 1;
             LED9  = 1;     
            end 

    default: begin
             //LED0  <=0;
             //LED1  = 1;
             LED2  = 0; 
             LED3  = 1;
             LED4  = 0;
             LED5  = 1;
             LED6  = 0;
             LED7  = 1;
             LED8  = 0;
             LED9  = 1;
            end
 endcase


 end




 endmodule