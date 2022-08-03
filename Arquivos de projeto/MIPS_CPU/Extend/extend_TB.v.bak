`timescale 1ns/10ps

module extend_TB;
	
	reg [15:0] entrada;
	wire [31:0] saida;
 
	extend DUT (
		.entrada(entrada),
		.saida(saida)
	);
	
	initial begin
		entrada = 1;
		#100
		entrada = entrada + 1000;
		#100
		entrada = entrada + 1000;
		#100
		entrada = entrada + 1000;
		#100
		entrada = entrada + 1000;
	end


	initial begin
		#500 $stop;
	end
 
endmodule
