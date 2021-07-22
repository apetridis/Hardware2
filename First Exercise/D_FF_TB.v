`timescale 100ns/100ns		// For 1MHZ clock in #10
module D_FF_TB;

reg d, clk, clear, expected_out;
wire q, q_bar;

D_FF myDFF(q, q_bar, d, clk, clear);

initial 
begin
	clk = 1'b0;
	clear = 1'b1;		// Set FF to q = 0, q_bar = 1 at first posedge clock
	d = 1'b1;		// At second posedge clock q = d = 1, q_bar = 0
	#10 expected_out = 1'b0;

	#1 clear = 1'b0;	
	#19 expected_out = 1'b1;
	#1 d = 1'b0;		// Set FF to q = d = 1, q_bar = 0 at next posedge clock
	#19 expected_out = 1'b0;
end

always
begin
	#10 clk = ~clk;
end
endmodule

