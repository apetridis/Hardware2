module hamming_decoder(output reg[11:0] decoded, input wire[16:0] data);

	wire[4:0] errorBits;
	reg[16:0] afterData;

  	assign errorBits[0] = data[0] ^ data[2] ^ data[4] ^ data[6] ^ data[8] ^ data[10] ^ data[12] ^ data[14] ^ data[16];
	assign errorBits[1] = data[1] ^ data[2] ^ data[5] ^ data[6] ^ data[9] ^ data[10] ^ data[13] ^ data[14];
	assign errorBits[2] = data[3] ^ data[4] ^ data[5] ^ data[6] ^ data[11] ^ data[12] ^ data[13] ^ data[14];
	assign errorBits[3] = data[7] ^ data[8] ^ data[9] ^ data[10] ^ data[11];
	assign errorBits[4] = data[15] ^ data[16];

	assign decoded = {afterData[16], afterData[14:8], afterData[6:4], afterData[2]};

    always @(data) begin: ERROR_CORRECTION
        afterData = data;
        case (errorBits)
            1:  disable ERROR_CORRECTION;
            2:  disable ERROR_CORRECTION;
            4:  disable ERROR_CORRECTION;
            8:  disable ERROR_CORRECTION;
            16: disable ERROR_CORRECTION;
            default: {afterData[errorBits]} = ~{afterData[errorBits]};
        endcase
    end

endmodule
