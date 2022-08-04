`timescale 1ns/100ps

module control_TB();

	reg [31:0] instr;
	wire [31:0] output_control;
	
	control DUT(
		.instruction(instr),
		.output_control(output_control)
	);

	initial begin
		
		// load A: para inicializar
		instr = 32'b000010_00111_00000_0000_0101_0000_0000;
		#10
		$display("Instruction = %b    |    output_control = %b", instr, output_control);
		
		// load A
		#50
		instr = 32'b000010_00111_00000_0000_0101_0000_0000;
		#10
		$display("Instruction = %b    |    output_control = %b", instr, output_control);
		
		// load B
		#50 
		instr = 32'b000010_00111_00001_0000_0101_0000_0001;
		#10
		$display("Instruction = %b    |    output_control = %b", instr, output_control);
		
		// load C
		#50 
		instr = 32'b000010_00111_00010_0000_0101_0000_0010;
		#10
		$display("Instruction = %b    |    output_control = %b", instr, output_control);
		
		// load D
		#50 
		instr = 32'b000010_00111_00011_0000_0101_0000_0011;
		#10
		$display("Instruction = %b    |    output_control = %b", instr, output_control);
		
		// multiplicação: A*B
		#50 
		instr = 32'b000001_00000_00001_00100_01010_110010;
		#10
		$display("Instruction = %b    |    output_control = %b", instr, output_control);
		
		// soma: C+D
		#50 
		instr = 32'b000001_00010_00011_00101_01010_100000;
		#10
		$display("Instruction = %b    |    output_control = %b", instr, output_control);
		
		// subtração: (A*B)-(C+D)
		#50 
		instr = 32'b000001_00100_00101_00110_01010_100010;
		#10
		$display("Instruction = %b    |    output_control = %b", instr, output_control);
		
		// store: guarda resultado
		#50 
		instr = 32'b000011_00111_00110_0000_1000_1111_1111;
		#10
		$display("Instruction = %b    |    output_control = %b", instr, output_control);
		
		// or: C|D
		#50 
		instr = 32'b000001_00010_00011_01001_01010_100101;
		#10
		$display("Instruction = %b    |    output_control = %b", instr, output_control);
		
		// and: C&D
		#50 
		instr = 32'b000001_00010_00011_01001_01010_100100;
		#10
		$display("Instruction = %b    |    output_control = %b", instr, output_control);
		
		
	end
	
	initial #800 $stop;
		
endmodule
