module flipFlopT
	(output reg Q,
	input T, clock);
	
	always @(posedge clock) begin
		if (T == 1)
			Q <= ~Q;
	end
endmodule