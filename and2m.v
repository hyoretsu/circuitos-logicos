module and2m
	(input A, B,
	output reg C);

	always @(A, B) begin
		C = A & B;
	end
endmodule