module final_Hamming_TB;

	wire[11:0] decoded;
	reg[11:0] data;
	integer error;
	reg[11:0] expected_out;
	
	final_Hamming myFULL(decoded, data, error);
	
	initial
	begin
	        data = 12'b110101101011;	
	        error = 4;
			expected_out = 12'b110101101011;
	end

endmodule
