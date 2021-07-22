module BCD_Counter (output wire[3:0] number, wire extra, input clk, enable);

	wire n1, n2, n3, n4;
	assign {number[3:0]} = {n1,n2,n3,n4};
	
	and G1 (g_out1, n4, extra);
	and G2 (g_out2, n3, n4);	
	and G3 (g_out3, n1, n4);
	and G4 (g_out4, n2, g_out2);	

	or  G5 (g_out5, g_out3, g_out4);

	T_FF T1(.q(n4), .clk(clk), .clear(enable), .t(1'b1));
	T_FF T2(.q(n3), .clk(clk), .clear(enable), .t(g_out1));
	T_FF T3(.q(n2), .clk(clk), .clear(enable), .t(g_out2));
	T_FF T4(.q(n1), .q_bar(extra), .clk(clk), .clear(enable), .t(g_out5));

endmodule
