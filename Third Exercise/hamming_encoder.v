module hamming_encoder(output reg [17:1] encoded, input wire [11:0] data);
	
	reg firstParityBit, secondParityBit, thirdParityBit, fourthParityBit, fifthParityBit;

	assign firstParityBit = encoded[3] ^ encoded[5] ^ encoded[7] ^ encoded[9] ^ encoded[11] ^ encoded[13] ^ encoded[15] ^ encoded[17];
	assign secondParityBit = encoded[3] ^ encoded[6] ^ encoded[7] ^ encoded[10] ^ encoded[11] ^ encoded[14] ^ encoded[15];
	assign thirdParityBit = encoded[5] ^ encoded[6] ^ encoded[7] ^ encoded[12] ^ encoded[13] ^ encoded[14] ^ encoded[15];
	assign fourthParityBit = encoded[9] ^ encoded[10] ^ encoded[11] ^ encoded[12];
	assign fifthParityBit = encoded[17];

	assign encoded[1] = firstParityBit;
   	assign encoded[2] = secondParityBit;
	assign encoded[3] = data[0];
	assign encoded[4] = thirdParityBit;
	assign encoded[5] = data[1];
	assign encoded[6] = data[2];
	assign encoded[7] = data[3];
	assign encoded[8] = fourthParityBit;
	assign encoded[9] = data[4];
	assign encoded[10] = data[5];
	assign encoded[11] = data[6];
	assign encoded[12] = data[7];
	assign encoded[13] = data[8];
	assign encoded[14] = data[9];
	assign encoded[15] = data[10];
	assign encoded[16] = fifthParityBit;
	assign encoded[17] = data[11];

endmodule
