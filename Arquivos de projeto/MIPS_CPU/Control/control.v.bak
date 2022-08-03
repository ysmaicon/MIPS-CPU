module control(instruction,output_control);

	input [31:0] instruction;
	output [31:0] output_control;

	reg wr,cs, wr_regfile;
	reg ctl_mux_reg;
	reg ctl_mux_alu;
	reg [2:0] alu_control;
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
			5: begin 
				case(code)
					6'd32: alu_control=3'd0; //add
					6'd34: alu_control=3'd1; //sub
					6'd36: alu_control=3'd2; //and
					6'd37: alu_control=3'd3; //or
					6'd50: alu_control=3'd4; //mul
					default:alu_control = 3'd0;
				endcase
				cs = 0; 
				wr = 0;            
				ctl_mux_alu = 0;
				ctl_mux_reg = 0;
				rd = instruction[15:11];
				wr_regfile = 1;
			end
			
			6: begin //load
				alu_control = 0;     
				ctl_mux_alu = 1;     
				ctl_mux_reg = 1;     
				cs = 1; 
				wr = 0;            
				rd = rt;
				wr_regfile = 1;
			end
			
			7: begin //store
				alu_control = 0;      
				ctl_mux_alu = 1;     
				ctl_mux_reg = 1;    
				cs = 1; 
				wr = 1;              
				rd = rt;
				wr_regfile = 0;
			end
			default: begin
			   alu_control = 0;     
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

	assign output_control = {{9'b0}, {wr_regfile}, {rs}	, {rt}	, {rd} , {ctl_mux_alu}, {alu_control[2:0]}, {cs}, {wr}, {ctl_mux_reg}};
	//           0000_0000_000 	 |	 wr_regfile	| rs  	| rt  	| rd   | crl_mux_alu  | alu_control 		| cs  | wr  | crl_mux_reg
	//            [31:23]      	 |	[22] 		  	|[21:17] |[16:12] |[11:7]|     [6]      |    [5:3]    		| [2] | [1] |   [0]
	
endmodule
	