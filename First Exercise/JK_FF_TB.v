`timescale 100ns/100ns		// For 1MHZ clock in #10
module JK_FF_TB;

reg j, k, clk, clear, expected_out;
wire q, q_bar;

JK_FF myDFF(q, q_bar, clear, clk, j, k);

initial 
begin
	clk = 1'b0;
	clear = 1'b1;		// Set FF to q = 0, q_bar = 1 at first posedge clock
	j = 1'b0;
	k = 1'b0;
	#10 expected_out = 1'b0;
	#1 clear = 1'b0;
	j = 1'b1;		// Set 
	#19 expected_out = 1'b1;// At second posedge clock q = 1, q_bar = 0
	#1 j = 1'b0;
	k = 1'b1;		// Reset
	#19 expected_out = 1'b0;// At third posedge clock q = 0, q_bar = 1
end

always
begin
	#10 clk = ~clk;
end
endmodule

