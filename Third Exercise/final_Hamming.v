module final_Hamming(output wire[11:0] decoded, input wire[11:0] data, wire[31:0] error);

	reg[16:0] dataAfterNoise;
	wire[16:0] encoded;

	hamming_encoder myEncoder(encoded, data);

	hamming_decoder myDecoder(decoded, dataAfterNoise);


	always @(data)
	begin
		if(error > 11) 
		begin
        		dataAfterNoise = encoded;
        end 
		else 
		begin
	        	dataAfterNoise = encoded;
            	dataAfterNoise[error] = ~dataAfterNoise[error];
        end
   	end

endmodule

