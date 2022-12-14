module flipFlopJK
	(output reg Q,
	input clock, J, K);
	
	always @(posedge clock) begin
		if (J == 0 & K == 1)
			Q <= 0;
		else if (J == 1 & K == 0)
			Q <= 1;
		else if (J == 1 & K == 1)
			Q <= ~Q;
	end
endmodule