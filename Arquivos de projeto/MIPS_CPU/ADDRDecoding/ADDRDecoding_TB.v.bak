`timescale 1ns/10ps

module ADDRDecoding_TB();
	
	reg [15:0] address;
	wire saida;
	
	integer i;
	
	ADDRDecoding DUT(
		.address(address),
		.saida(saida)
	);
	
	initial begin
		for(i=0;i<=2**15;i=i+1)
			#20 address = i;
	end
	
	
endmodule
