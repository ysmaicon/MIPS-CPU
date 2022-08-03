module Control_mult(clock,rst,shift,load,start,ad,M,K,Idle,Done);
 
	input clock,rst,start,M,K;
	output reg shift,load,ad,Idle,Done;
	reg [1:0] estado_atual;
	parameter s0 = 2'b00,s1 = 2'b01,s2 = 2'b10,s3 = 2'b11;
 
	always@(posedge clock,posedge rst)begin
		if (rst) 
			estado_atual <= s0;
		else
		case(estado_atual)
			s0:	if(start)
						estado_atual <= s1;
					else 
						estado_atual <= s0;
			s1:   if(K)
			         estado_atual <= s3;
			      else
			         estado_atual <= s2;
			s2:   if(K)
			         estado_atual <= s3;
					else
						estado_atual <= s1;
			s3:      estado_atual <= s0;
			default: estado_atual <= s0;
		endcase
	end
	 
   always @ (estado_atual,start,M) begin
	   case (estado_atual)
			s0:	begin
						Done = 0;
						Idle = 1;
						shift = 0;
						ad = 0;
						if(start)begin
			            load = 1;
						end
						else load = 0;
						end
		   s1:	begin
						Done = 0;
						Idle = 0;
						load = 0;
						shift = 0;
						if(M) begin
			            ad = 1;
							end
						else  begin
						   ad = 0;
						end
						end
		   s2: 	begin
						Done = 0;
						Idle = 0;
						load = 0;
						shift = 1;
						ad = 0;
						end
		   s3: 	begin 
						Done = 1;
						Idle = 0;
						load = 0;
						ad = 0;
						shift = 0;
						end
		endcase
   end
	
 endmodule
 