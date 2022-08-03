module datamemory(clk,addr,data_in,we,cs,data_out);

	input clk, we, cs;
	input [9:0] addr;
	input [31: 0] data_in;
	output  reg[31:0] data_out;
	
	reg [31:0] memory [0:1023];

	initial begin
		memory[0] = 32'b0000_0000_0000_0000_0000_0111_1101_0001; // A = 2001
		memory[1] = 32'b0000_0000_0000_0000_0000_1111_1010_0001; // B = 4001
		memory[2] = 32'b0000_0000_0000_0000_0001_0011_1000_1001; // C = 5001
		memory[3] = 32'b0000_0000_0000_0000_0000_1011_1011_1001; // D = 3001
	end

	always @(posedge clk) begin
		if (we)
			memory[addr-256] <= data_in;
		else
			data_out <= memory[addr-256];
	end

endmodule
