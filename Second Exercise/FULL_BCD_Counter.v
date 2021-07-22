module FULL_BCD_Counter (output wire[3:0] number1, number2, number3, number4, input clk, enable);

	wire[3:0] extra;

	BCD_Counter C1(number1, extra[3], extra[2], enable);
	BCD_Counter C2(number2, extra[2], extra[1], enable);
	BCD_Counter C3(number3, extra[1], extra[0], enable);
	BCD_Counter C4(number4, extra[0], clk, enable);

endmodule
