module a_FSM (output reg y_out, input x_in, clk, reset);

parameter
	A = 3'b000,
	B = 3'b001,
	C = 3'b010,
	D = 3'b011,
	E = 3'b100;

reg [2:0] currentState, nextState;

always @(posedge clk or posedge reset)
begin: state_memory
	if(reset) currentState <= B;
	else 	   currentState <= nextState;
end
always @(x_in or currentState)
begin: next_state_logic
	case(currentState)
		A: nextState = (x_in == 1'b1) ? E : D;
		B: nextState = (x_in == 1'b1) ? E : B;
		C: nextState = (x_in == 1'b1) ? A : C;
		D: nextState = (x_in == 1'b1) ? C : B;
		E: nextState = (x_in == 1'b1) ? D : C;
	endcase
	assign y_out = ((~currentState[2]) & x_in);	// So it's a Mealy FSM
end
endmodule



