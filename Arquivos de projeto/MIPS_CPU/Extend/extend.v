module extend(entrada, saida);

	input [15:0] entrada;
	output [31:0] saida;

	assign saida = {16'h0000, entrada};

endmodule
