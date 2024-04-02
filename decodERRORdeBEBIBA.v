module decodERRORdeBEBIBA(Y,sa,sb,sc,sd,se,sf,sg,d1,d2,d4);
	input Y;
	output sa,sb,sc,sd,se,sf,sg,d1,d2,d4;
	
	wire y;
	not (y,Y);
	
	buf (d4,y);
	buf (d1,Y);
	buf (d2,Y);

	buf (sa,y);
	buf (sb,Y);
	buf (sc,Y);
	buf (sd,y);
	buf (se,y);
	buf (sf,y);
	buf (sg,y);

endmodule 