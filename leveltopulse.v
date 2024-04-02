module leveltopulse(clk, level, pulse);
	input clk, level;
	output pulse;
	
	wire A, B;
	
	flipflopD(clk,level,A);
	flipflopD(clk,A,B);
	
	and(pulse, A, ~B);
	
endmodule 