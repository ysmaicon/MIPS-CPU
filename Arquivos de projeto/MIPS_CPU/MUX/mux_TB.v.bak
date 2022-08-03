`timescale 1ns/10ps

module mux_TB;

	reg [31:0] a, b;
	reg s;
	wire [31:0] out;

	mux DUT(
		.a(a),
		.b(b),
		.s(s),
		.out(out)
	);

	
	initial begin
		a = 10;
		b = 20;
		s = 0;
		#10 
		s = 1;
		#10 
		a = 100;
		b = 200;
		#10 
		s = 0;
	end

	initial begin
		#50 $stop;
	end

endmodule
