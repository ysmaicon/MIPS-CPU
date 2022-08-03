`timescale 1ns/100ps

module instructionmemory_TB();

	reg CLK_SYS;
	reg rst;
	reg[9:0] pc;
	wire [31:0] instruction;

	instructionmemory DUT(
		.CLK_SYS(CLK_SYS),
		.rst(rst),
		.pc(pc),
		.instruction(instruction)
	);
	
	integer i = 0;

	initial begin
		CLK_SYS = 0;
		rst = 1;
		#10 rst = 0;
		
		for (i=0;i<26;i=i+1)
			begin
				#120
				pc=i;		
				$display("PC = %d     |    InstructionOut = %b", pc, instruction);
			end
end

initial
	#6000 $stop;

always begin
	#20 CLK_SYS = ~CLK_SYS;
end

en