module decodbebida2(sa,sb,sc,sd,se,sf,sg);
	output sa,sb,sc,sd,se,sf,sg;
	
	//DECODIFICADOR DO DIGITO 3 DO CPLD PARA EXIBIR A ESCOLHA DE BEBIDA
	
	buf (sa,0);
	buf (sb,0);
	buf (sc,1);
	buf (sd,1);
	buf (se,0);
	buf (sf,0);
	buf (sg,1);

endmodule 