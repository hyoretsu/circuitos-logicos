module maquinaDeEstadosSequencia1110
	(output reg y,
		input clock, x, reset);
		
	reg [1:0] estado_atual, estado_anterior;
	parameter A = 0, B = 1, C = 2, D = 3;
	
	always @* begin
		if (estado_atual == A && estado_anterior == D)
			y = 1;
		else
			y = 0;
	end

	always @(posedge clock, negedge reset) begin
		if (~reset)
			estado_atual <= A;
		else
			case (estado_atual)
				A: begin
					estado_anterior <= A;
					
					if (x == 0)
						estado_atual <= A;
					else
						estado_atual <= B;
				end
				B: begin
					estado_anterior <= B;
					
					if (x == 0)
						estado_atual <= A;
					else
						estado_atual <= C;
				end
				C: begin
					estado_anterior <= C;
					
					if (x == 0)
						estado_atual <= A;
					else
						estado_atual <= D;
				end
				D: begin
					estado_anterior <= D;

					if (x == 0)
						estado_atual <= A;
					else
						estado_atual <= D;
				end
			endcase
	end
endmodule