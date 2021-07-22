`timescale 100ns/100ns		// For 1MHZ clock in #10
module BCD_Counter_TB;

wire [3:0] number;
wire extra;
reg enable, clk;
reg[3:0] expected_out;
	
BCD_Counter myCount(number, extra, clk, enable);

initial 
begin
	clk = 1'b0;
	enable = 1'b1;
	#10 expected_out = 4'b0000;
	#1 enable = 1'b0;
	#19 expected_out = 4'b0001;

        #20 expected_out = 4'b0010;

        #20 expected_out = 4'b0011;

        #20 expected_out = 4'b0100;

        #20 expected_out = 4'b0101;

       	#20 expected_out = 4'b0110;

        #20 expected_out = 4'b0111;

        #20 expected_out = 4'b1000;

        #20 expected_out = 4'b1001;

        #20 expected_out = 4'b0000;

        #20 expected_out = 4'b0001;

        #20 expected_out = 4'b0010;

end

always
begin 
	#10 clk = ~clk;
end

endmodule
