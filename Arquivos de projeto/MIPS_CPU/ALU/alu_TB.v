`timescale 1ns/100ps

module alu_TB();

	reg [31:0] a, b;
	reg [1:0] sel;
	wire [31:0] out;

	alu DUT(
		.a(a),
		.b(b),
		.sel(sel),
		.out(out)
	);

	initial begin
		// testando todas as operações para duas entradas
		sel = 0;
		a <= 5001;
		b <= 3001;
		#40
		sel <= 1;
		#40
		sel <= 2;
		#40
		sel <= 3;
		// testando soma para outras duas entradas
		#40
		sel <= 0;
		a <= 8006001;
		b <= 8002;
		
		// teste: underflow e overflow
		#40
		a <= 32'h00000000;
		b <= 32'h00000001;
		sel <= 1;
		#40
		a <= 32'hFFFFFFFF;
		b <= 32'h00000001;
		sel <= 0;
		
	end

	initial begin
		#300 $stop;
	end

endmodule