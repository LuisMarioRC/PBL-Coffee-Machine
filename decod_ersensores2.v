module decod_ersensores2(A,B,C,sa,sb,sc,sd,se,sf,sg);
	input A,B,C;
	output sa,sb,sc,sd,se,sf,sg;
	
	//DECODIFICADOR DO DIGITO 3 DO CPLD
	//inversoras
	not (a,A);
	not (b,B);
	not (c,C);
	
	wire a,b,c,abc,ABC;
	
	//seg. A:abc+ABC
	and (abc,a,b,c);
	and (ABC,A,B,C);
	or (sa,abc,ABC);
	
	//seg. B:1
	buf (sb,1'b1);
	
	//seg. C: 1
	buf (sc,1'b1);
	
	//seg D:
	or (sd,abc,ABC);
	
	//seg E:
	or (se,abc,ABC);
	
	//seg F:
	or (sf,abc,ABC);
	
	//seg G:
	or (sg,abc,ABC);
	
endmodule
