module HP_LED(
 input CLK,RST,
 input [3:0] IN_HP,
 output LED0,LED1,LED2,LED3,LED4,LED5,LED6,LED7,LED8,LED9
 );

 always@(posedge CLK)begin
 case (IN_HP)
    4'b0000: 
             LED0  <= 0:
             LED1  <= 0;
             LED2  <= 0;
             LED3  <= 0;
             LED4  <= 0;
             LED5  <= 0;
             LED6  <= 0;
             LED7  <= 0;
             LED8  <= 0;
             LED9  <= 0;

    4'b0001:
             LED0  <= 0;
             LED1  <= 0;
             LED2  <= 0;
             LED3  <=0;
             LED4  <=0;
             LED5  <=0;
             LED6  <=0;
             LED7  <=0;
             LED8  <=0;
             LED9  <= 1;

    4'b0010:
             LED0  <=0;
             LED1  <=0;
             LED2  <=0; 
             LED3  <=0;
             LED4  <=0;
             LED5  <=0;
             LED6  <=0;
             LED7  <=0;
             LED8  <=1;
             LED9  <=1;
    4'b0011:
             LED0  <=0;
             LED1  <=0;
             LED2  <=0; 
             LED3  <=0;
             LED4  <=0;
             LED5  <=0;
             LED6  <=0;
             LED7  <=1;
             LED8  <=1;
             LED9  <=1;
    4'b0100:
             LED0  <=0;
             LED1  <=0;
             LED2  <=0; 
             LED3  <=0;
             LED4  <=0;
             LED5  <=0;
             LED6  <=1;
             LED7  <=1;
             LED8  <=1;
             LED9  <=1;
    4'b0101:
             LED0  <=0;
             LED1  <=0;
             LED2  <=0; 
             LED3  <=0;
             LED4  <=0;
             LED5  <=1;
             LED6  <=1;
             LED7  <=1;
             LED8  <=1;
             LED9  <=1;
    4'b0110:
             LED0  <=0;
             LED1  <=0;
             LED2  <=0; 
             LED3  <=0;
             LED4  <=1;
             LED5  <=1;
             LED6  <=1;
             LED7  <=1;
             LED8  <=1;
             LED9  <=1;
    4'b0111:
             LED0  <=0;
             LED1  <=0;
             LED2  <=0; 
             LED3  <=1;
             LED4  <=1;
             LED5  <=1;
             LED6  <=1;
             LED7  <=1;
             LED8  <=1;
             LED9  <=1;
    4'b1000:
             LED0  <=0;
             LED1  <=0;
             LED2  <=1; 
             LED3  <=1;
             LED4  <=1;
             LED5  <=1;
             LED6  <=1;
             LED7  <=1;
             LED8  <=1;
             LED9  <=1;
    4'b1001:  
             LED0  <=0;
             LED1  <=1;
             LED2  <=1;
             LED3  <=1;
             LED4  <=1;
             LED5  <=1;
             LED6  <=1;
             LED7  <=1;
             LED8  <=1;
             LED9  <=1:
    4'b1010:   
             LED0  <=1;
             LED1  <=1;
             LED2  <=1;
             LED3  <=1;
             LED4  <=1;
             LED5  <=1;
             LED6  <=1;
             LED7  <=1;
             LED8  <=1;
             LED9  <=1;      
    default: 
             LED0  <=0;
             LED1  <=1;
             LED2  <=0; 
             LED3  <=1;
             LED4  <=0;
             LED5  <=1;
             LED6  <=0;
             LED7  <=1;
             LED8  <=0;
             LED9  <=1;
 endcase


 end




 endmodule