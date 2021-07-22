module JK_FF (output reg q, q_bar, input clear, clk, j, k);

always@(posedge clk)
begin
	if(clear == 1)
	begin
		q <= 0;
		q_bar <= 1;
	end
	if(j && k)
	begin
		q <= q;
		q_bar <= q_bar;
	end
	else if(j)
	begin
		q <= 1;
		q_bar <= 0;
	end
	else if(k)
	begin
		q <= 0;
		q_bar <= 1;
	end
end

endmodule

