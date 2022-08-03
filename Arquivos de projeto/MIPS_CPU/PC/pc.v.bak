module pc(clk,rst,pc_out);

	input clk;
	input rst;
	output [9:0] pc_out;
	reg [9:0]reg_pc;

	always@(posedge clk or posedge rst) begin 
		if(rst)
			reg_pc <= 0; 	
		else
			reg_pc <= reg_pc + 1'b1; 
	end

	assign pc_out = reg_pc;

endmodule 