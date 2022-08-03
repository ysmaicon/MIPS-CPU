`timescale 1ns/10ps

module pc_TB;

	reg clk;
	reg rst;
	wire [9:0] pc_out;
	
	pc DUT (
		.clk(clk),
		.rst(rst),
		.pc_out(pc_out)
	);

	initial begin
		clk = 0;
		rst = 1;
		#10 rst = 0;
		#500 rst = 1;
		#15 rst = 0;
	end
	
	always begin
		#10 clk = ~clk;
	end

	initial begin
		#1000 $stop;
	end
	
endmodule 