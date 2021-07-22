module FULL_BCD_TO_LED (output wire[6:0] LED1, LED2, LED3, LED4, input wire clk, enable, LED_TYPE);

	wire[3:0] number1, number2, number3, number4;

	FULL_BCD_Counter myCounter(number1, number2, number3, number4, clk, enable);

	BCD_TO_LED myLEDs[3:0]({LED1, LED2, LED3, LED4},{number1, number2, number3, number4}, {LED_TYPE, LED_TYPE, LED_TYPE, LED_TYPE});

endmodule 
