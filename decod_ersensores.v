module decod_ersensores(A,B,C,sa,sb,sc,sd,se,sf,sg);
	input A,B,C;
	output sa,sb,sc,sd,se,sf,sg;
	
	//DECODIFICADOR DO DIGITO 4 DO CPLD
	not (a,A);
	not (b,B);
	not (c,C);
	
	wire a,b,c,abc,ABC,bc,AB;
	
	//seg. A: abc+ABC
	and (abc,a,b,c);
	and (ABC,A,B,C);
	or (sa,abc,ABC);
	
	//seg. B: abc+AB
	and (AB,A,B);
	or (sb,abc,AB);
	
	//seg. C: bc+A
	and (bc,b,c);
	or (sc,bc,A);
	
	//seg D: a+b+C
	or (sd,a,b,c);
	
	//seg E: abc+ABC
	or (se,abc,ABC);
	
	//seg F: abc+ABC
	
	or (sf,abc,ABC);
	
	//seg G: abc+AB
	or (sg,abc,AB);
	
endmodule
	