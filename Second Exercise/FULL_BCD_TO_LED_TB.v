`timescale 100ns/100ns		// For 1MHZ clock in #10
module FULL_BCD_TO_LED_TB;

	wire[6:0]     LED1, LED2, LED3, LED4;
	reg clk, enable, LED_TYPE;

	FULL_BCD_TO_LED myBCDtoLED(LED1, LED2, LED3, LED4, clk, enable, LED_TYPE);

	reg[6:0] expected_out1, expected_out2, expected_out3, expected_out4;
	integer out1, out2, out3, out4;

	initial
	begin
		LED_TYPE = 1'b1;
		clk = 1'b0;
		enable = 1'b1;
		#11 enable = 1'b0;
	end		

	always @(LED1 or LED2 or LED3 or LED4)
	begin
		expected_out1 = (LED_TYPE) ? LED1 : ~LED1;
           	case(expected_out1)
                	7'b_1111110:    out1 = 0;
                	7'b_0110000:    out1 = 1;
                	7'b_1101101:    out1 = 2;
                	7'b_1111001:    out1 = 3;
                	7'b_0110011:    out1 = 4;
                	7'b_1011011:    out1 = 5;
                	7'b_1011111:    out1 = 6;
                	7'b_1110000:    out1 = 7;
                	7'b_1111111:    out1 = 8;
                	7'b_1111011:    out1 = 9;
            	endcase
		expected_out2 = (LED_TYPE) ? LED2 : ~LED2;
           	case(expected_out2)
                	7'b_1111110:    out2 = 0;
                	7'b_0110000:    out2 = 1;
                	7'b_1101101:    out2 = 2;
                	7'b_1111001:    out2 = 3;
                	7'b_0110011:    out2 = 4;
                	7'b_1011011:    out2 = 5;
                	7'b_1011111:    out2 = 6;
                	7'b_1110000:    out2 = 7;
                	7'b_1111111:    out2 = 8;
                	7'b_1111011:    out2 = 9;
            	endcase
		expected_out3 = (LED_TYPE) ? LED3 : ~LED3;
           	case(expected_out3)
                	7'b_1111110:    out3 = 0;
                	7'b_0110000:    out3 = 1;
                	7'b_1101101:    out3 = 2;
                	7'b_1111001:    out3 = 3;
                	7'b_0110011:    out3 = 4;
                	7'b_1011011:    out3 = 5;
                	7'b_1011111:    out3 = 6;
                	7'b_1110000:    out3 = 7;
                	7'b_1111111:    out3 = 8;
                	7'b_1111011:    out3 = 9;
            	endcase
		expected_out4 = (LED_TYPE) ? LED4 : ~LED4;
           	case(expected_out4)
                	7'b_1111110:    out4 = 0;
                	7'b_0110000:    out4 = 1;
                	7'b_1101101:    out4 = 2;
                	7'b_1111001:    out4 = 3;
                	7'b_0110011:    out4 = 4;
                	7'b_1011011:    out4 = 5;
                	7'b_1011111:    out4 = 6;
                	7'b_1110000:    out4 = 7;
                	7'b_1111111:    out4 = 8;
                	7'b_1111011:    out4 = 9;
            	endcase
	end
	always
	begin
		#10 clk = ~clk;
	end

endmodule
