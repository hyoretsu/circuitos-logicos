module contadorAsync23V
	(output reg [2:0] q,
		input clock, reset);
	
	always @(posedge clock, posedge reset)
		if (~reset)
			q <= 3;
		else if (q == 6)
			q <= 3;
		else
			q <= q + 1;
endmodule