module ADDRDecoding(
	input [15:0] Address,
	output saida
	);
	
	// temos para a memória de 500(h) até 8FF(h)
	//     | 11 10 9  8 | 7 6 5 4 | 3 2 1 0 | CS |  
	// 04FF| 0  1  0  0 | 1 1 1 1 | 1 1 1 1 | 1  |
	// 0500| 0  1  0  1 | 0 0 0 0 | 0 0 0 0 | 0  |
	// 05FF| 0  1  0  1 | 1 1 1 1 | 1 1 1 1 | 0  |
	// 0600| 0  1  1  0 | 0 0 0 0 | 0 0 0 0 | 0  |
	// 06FF| 0  1  1  0 | 1 1 1 1 | 1 1 1 1 | 0  |
	// 0700| 0  1  1  1 | 0 0 0 0 | 0 0 0 0 | 0  |
	// 0700| 0  1  1  1 | 1 1 1 1 | 1 1 1 1 | 0  |
	// 0800| 1  0  0  0 | 0 0 0 0 | 0 0 0 0 | 0  |
	// 08FF| 1  0  0  0 | 1 1 1 1 | 1 1 1 1 | 0  |
	// 0900| 1  0  0  1 | 0 0 0 0 | 0 0 0 0 | 1  |
	
	// mapa de Karnaugh:
	//      \9,8 | 00 | 01 | 11 | 10 |
	// 11,10|  00|  1 |  1 |  1 |  1 |
	//         01|  1 |  0 |  0 |  0 |
	//    	  11|  1 |  1 |  1 |  1 |
	//         10|  0 |  1 |  1 |  1 |
	
	assign saida = ((~Address[11] | Address[10] | Address[9] | Address[8]) &
					 (Address[11] | ~Address[10] | ~Address[8]) &
					 (Address[11] | ~Address[10] | ~Address[9]));

endmodule
