`timescale 1ns/10ps

module control_TB();

	reg [31:0] instruction;
	wire [31:0] output_control;
	
	control DUT(
		.instruction(instruction),
		.output_control(output_control)
	);

	initial begin
	
			 instruction = 32'b000110_00101_00111_0001_1001_0000_0000;	//(Gasta uma instrução)
		#10
		$display("Instruction = %b    |    output_control = %b", instruction, output_control);
		//           0_0000_000 		 |	 wr_regfile	| rs  	| rt  	| rd   | crl_mux_alu  | alu_control 		| cs  | wr  | crl_mux_reg
		//            [31:23]      	 |	[22] 		  	|[21:17] |[16:12] |[11:7]|     [6]      |    [5:3]    		| [2] | [1] |   [0]
		
		// output_control = 32'b 0_0000_0000_1_00101_00111_00111_1_000_1_0_1
		
		
		#60 instruction = 32'b000110_00101_00000_0001_1001_0000_0000;	//(Carrega A)
		#10
		$display("Instruction = %b    |    output_control = %b", instruction, output_control);
		//           0_0000_0000 		 |	 wr_regfile	| rs  	| rt  	| rd   | crl_mux_alu  | alu_control 		| cs  | wr  | crl_mux_reg
		//            [31:23]      	 |	[22] 		  	|[21:17] |[16:12] |[11:7]|     [6]      |    [5:3]    		| [2] | [1] |   [0]
		
		// output_control = 32'b 0_0000_0000_1_00101_00000_00000_1_000_1_0_1
		
		#60 instruction = 32'b000110_00101_00001_0001_1001_0000_0001;	//(Carrega B)
		#10
		$display("Instruction = %b    |    output_control = %b", instruction, output_control);
		//           0000_0000_000 	 |	 wr_regfile	| rs  	| rt  	| rd   | crl_mux_alu  | alu_control 		| cs  | wr  | crl_mux_reg
		//            [31:23]      	 |	[22] 		  	|[21:17] |[16:12] |[11:7]|     [6]      |    [5:3]    		| [2] | [1] |   [0]
		
		// output_control = 32'b 0_0000_0000_1_00101_00001_00001_1_000_1_0_1
		
		#60 instruction = 32'b000110_00101_00010_0001_1001_0000_0010;	//(Carrega C)
		#10
		$display("Instruction = %b    |    output_control = %b", instruction, output_control);
		//           0000_0000_000 	 |	 wr_regfile	| rs  	| rt  	| rd   | crl_mux_alu  | alu_control 		| cs  | wr  | crl_mux_reg
		//            [31:23]      	 |	[22] 		  	|[21:17] |[16:12] |[11:7]|     [6]      |    [5:3]    		| [2] | [1] |   [0]
		
		// output_control = 32'b 0_0000_0000_1_00101_00010_00010_1_000_1_0_1
		
		#60 instruction = 32'b000110_00101_00011_0001_1001_0000_0011;	//(Carrega D)
		#10
		$display("Instruction = %b    |    output_control = %b", instruction, output_control);
		//           0000_0000_000 	 |	 wr_regfile	| rs  	| rt  	| rd   | crl_mux_alu  | alu_control 		| cs  | wr  | crl_mux_reg
		//            [31:23]      	 |	[22] 		  	|[21:17] |[16:12] |[11:7]|     [6]      |    [5:3]    		| [2] | [1] |   [0]
		
		// output_control = 32'b 0_0000_0000_1_00101_00011_00011_1_000_1_0_1
		
		#60 instruction = 32'b000101_00000_00001_01000_01010_110010;	//(Multiplica)
		#10
		$display("Instruction = %b    |    output_control = %b", instruction, output_control);
		//           0000_0000_000 	 |	 wr_regfile	| rs  	| rt  	| rd   | crl_mux_alu  | alu_control 		| cs  | wr  | crl_mux_reg
		//            [31:23]      	 |	[22] 		  	|[21:17] |[16:12] |[11:7]|     [6]      |    [5:3]    		| [2] | [1] |   [0]
		
		// output_control = 32'b 0_0000_0000_1_00000_00001_01000_0_100_0_0_0
		
		#60 instruction = 32'b000101_00010_00011_01001_01010_100000;	//(Soma)
		#10
		$display("Instruction = %b    |    output_control = %b", instruction, output_control);
		//           0000_0000_000 	 |	 wr_regfile	| rs  	| rt  	| rd   | crl_mux_alu  | alu_control 		| cs  | wr  | crl_mux_reg
		//            [31:23]      	 |	[22] 		  	|[21:17] |[16:12] |[11:7]|     [6]      |    [5:3]    		| [2] | [1] |   [0]
		
		// output_control = 32'b 0_0000_0000_1_00010_00011_01001_0_000_0_0_0

		#60 instruction = 32'b000101_01000_01001_01010_01010_100010;	//(Subtrai)
		#10
		$display("Instruction = %b    |    output_control = %b", instruction, output_control);
		//           0000_0000_000 	 |	 wr_regfile	| rs  	| rt  	| rd   | crl_mux_alu  | alu_control 		| cs  | wr  | crl_mux_reg
		//            [31:23]      	 |	[22] 		  	|[21:17] |[16:12] |[11:7]|     [6]      |    [5:3]    		| [2] | [1] |   [0]
		
		// output_control = 32'b 0_0000_0000_1_01000_01001_01010_0_001_0_0_0

		#60 instruction = 32'b000111_00101_01010_0001_1100_1111_1111;	//(Armazena o resutlado)
		#10
		$display("Instruction = %b    |    output_control = %b", instruction, output_control);
		//           0000_0000_000 	 |	 wr_regfile	| rs  	| rt  	| rd   | crl_mux_alu  | alu_control 		| cs  | wr  | crl_mux_reg
		//            [31:23]      	 |	[22] 		  	|[21:17] |[16:12] |[11:7]|     [6]      |    [5:3]    		| [2] | [1] |   [0]
		
		// output_control = 32'b 0_0000_0000_0_00101_01010_01010_1_000_1_1_1
		
		
	end
	
	initial
		#700 $stop;
		

endmodule
