module maquina_de_estados_detetor_de_padroes
	(output reg y,
		input clock, x, reset);

	reg [1:0] estado_atual, estado_anterior;
	parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;

	always @* begin
		case (estado_atual)
			S0:
				y = 0;
			S1:
				if (estado_anterior == S3)
					y = 1;
				else
					y = 0;
			S2:
				y = 0;
			S3:
				y = 0;
		endcase
	end

	always @(posedge clock, negedge reset) begin
		if (~reset)
			estado_atual <= S0;
		else begin
			case (estado_atual)
				S0: begin
					if (x == 0) begin
						estado_atual <= S0;
						estado_anterior <= S0;
					end else begin
						estado_atual <= S1;
						estado_anterior <= S0;
					end
				end
				S1: begin
					if (x == 0) begin
						estado_atual <= S0;
						estado_anterior <= S1;
					end else begin
						estado_atual <= S2;
						estado_anterior <= S1;
					end
				end
				S2: begin
					if (x == 0) begin
						estado_atual <= S3;
						estado_anterior <= S2;
					end else begin
						estado_atual <= S2;
						estado_anterior <= S2;
					end
				end
				S3: begin
					if (x == 0) begin
						estado_atual <= S0;
						estado_anterior <= S3;
					end else begin
						estado_atual <= S1;
						estado_anterior <= S3;
					end
				end
			endcase
		end
	end
endmodule