`timescale 100ns/100ns		// For 1MHZ clock in #10
module c_FSM_TB;

reg clk, reset, x_in, expected_out;
wire y_out;

c_FSM myFSM(y_out, x_in, clk, reset);

initial 
begin
	clk = 1'b0;
	reset = 1'b0;
	x_in = 1'b0;	
	expected_out = 1'b0;
	#1 reset = 1'b1;	// We need posedge of Reset to reset FSM
	#1 reset = 1'b0;
	// We are on State B(001)
	// with x_in = 0 we have y_out = 0 and nextState = B(001)
	#2 x_in = 1'b1;
	// with x_in = 1 we have y_out = 1 and nextState = E(100)
	expected_out = 1'b1;
	// at next posedge clock we have currentState = E(100)
	// and with x_in = 1 we have y_out = 0 and nextState = D(011)
	#6 expected_out = 1'b0;

	// at next posedge clock we have currentState = D(011)
	// and with x_in = 1 we have y_out = 1 and nextState = C(010)
	#20 expected_out = 1'b1;
	
	// at next posedge clock we have currentState = C(010)
	// and with x_in = 1 we have y_out = 1 and nextState = A(000)

	// at next posedge clock we have currentState = A(000)
	// and with x_in = 1 we have y_out = 1 and nextState = E(100)

	// at next posedge clock we have currentState = E(100)
	// and with x_in = 1 we have y_out = 0 and nextState = D(011)
	#60 expected_out = 1'b0;
	

end

always
begin
	#10 clk = ~clk;
end

endmodule


