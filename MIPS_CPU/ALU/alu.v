module alu(
	input [31:0] a,b,
	input [1:0] sel,
	output reg signed [31:0] out
);

	always @(a or b or sel)
	begin
		case(sel)
			3'b00: out = a+b;	
			3'b01: out = a-b;	
			3'b10: out = a&b;	
			3'b11: out = a|b;	
			3'b00: out = 0;
			default: out= 0;
		endcase
	end

endmodule 