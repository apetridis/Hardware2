`timescale 100ns/100ns		// For 1MHZ clock in #10
module FULL_BCD_Counter_TB;

	reg clk, enable;

	wire[3:0] number[3:0];
	FULL_BCD_Counter myCounter(number[0], number[1], number[2], number[3], clk, enable);

	integer full, n1, n2, n3, n4;
	integer expected_out;

	assign n1 = {number[0][3:0]};
	assign n2 = {number[1][3:0]};
	assign n3 = {number[2][3:0]};
	assign n4 = {number[3][3:0]};
	assign full = n4 + 10*n3 + 100*n2 + 1000*n1;

	initial
	begin
		expected_out = 0;
		full = 0;
		enable = 1'b1;
		clk  = 1'b0;

		#11 enable = 1'b0;
		expected_out = 0;

	end

	always
	begin
		#10 clk = ~clk;

		if (clk)
		begin
			expected_out = expected_out + 1;
		end
		if(expected_out > 9999) 
		begin
			expected_out = 0;
		end
		
	end

endmodule