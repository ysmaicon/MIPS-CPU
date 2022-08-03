module BusController (
	input [31:0] dout,
	input cs,
	inout [31:0] buffer_output
	);

assign buffer_output = (~cs ? dout : 32'bZ);

endmodule