`timescale 100ns/100ns	
module BCD_TO_LED_TB;

	wire[6:0] LED;
	reg[3:0] number;
	reg LED_TYPE;

	reg[6:0] expected_out;
	
	BCD_TO_LED myBCD_TO_LED(LED, number, LED_TYPE);


	initial 
	begin
        	// Common ?node
	        LED_TYPE = 1'b1;
	
       		#1 number = 4'b_0000;	// Number 0
      		expected_out = 7'b_1111110;

        	#1 number = 4'b_0001;	// Number 1
        	expected_out = 7'b_0110000;

       		#1 number = 4'b_0010;	// Number 2
        	expected_out = 7'b_1101101;

        	#1 number = 4'b_0011;	//Number 3
        	expected_out = 7'b_1111001;

       		#1 number = 4'b_0100;	// Number 4
        	expected_out = 7'b_0110011;

        	#1 number = 4'b_0101;	// Number 5
        	expected_out = 7'b_1011011;

        	#1 number = 4'b_0110;	// Number 6
        	expected_out = 7'b_1011111;

        	#1 number = 4'b_0111;	// Number 7
        	expected_out = 7'b_1110000;

        	#1 number = 4'b_1000;	// Number 8
        	expected_out = 7'b_1111111;

        	#1 number = 4'b_1001;	// Number 9
        	expected_out = 7'b_1111011;


        	// Common cathode
        	#1 LED_TYPE = 1'b0;

        	#1 number = 4'b_0000;	// Number 0
        	expected_out = ~(7'b_1111110);

        	#1 number = 4'b_0001;	// Number 1
        	expected_out = ~(7'b_0110000);

        	#1 number = 4'b_0010;	// Number 2
        	expected_out = ~(7'b_1101101);

        	#1 number = 4'b_0011;	// Number 3
        	expected_out = ~(7'b_1111001);

		#1 number = 4'b_0100;	// Number 4
        	expected_out = ~(7'b_0110011);

        	#1 number = 4'b_0101;	// Number 5
        	expected_out = ~(7'b_1011011);

        	#1 number = 4'b_0110;	// Number 6
        	expected_out = ~(7'b_1011111);

        	#1 number = 4'b_0111;	// Number 7
        	expected_out = ~(7'b_1110000);

        	#1 number = 4'b_1000;	// Number 8
        	expected_out = ~(7'b_1111111);

        	#1 number = 4'b_1001;	// Number 9
        	expected_out = ~(7'b_1111011);

    end
endmodule
