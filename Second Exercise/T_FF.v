module T_FF (output reg q, q_bar, input clk, clear, t);

always@(posedge clk)
begin
	if(clear)
	begin
		q <= 0;
		q_bar <= 1;
	end
	else
	begin
		if(t)
		begin
			q <= ~q;
			q_bar <= ~q_bar;
		end
		else
		begin
			q <= q;
			q_bar <= q_bar;
		end
	end
end

endmodule
