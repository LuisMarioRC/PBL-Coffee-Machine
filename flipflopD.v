module flipflopD(clk,D,Q,clear);
	input D,clk,clear;
	output reg Q;
	
	always @(posedge clk or posedge clear) begin 
		if (clear)
			Q<=0;
		else begin
			Q <= D;
		end
	end

endmodule 