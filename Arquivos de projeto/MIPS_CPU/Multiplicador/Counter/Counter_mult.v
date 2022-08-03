module Counter_mult(clock,rst,saida,entrada);
	input clock,rst,entrada;
	reg [4:0]i;
	reg auxiliar = 1'b0;
	output reg saida;
	
	always@(posedge clock,posedge rst) begin
		if(rst)begin
	      saida = 0;
		   i = 0;
		end
	   else case({entrada,auxiliar}) 
         2'b10:begin
			      saida = 0;
					i = 0;
					auxiliar = 1;
					end
			2'b01:begin
			      if (i < 30) begin
						i = i + 1'b1;
						saida = 0;
				   end
				   else begin
						i = 0; 
						saida = 1;
				   end
					end
			default:begin
						saida = 0;
			         i = 0;
					end
		endcase
	end
	
 endmodule 