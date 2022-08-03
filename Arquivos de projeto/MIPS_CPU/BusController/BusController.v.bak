module BusController (dout, cs, buffer_output);

// When tri-state buffers are output enabled, they output a value. 
// Otherwise their "output" is set to high-impedence.

input [31:0] dout;
inout [31:0] buffer_output;
input cs;

assign buffer_output = (~cs ? dout : 32'bZ);


endmodule