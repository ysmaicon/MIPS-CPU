module instructionmemory(
    input CLK_SYS,
    input [9:0] pc,
    output reg [31:0] instruction
);
	reg [31:0] instructionInt [1023:0];

	initial begin	
	//*** CONSIDERANDO O CÓDIGO 1 DE EXEMPLO - VERIFICAÇÃO DO PIPELINE HAZZARD ***
		instructionInt[0] = 32'b000010_00111_00000_0000_0101_0000_0000;	//(Gasta uma instrução)
		instructionInt[1] = 32'b000010_00111_00000_0000_0101_0000_0000;	//(Carrega A em R0)
		instructionInt[2] = 32'b000010_00111_00001_0000_0101_0000_0001;	//(Carrega B em R1) 
		instructionInt[3] = 32'b000010_00111_00010_0000_0101_0000_0010;	//(Carrega C em R2)
		instructionInt[4] = 32'b000010_00111_00011_0000_0101_0000_0011;	//(Carrega D em R3)
		instructionInt[5] = 32'b000001_00000_00001_00100_01010_110010;		//(Multiplica o conteudo de R0 pelo conteudo de R1 e carrega o resultado em R4) 
		instructionInt[6] = 32'b000001_00010_00011_00101_01010_100000;		//(Soma o conteudo de R2 pelo conteudo de R3 e carrega o resultado em R5) 
		instructionInt[7] = 32'b000001_00100_00101_00110_01010_100010;		//(Subtrai o conteudo de R4 pelo conteudo de R5 e carrega o resultado em R6)
		instructionInt[8] = 32'b000011_00111_00110_0000_1000_1111_1111;	//(Armazena o resultado de R6 na posição 1023 da memória)	
	// *** INSERINDO BOLHAS - VERIFICANDO A NAO PRESENÇA DE PIPELINE HAZZARDS ***
		instructionInt[9]  = 32'b000010_00111_00000_0000_0101_0000_0000;	//(Gasta uma instrução)
		instructionInt[10] = 32'b000010_00111_00000_0000_0101_0000_0000;	//(Carrega A em R0)
		instructionInt[11] = 32'b000010_00111_00001_0000_0101_0000_0001;	//(Carrega B em R1) 
		instructionInt[12] = 32'b000010_00111_00010_0000_0101_0000_0010;	//(Carrega C em R2)
		instructionInt[13] = 32'b000010_00111_00011_0000_0101_0000_0011;	//(Carrega D em R3)
		instructionInt[14] = 32'b000010_00111_00111_0000_0101_0000_0000;	//(Gasta uma instrução) --> Bolha
		instructionInt[15] = 32'b000010_00111_00111_0000_0101_0000_0000;	//(Gasta uma instrução) --> Bolha
		instructionInt[16] = 32'b000010_00111_00111_0000_0101_0000_0000;	//(Gasta uma instrução) --> Bolha
		instructionInt[17] = 32'b000001_00000_00001_00100_01010_110010;	//(Multiplica o conteudo de R0 pelo conteudo de R1 e carrega o resultado em R4) 
		instructionInt[18] = 32'b000010_00111_00111_0000_0101_0000_0000;	//(Gasta uma instrução) --> Bolha
		instructionInt[19] = 32'b000010_00111_00111_0000_0101_0000_0000;	//(Gasta uma instrução) --> Bolha
		instructionInt[20] = 32'b000001_00010_00011_00101_01010_100000;	//(Soma o conteudo de R2 pelo conteudo de R3 e carrega o resultado em R5)
		instructionInt[21] = 32'b000010_00111_00111_0000_0101_0000_0000;	//(Gasta uma instrução) --> Bolha
		instructionInt[22] = 32'b000010_00111_00111_0000_0101_0000_0000;	//(Gasta uma instrução) --> Bolha
		instructionInt[23] = 32'b000001_00100_00101_00110_01010_100010;	//(Subtrai o conteudo de R4 pelo conteudo de R5 e carrega o resultado em R6)
		instructionInt[24] = 32'b000010_00111_00111_0000_0101_0000_0000;	//(Gasta uma instrução) --> Bolha
		instructionInt[25] = 32'b000010_00111_00111_0000_0101_0000_0000;	//(Gasta uma instrução) --> Bolha
		instructionInt[26] = 32'b000011_00111_00110_0000_1000_1111_1111;	//(Armazena o resultado de R6 na posição 1023 da memória)
	end

	always @ (posedge CLK_SYS) begin
		instruction <= instructionInt[pc];
	end

endmodule
