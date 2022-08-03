`timescale 1ns/10ps

module alu_TB();

	reg [31:0] a, b;
	reg [2:0] sel;
	wire [31:0] out;

	alu DUT(
		.a(a),
		.b(b),
		.sel(sel),
		.out(out)
	);

	initial begin
		#10
		a = 2001;
		b = 4001;
		#10
		sel = 0;
		#20
		a =5001;
		b =3001;
		#10
		sel = 0;
		#20
		a =8006001;
		b =8002;
		#10
		sel = 1;
	end

	initial begin
		#100 $stop;
	end

endmodule
