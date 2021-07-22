`timescale 100ns/100ns		// For 1MHZ clock in #10
module T_FF_TB;

    reg t, clk, clear, expected_out;
    wire q, q_bar;

    T_FF myTFF(q, q_bar, clk, clear, t);

    initial 
    begin
    	clk = 1'b0;
    	clear = 1'b1;		// Set FF to q = 0, q_bar = 1 at first posedge clock
	t = 1'b1;		// At second posedge clock q = ~q = 1, q_bar = 0
	#10 expected_out = 1'b0;
	#1 clear = 1'b0;
	#19 expected_out = 1'b1;	
	#20 expected_out = 1'b0;// At third posedge clock q = ~q = 0, q_bar = 1
	#20 expected_out = 1'b1;// At third posedge clock q = ~q = 1, q_bar = 0
	#1 t = 1'b0;
	// After we have no change on q and q_bar	
	
    end

    always
    begin
    	#10 clk = ~clk;
    end
    
endmodule
