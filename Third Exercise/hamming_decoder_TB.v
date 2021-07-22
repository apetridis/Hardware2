module hamming_decoder_TB;

	wire[12:1] decoded;
	reg[17:1] data;
	reg[12:1] expected_out;

	hamming_decoder myDecoder(decoded, data);
	
	initial
	begin
		data = 17'b11101011001010111;
		expected_out = 12'b110101101011;
	end

endmodule
