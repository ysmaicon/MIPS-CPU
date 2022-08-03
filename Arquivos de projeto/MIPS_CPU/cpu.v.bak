module cpu(CLK,reset,resetclk,cs,wr_rd,ADDR,Data_BUS_WRITE,Data_BUS_READ,WriteBack);

	//Conexões do módulo principal
	input CLK,reset,resetclk;
	output cs,wr_rd;
	output [15:0] ADDR;
	output [31:0] Data_BUS_WRITE;
	input [31:0] Data_BUS_READ;
	output [31:0] WriteBack;
	
	//Wires com keep
	(*keep=1*)wire [31:0]instruction;
	(*keep=1*)wire [31:0]output_register_A;
	(*keep=1*)wire [31:0]output_register_B_1;
	(*keep=1*)wire [31:0]output_register_D_1;
	(*keep=1*)wire [31:0]output_register_ctrl_1;
	(*keep=1*)wire [31:0]output_mult;	
	(*keep=1*)wire [31:0]output_datamemory;
	(*keep=1*)wire CLK_SYS;
	(*keep=1*)wire CLK_MUL;
	
	//Wires
	wire locked;
	wire [9:0] counter;
	wire [31:0]output_register_inst;
	wire [31:0]output_control;	
	wire [31:0]output_extend;
	wire [31:0]output_registerfile_A;
	wire [31:0]output_registerfile_B;
	wire [31:0]output_register_IMM;
	wire [31:0]output_register_ctrl_2;
	wire [31:0]output_register_ctrl_3;
	wire [31:0]output_register_D_2;
	wire [31:0]output_mux_Execute_1;
	wire [31:0]output_alu;
	wire [31:0]output_register_B_2;
	wire [31:0]output_mux_Execute_2;
	wire [31:0]Data_BUS_READ;
	wire [31:0]output_buf_memory;
	wire output_addrdecoding;
	wire Done;
	wire Idle;
	wire [31:0]output_mux_write_back;
	
	//Assign
	assign wr_rd = output_register_ctrl_2[1]; //sinal para dispositivos externos para indicar se é uma operação de leitura ou escrita
	assign cs = output_addrdecoding;
	assign ADDR = output_register_D_1[15:0];
	assign Data_BUS_WRITE = output_register_B_2;
	assign WriteBack = output_mux_write_back; 
	
	//PLL
	PLL_MIPS PLLGenerator(resetclk,CLK,CLK_MUL,CLK_SYS,locked);
	
	//Instruction Fetch
	pc pc_MIPS(CLK_SYS,reset,counter);
	instructionmemory im(CLK_SYS,counter,instruction);
	
	//Instruction Decode
	registerfile registerfile_MIPS(CLK_SYS,reset, output_control[21:17], output_control[16:12], output_register_ctrl_3[11:7], output_mux_write_back, output_registerfile_A, output_registerfile_B, output_register_ctrl_3[22]);
	control control_MIPS(instruction,output_control);
	extend extend_MIPS(instruction[15:0], output_extend);
	Register register_A(CLK_SYS, output_registerfile_A, output_register_A);
	Register register_B_1(CLK_SYS, output_registerfile_B, output_register_B_1);
	Register register_IMM(CLK_SYS, output_extend, output_register_IMM);
	Register register_CTRL_1(CLK_SYS, output_control, output_register_ctrl_1);
	
	//Execute
	alu alu_MIPS(output_register_A, output_mux_Execute_1, output_register_ctrl_1[5:3], output_alu);
	multiplicador multiplicador_MIPS(CLK_MUL,reset,output_register_ctrl_1[5],Done,Idle,output_register_A[15:0],output_register_B_1[15:0],output_mult);
	mux mux_Execute_1(output_register_B_1,output_register_IMM,output_register_ctrl_1[6],output_mux_Execute_1);
	mux mux_Execute_2(output_alu,output_mult,output_register_ctrl_1[5],output_mux_Execute_2);
	Register register_D_1(CLK_SYS, output_mux_Execute_2, output_register_D_1);
	Register register_B_2(CLK_SYS, output_register_B_1, output_register_B_2);
	Register register_CTRL_2(CLK_SYS, output_register_ctrl_1, output_register_ctrl_2);
	
	//Memory
	ADDRDecoding ADDRDecoding_MIPS(output_register_D_1[15:0], output_addrdecoding);
	datamemory datamemory_MIPS(CLK_SYS,output_register_D_1[9:0],output_register_B_2,output_register_ctrl_2[1],output_register_ctrl_2[2],output_datamemory);
	Register register_D_2(CLK_SYS, output_register_D_1, output_register_D_2);
	Register register_CTRL_3(CLK_SYS, output_register_ctrl_2, output_register_ctrl_3);
	BusController BusController(output_datamemory,output_addrdecoding, output_buf_memory);
	
	//Write Back
	mux mux_out(output_register_D_2,output_buf_memory,output_register_ctrl_3[0],output_mux_write_back);
	
	/* #### PERGUNTAS E RESPOSTAS ####
	
a) Qual a latência do sistema?
		
R: Analisando o pipeline da implementação do MIPS, a latência é de 5 clocks. Cada instrução é executada em 5 ciclos de clock.

b) Qual o throughput do sistema?

R: O throughput do sistema é de 32 bits/clk. A partir do momento em que o pipeline estiver cheio.

c) Qual a máxima frequência operacional entregue pelo Time Quest Timing Analizer para o multiplicador e para o sistema? (Indique a FPGA utilizada)
		
R: 	FPGA UTILIZADA: EP4CGX30CF19C6 	
	Frequência Máxima Operacional do Multiplicador: 293,69 Mhz
	Frequência Máxima Operacional do Sistema: 50,28 Mhz 
		
d) Qual a máxima frequência de operação do sistema? (Indique a FPGA utilizada)
		
R: A máxima frequência de operação do sistema é dada da seguinte forma:
Frequência Máxima Operacional do Sistema= Frequência Operacional do Multiplicador / 34,
onde 34 corresponde ao número de vezes que a frequência do sistema deve ser menor em relação ao multiplicador calculado por (2N+2), com N= número de bits.
Logo,	Frequência Máxima Operacional do Sistema= 293,69 MHz/34 = 8,63 MHz
	Frequência Máxima Operacional do Sistema= 8,63 MHz
	FPGA EP4CGX30CF19C6		

e) Com a arquitetura implementada, a expressão (A*B) – (C+D) é executada corretamente (se executada em sequência ininterrupta)? Por quê? O que pode ser feito para que a expressão seja calculada corretamente?

R: Não é executada corretamente, pois ao executar as instruções ininterruptamente, estamos desrespeitando o tempo que leva para se carregar um valor no registrador, levando a tentar ler um valor até antes de se guardar ele, exatamente o que ocorre no primeiro código, a execução é falha. O segundo código representa a solução para este problema, que é justamente inserir "bolhas" para gastar tempo e os valores conseguirem ser carregados no registrador essas bolhas podem ser feitas passando uma instrução NOP, ou uma instrução com 0's, como foi feito neste sistema.

f) Analisando a sua implementação de dois domínios de clock diferentes, haverá problemas com metaestabilidade? Por quê?
		
R: Foram implementados o CLK_SYS (clock para o sistema MIPS) e o CLK_MUL (clock para o Multiplicador) utilizando-se uma PLL, de tal maneira com que CLK_MUL = CLK_SYS*34. Devido ao fato de CLK_MUL ser um múltiplo de CLK_SYS, a técnica de controle de fase pode ser utilizada nesse problema, o que garante que não haja 
problemas com metaestabilidade, já que ambos os clocks não vão possuir defasagem de fase entre si. 
	
g) A aplicação de um multiplicador do tipo utilizado, no sistema MIPS sugerido, é eficiente em termos de velocidade? Por quê?
	
R: Não, o multiplicador em si é um módulo lento, como dito anteriormente, ela demanda 34 clocks a cada 1 clock do sistema, o que leva a uma lentidão no sistema em geral, portanto, não é eficiente em termos de velocidade.

h) Cite modificações cabíveis na arquitetura do sistema que tornaria o sistema mais rápido (frequência de operação maior). Para cada modificação sugerida, qual a nova latência e throughput do sistema?

R: Uma forma de aumentar a frequência de operação do sistema é tentar reduzir o caminho crítico, removendo o multiplicador por exemplo, ou segmentando em vários estágios, o que demandaria mais memória. É preciso colocar na balança o quanto se deseja aumentar a frequência e qual será a consequência no gasto de memória. Se apenas removêssemos o multiplicador, a latência seria mantida 5 clocks e o throughput também ainda será de 32 bits/clk, mas o multiplicador não limitaria a frequência máxima do sistema. Para a segmentação em mais estágios, a latência seria aumentada, o throughput mantida, entretanto, a frequência de operação será maior.
	
	*/
	
endmodule 