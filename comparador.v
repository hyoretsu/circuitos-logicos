module comparador
	(output maior, menor, igual,
	input [7:0] A, B);
	
	assign igual = (A == B);
	assign maior = (A > B);
	assign menor = (A < B);
endmodule