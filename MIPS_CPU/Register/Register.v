module Register(
	input clock,
	input [31:0] input_register,
	output reg [31:0] out_register
);

	always @(posedge clock)begin
		out_register <= input_register;
	end
	
endmodule
