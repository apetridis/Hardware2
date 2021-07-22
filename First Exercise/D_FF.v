module D_FF (output reg q, q_bar, input wire d, clk, clear);

always@(posedge clk) 
begin
	if(clear == 1)
	begin
		q <= 0;
		q_bar <= 1;
	end
	else 
	begin
		q <= d; 
		q_bar <= ~d; 
	end
end 

endmodule

