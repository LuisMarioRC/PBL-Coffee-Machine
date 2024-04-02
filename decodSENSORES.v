module decodSENSORES(B,C,D,E,sa,sb,sc,sd,se,sf,sg,d1,d2,clk);
	input B,C,D,E,clk;
	output sa,sb,sc,sd,se,sf,sg,d1,d2;
	
	wire A;
	
	
	//Flip flop que seleciona a passagem da letra correta.
	flipflopT(clk, 1, A);
	demux1x2(E,A,d1,d2);

	//Decodificador para erros de bebidas com entrada de FF-T. A > saído do FF-T.
	not (a,A);
	not (b,B);
	not (c,C);
	not (d,D);
	
	
	wire a,b,c,d,BCD,bcd,BC,cd,ab,ac,aBC;
	
	//segmento A: abcd+BCD
	and (bcd,b,c,d,E);
	and (BCD,B,C,D,E);
	or (sa,bcd,BCD);
	
	//seg B: bcd+BC+A
	and (BC,B,C,E);
	or (sb,bcd,BC,AE);
	
	//seg C: cd+B+A
	and (cd,c,d,E);
	wire BE,AE;
	and (BE,B,E);
	and (AE,A,E);
	or (sc,cd,BE,AE);
	
	//seg D: ab+ac+bcd+BCD
	and (ab,a,b,E);
	and (ac,a,c,E);
	or (sd,ab,ac,bcd,BCD);
	
	//seg E: bcd+BCD
	or (se,bcd,BCD);
	
	//seg F: bcd+BCD
	or (sf,bcd,BCD);
	
	//seg G: bcd+aBC+BCD
	and (aBC,a,B,C,E);
	or (sg,bcd,aBC,BCD);
	
	
endmodule 
	

