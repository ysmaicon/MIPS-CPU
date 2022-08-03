`timescale 1ns/10ps

module BusController_TB();

	reg [31:0] dout;
	reg cs;
	wire [31:0] buffer_output;

	BusController DUT(
		.dout(dout),
		.cs(cs),
		.buffer_output(buffer_output)
	);
	
	initial begin
		dout = 2000;
		cs = 1;
		#50 
		cs = 0;
		#50
		dout = 100;
		#50 
		cs = 1;
	end

	initial begin
		#200 $stop;
	end

endmodule