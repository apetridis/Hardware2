module c_FSM (output reg y_out, input x_in, clk, reset);

reg[2:0] nextState;
wire[2:0] currentState;

reg myclk, enable;
assign myclk = clk || enable;

JK_FF myJKFF [2:0](.q(currentState), .j(nextState), .k(~nextState), .clk(myclk));

parameter resetState = 3'b001; 		// State B

initial
begin
	nextState = resetState;
	enable = 1'b0;
end

assign nextState[2] = (reset) ? 0 : (~currentState[2] & ~currentState[1] & x_in);
assign nextState[1] = (reset) ? 0 : ((~currentState[0] & ~x_in) | (currentState[1] & currentState[0] & x_in) | (currentState[2] & ~currentState[0]));
assign nextState[0] = (reset) ? 1 : ((~currentState[2] & ~currentState[1] & ~x_in) | (currentState[0] & ~x_in) | (currentState[2] & x_in));
assign y_out = ~currentState[2] & x_in;

always@(posedge reset)
begin
	nextState = resetState;
	enable = 1;
end

always@(posedge enable)
begin
	enable = 0;
end

endmodule
