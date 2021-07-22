module hamming_encoder_TB;

	wire[17:1] encoded;
	reg[11:0] data;
	reg[17:1] expected_out;

	hamming_encoder myEncoder(encoded, data);
	
	initial
	begin
		data = 12'b110101101011;		
		expected_out = 17'b11101011001010111;
	end

endmodule
