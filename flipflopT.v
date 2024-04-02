module flipflopT(clk, t, Q,reset);
	input clk, t,reset;
	output reg Q;
	// Flip Flop do tipo T.
	always@ (posedge clk) begin
		if (reset)
			Q <= 0;
		if(t)
			Q <= ~Q;
		else
			Q <= Q;	
	end
	
	
endmodule 