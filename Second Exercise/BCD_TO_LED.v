module BCD_TO_LED (output wire[6:0] LED, input wire[3:0] number, LED_TYPE);

	wire n1, n2, n3, n4;
	reg A, B, C, D, E, F, G;
	wire a, b, c, d, e, f, g;

	assign{LED[6:0]} = {A, B, C, D, E, F, G};
	assign{n1, n2, n3, n4} = {number[3:0]};
	
	assign a = (~n2 & ~n4) | (n3) | (n2 & n4) | (n1);
	assign b = (~n1 & ~n2) | (~n3 & ~n4) | (~n1 & n3 & n4) | (~n2 & ~n3);
	assign c = (~n3) | (n4) | (n2);
	assign d = (~n1 & ~n2 & n3) | (n2 & ~n3 & n4) | (n1 & ~n3) | (~n1 & ~n2 & ~n4) | (~n1 & n3 & ~n4);
	assign e = (~n2 & ~n4) | (n3 & ~n4);
	assign f = (~n3 & ~n4) | (n2 & ~n3) | (n2 & ~n4) | (n1);
	assign g = (~n1 & ~n2 & n3) | (~n1 & n2 & ~n3) | (n1 & ~n2 & ~n3) | (~n1 & n3 & ~n4);

	// LED_TYPE = 0 for common anode
	// LED_TYPE = 1 for common cathode
	always@(number)	
	begin
		if (LED_TYPE)
		begin
			A = a;
			B = b;
			C = c;
			D = d;
			E = e;	
			F = f;	
			G = g;
		end
		else 
		begin
			A = ~a;
			B = ~b;
			C = ~c;
			D = ~d;
			E = ~e;	
			F = ~f;	
			G = ~g;
		end
	end	

endmodule
