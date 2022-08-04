`timescale 1ns/100ps

module Register_TB();
	
	reg clock;
	reg [31:0] input_register;
	wire [31:0] out_register;

	Register DUT(
		.clock(clock),
		.input_register(input_register),
		.out_register(out_register)
	);

	initial begin
		clock = 0;
		input_register = 20;
	end

	always begin
		#10 clock = ~clock;
	end

	always begin
		#20 input_register = input_register + 10;
	end

	initial begin
		#600 $stop;
	end

endmodule
