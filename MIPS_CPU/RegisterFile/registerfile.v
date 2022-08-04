module registerfile(
	input clock, rst,
	input [4:0] rs, rt,
	input [4:0] control,
	input [31:0] write_back_reg,
	output reg [31:0] outputA, outputB,
	input wr // write_back_en
);

	reg[31:0] s0, s1, s2, s3, s4, s5, s6, s7, t0, t1, t2, t3, t4, t5, t6, t7;

	always@(posedge clock) begin
		if(rst == 1) s0 <= 0;
		else if(wr == 1) begin
		if(control == 0) s0 <= write_back_reg;
		end
	end

	always@(posedge clock) begin
		if(rst == 1) s1 <= 0;
		else if(wr == 1) begin
			if(control == 1) s1 <= write_back_reg;
		end
	end

	always@(posedge clock) begin
		if(rst == 1) s2 <= 0;
		else if(wr == 1) begin
			if(control == 2) s2 <= write_back_reg;
		end
	end 

	always@(posedge clock) begin
		if(rst == 1) s3 <= 0;
		else if(wr == 1) begin
			if(control == 3) s3 <= write_back_reg;
		end
	end 

	always@(posedge clock) begin
		if(rst == 1) s4 <= 0;
		else if(wr == 1) begin
			if(control == 4) s4 <= write_back_reg;
		end	
	end 

	always@(posedge clock) begin
		if(rst == 1) s5 <= 0;
		else if(wr == 1) begin
			if(control == 5) s5 <= write_back_reg;
		end
	end 

	always@(posedge clock) begin
		if(rst == 1) s6 <= 0;
		else if(wr == 1) begin
			if(control == 6) s6 <= write_back_reg;
		end
	end 

	always@(posedge clock) begin
		if(rst == 1) s7 <= 0;
		else if(wr == 1) begin
			if(control == 7) s7 <= write_back_reg;
		end
	end 

	always@(posedge clock) begin
		if(rst == 1) t0 <= 0;
		else if(wr == 1) begin
			if(control == 8) t0 <= write_back_reg;
		end
	end 

	always@(posedge clock) begin
		if(rst == 1) t1 <= 0;
		else if(wr == 1) begin
			if(control == 9) t1 <= write_back_reg;
		end
	end 

	always@(posedge clock) begin
		if(rst == 1) t2 <= 0;
		else if(wr == 1) begin
			if(control == 10) t2 <= write_back_reg;
		end
	end 

	always@(posedge clock) begin
		if(rst == 1) t3 <= 0;
		else if(wr == 1) begin
			if(control == 11) t3 <= write_back_reg;
		end
	end 

	always@(posedge clock) begin
		if(rst == 1) t4 <= 0;
		else if(wr == 1) begin
			if(control == 12) t4 <= write_back_reg;
		end
	end 

	always@(posedge clock) begin
		if(rst == 1) t5 <= 0;
		else if(wr == 1) begin
			if(control == 13) t5 <= write_back_reg;
		end
	end 

	always@(posedge clock) begin
		if(rst == 1) t6 <= 0;
		else if(wr == 1) begin
			if(control == 14) t6 <= write_back_reg;
		end
	end 

	always@(posedge clock) begin
		if(rst == 1) t7 <= 0;
		else if(wr == 1) begin
			if(control == 15) t7 <= write_back_reg;
		end
	end  

	always@(*) begin
		case(rs)
			0: outputA = s0;
			1: outputA = s1;
			2: outputA = s2;
			3: outputA = s3;
			4: outputA = s4;
			5: outputA = s5;
			6: outputA = s6;
			7: outputA = s7;
			8: outputA = t0;
			9: outputA = t1;
			10: outputA = t2;
			11: outputA = t3;
			12: outputA = t4;
			13: outputA = t5;
			14: outputA = t6;
			15: outputA = t7;
			default:outputA = write_back_reg;
		endcase		
	end

	always@(*) begin
		case(rt)
			0: outputB = s0;
			1: outputB = s1;
			2: outputB = s2;
			3: outputB = s3;
			4: outputB = s4;
			5: outputB = s5;
			6: outputB = s6;
			7: outputB = s7;
			8: outputB = t0;
			9: outputB = t1;
			10: outputB = t2;
			11: outputB = t3;
			12: outputB = t4;
			13: outputB = t5;
			14: outputB = t6;
			15: outputB = t7;
			default:outputB = write_back_reg;
		endcase
	end

endmodule
