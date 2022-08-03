`timescale 1ns/100ps

module registerfile_TB();
	
	reg clock, reset;
	reg [4:0] controle;
	reg [4:0] rs, rt;
	reg [31:0] entrada;
	reg wr;
	wire [31:0] saidaA, saidaB;

	registerfile DUT(
		.clock(clock),
		.reset(reset),
		.rs(rs),
		.rt(rt),
		.controle(controle),
		.entrada(entrada),
		.saidaA(saidaA),
		.saidaB(saidaB),
		.wr(wr)
	);

	initial begin
		controle = 0;
		clock = 0;
		reset = 0;
		entrada = 250;
		wr = 1;
		
		#40
		entrada = entrada + 25;
		controle = controle + 1; //1
		rs = 5;
		rt = 0; 
		
		#40
		entrada = entrada + 25;
		controle  = controle + 1; //2
		rs = 5; 
		rt = 1; 
		
		#40
		entrada = entrada + 25;
		controle = controle + 1; //3
		rs = 5; 
		rt = 2; 
		
		#40
		entrada = entrada + 25;
		controle = controle + 1; //4
		rs = 5;
		rt = 3;
		
		#40
		entrada = entrada + 25;
		controle = controle + 1; //5
		rs = 0; 
		rt = 1;
		
		#40
		entrada = entrada + 25;
		controle = controle + 1; //6
		rs = 2; 
		rt = 3; 
		
		#40
		entrada = entrada + 25;
		controle = controle + 1; //7
		rs = 8; 
		rt = 9; 
		
		#40
		entrada = entrada + 25;
		controle = controle + 1; //8
		rs = 5; 
		rt = 10; 
			
		#40
		entrada = entrada + 25;
		controle = controle + 1; //9
		rs = 5; 
		rt = 10; 
		
		#40
		entrada = entrada + 25;
		controle = controle + 1; //10
		rs = 5; 
		rt = 10; 
		
	end
	
	always #10 clock = ~clock;

initial
	 #1000 $stop;

endmodule
