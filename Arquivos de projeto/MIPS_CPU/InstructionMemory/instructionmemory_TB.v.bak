`timescale 1ns/10ps

module instructionmemory_TB;

	reg CLK_SYS;
	reg[9:0] pc;
	wire [31:0] instruction;

	instructionmemory DUT(
		.CLK_SYS(CLK_SYS),
		.pc(pc),
		.instruction(instruction)
	);

	initial begin
		CLK_SYS = 0;
		#60
		pc = 0;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);
		
		#120
		pc = 1;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);

		#120
		pc = 2;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);

		#120
		pc = 3;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);

		#120
		pc = 4;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);

		#120
		pc = 5;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);

		#120
		pc = 6;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);

		#120
		pc = 7;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);

		#120
		pc = 8;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);

		#120
		pc = 9;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);

		#120
		pc = 10;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);

		#120
		pc = 11;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);
	
		#120
		pc = 12;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);

		#120
		pc = 13;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);

		#120
		pc = 14;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);

		#120
		pc = 15;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);

		#120
		pc = 16;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);

		#120
		pc = 17;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);

		#120
		pc = 18;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);

		#120
		pc = 19;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);

		#120
		pc = 20;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);

		#120
		pc = 21;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);
	
		#120
		pc = 22;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);
	
		#120
		pc = 23;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);
	
		#120
		pc = 24;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);
	
		#120
		pc = 25;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);
		
		#120
		pc = 26;
		#50
		$display("PC = %d        InstructionOut = %b", pc, instruction);
		
		#120
		$display("PC = %d        InstructionOut = %b", pc, instruction);

end

initial
	#5000 $stop;

always begin
	#20 CLK_SYS = ~CLK_SYS;
end

endmodule
