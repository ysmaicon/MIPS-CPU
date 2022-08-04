module control(
	input [31:0] instruction,
	output [31:0] output_control
);
	
	// seleciona leitura ou escrita na memória de dados
	reg wr;
	
	reg cs;
	
	// 1: habilita write no registro
	reg wr_regfile;
	
	// seleciona entre writeBack D ou M no register file
	// 0: D
	// 1: M
	reg ctl_mux_reg;
	
	// seleciona entre B ou saída do imm para entrar como segundo operando na ALU
	// 0: B
	// 1: IMM
	reg ctl_mux_alu;
	
	// seleciona a operação na ALU (+, -, &, |):
	// 00: +
	// 01: -
	// 10: &
	// 11: |
	reg [1:0] alu_control;
	
	// seleciona entre ALU e multiplicador
	reg d_sel;
	
	reg [5:0] op;
	reg [4:0] rs;
	reg [4:0] rt;
	reg [4:0] rd;
	reg [5:0] code;
	
	always @(instruction) begin

			op = instruction[31:26];
			rs = instruction[25:21];
			rt = instruction[20:16];
			code = instruction[5:0];
			
		case(op)
			1: begin 
				cs = 0; 
				wr = 0;    
				ctl_mux_alu = 0;
				ctl_mux_reg = 0;
				rd = instruction[15:11];
				wr_regfile = 1;
				
				if(instruction[10:6] == 10 && code == 50) //mul
				begin
					alu_control=2'd0;
					d_sel = 1;
				end
				
				else if(instruction[10:6] == 10 && code == 32) //add
				begin			            
					alu_control=2'd0;
					d_sel = 0;
				end
				
				else if(instruction[10:6] == 10 && code == 34) //sub
				begin
					alu_control=2'd1;
					d_sel = 0;
				end
				
				else if(instruction[10:6] == 10 && code == 36) //and
				begin
					alu_control=2'd2;
					d_sel = 0;
				end
				
				else if(instruction[10:6] == 10 && code == 37) //or
				begin
					alu_control=2'd3;
					d_sel = 0;
				end	
			end
			
			2: begin //load
				alu_control = 0;
				d_sel = 0;
				ctl_mux_alu = 1;     
				ctl_mux_reg = 1;     
				cs = 1; 
				wr = 0;            
				rd = rt;
				wr_regfile = 1;
			end
			
			3: begin //store
				alu_control = 0; 
				d_sel = 0;
				ctl_mux_alu = 1;     
				ctl_mux_reg = 1;    
				cs = 1; 
				wr = 1;              
				rd = rt;
				wr_regfile = 0;
			end
			default: begin
			   alu_control = 0;
				d_sel = 0;				
				ctl_mux_alu = 0;     
				ctl_mux_reg = 0;     
				cs = 0; 
				wr = 0;            
				rd = 0;
				rs = 0;
				rt = 0;
				wr_regfile = 0;
			end
		endcase
	end

	assign output_control = {     {9'b0},        {wr_regfile},     {rs},      {rt},     {rd},    {ctl_mux_alu},   {d_sel},    {alu_control[1:0]},   {cs},   {wr},  {ctl_mux_reg}};
	//                        0000_0000_000 	|	 wr_regfile	  |    rs  	 |    rt  	|   rd   |   crl_mux_alu  |   d_sel   |      alu_control 	|   cs   |  wr  |  crl_mux_reg
	//                            [31:23]     |	    [22] 	  |  [21:17] |  [16:12] | [11:7] |       [6]      |    [5]    |         [4:3]  		|   [2]  |  [1] |      [0]
	
endmodule
	