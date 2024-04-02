module decodbebida1(A,B,C,D,E,sa,sb,sc,sd,se,sf,sg);
	input A,B,C,D,E;
	output sa,sb,sc,sd,se,sf,sg;
	
	//DECODIFICADOR DO DIGITO 4 DO CPLD PARA EXIBIR A ESCOLHA DE BEBIDA
	not (a,A);
	not (b,B);
	not (c,C);
	not (d,D);
	not (e,E);
	
	wire a,b,c,d,e,Abcde,AbCdE,ABcDe,ABCDE;
	
	//seg. A: abcdE
	and (sa,a,b,c,d,E);
	
	//seg. B: Abcde+ AbCdE
	and (Abcde,A,b,c,d,e);
	and (AbCdE,A,b,C,d,E);
	or (sb,Abcde,AbCdE);
	
	//seg. C: Abcde+AbCdE+ABcDe
	and (ABcDe,A,B,c,D,e);
	or (sc,Abcde,AbCdE,ABcDe);
	
	//seg. D: ABcDe
	and (sd,A,B,c,D,e);
	
	//seg. E:
	buf (se,0);
	
	//seg. F:
	buf (sf,0);
	
	//seg G:AbCdE+ABcDe+ABCDE
	and (ABCDE,A,B,C,D,E);
	or (sg,AbCdE,ABcDe,ABCDE);
	
endmodule 