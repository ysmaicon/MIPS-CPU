module alu(a,b,sel,out);
	input [31:0] a,b;
	input [2:0] sel;
	output reg signed [31:0] out;

	always @(a or b or sel)
	begin
		case(sel)
			3'b000: out = a+b;	
			3'b001: out = a-b;	
			3'b010: out = a&b;	
			3'b011: out = a|b;	
			3'b100: out = 0;
			default: out= 0;
		endcase
	end

endmodule 