module demux1x2(A,S,out1,out2);
	input A,S;
	output out1,out2;
	
	wire s;
	not (s,S);
	
	
	and (out1,A,S);
	and (out2,A,s);
	
endmodule 