module ADDRDecoding(address, saida);

	input [15:0] address;
	output saida;
	
	assign saida = ~((~address[15] & ~address[14] & ~address[13] & address[12]) &
						((address[11] & address[10] & ~address[9] & ~address[8]) |
						(address[11] & ~address[10] & address[8]) |
						(address[11] & ~address[10] & address[9])));

endmodule
