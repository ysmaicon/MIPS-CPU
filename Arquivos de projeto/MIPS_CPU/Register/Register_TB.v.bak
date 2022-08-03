`timescale 1ns/10ps

module Register_TB;
	
	reg clock;
	reg [31:0] entrada;
	wire [31:0] saida;

	Register DUT(
		.clock(clock),
		.entrada(entrada),
		.saida(saida)
	);

	initial begin
		clock = 0;
		entrada = 20;
	end

	always begin
		#10 clock = ~clock;
	end

	always begin
		#14 entrada = entrada + 10;
	end

	initial begin
		#500 $stop;
	end

endmodule
