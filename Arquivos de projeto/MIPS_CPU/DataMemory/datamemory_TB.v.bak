`timescale 1ns/10ps
module datamemory_TB;
	
	reg clk;
	reg [31:0] addr;
	wire [31:0] data_out;
	reg [31:0] data_in;
	reg cs;
	reg we;

	datamemory DUT (
		.clk(clk),
		.addr(addr),
		.data_out(data_out),
		.data_in(data_in),
		.cs(cs),
		.we(we)
	);

	initial begin
		clk = 0;
		we=0;
		addr = 0;
		data_in = 34000;
		#100
		addr = 1;
		#50
		addr = 2;
		#50
		addr = 3;
		#50
		addr = 4;
		
		we=1;
		addr = 0;
		data_in = 34000;
		#100
		addr = 1;
		#50
		addr = 2;
		#50
		addr = 3;
		#50
		addr = 4;
		
		we=0;
		addr = 0;
		data_in = 34000;
		#100
		addr = 1;
		#50
		addr = 2;
		#50
		addr = 3;
		#50
		addr = 4;
	end
	
	always begin
		#10 clk = ~clk;
	end
	
	initial begin
		#900 $stop;
	end
	
endmodule 