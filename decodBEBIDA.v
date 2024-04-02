module decodBEBIDA(clk,B,C,D,E,F,sa,sb,sc,sd,se,sf,sg,Y,d1,d2);
	input clk,B,C,D,E,F,Y;
	output sa,sb,sc,sd,se,sf,sg,d1,d2;
	
	//Decodificador para exibir a bebida escolhida.
	not (b,B);
	not (c,C);
	not (d,D);
	not (e,E);
	not (f,F);
	
	wire expresso, leite, camomila, capuccino;
	
	and(expresso, e, f,B,Y);
	and(camomila, e, F,B,Y);
	and(leite, E, f,B,Y);
	and(capuccino, E, F,B,Y);
	
	or(sa, leite);
	or(sb, expresso, leite, camomila);
	or(sc, expresso, leite, camomila);
	or(sd, capuccino);
	or(se,0);
	or(sf,0);
	or(sg, leite, camomila);
	

endmodule 