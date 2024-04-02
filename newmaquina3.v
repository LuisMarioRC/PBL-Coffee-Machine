module newmaquina3(A,B,C,clk,EF,EG,EH,atv);
	input A,B,C,clk,atv;
	output EF,EG,EH;


	not (a,A);
	not (b,B);
	not (c,C);
	not (d,D);
	not (e,E);
	not (f,F);
	
	wire D,E,F,a,b,c,d,e,f;
	
	
	//ATUALIZAÇÂO DO CLK
	wire comb,atual;
	
	or (comb,atv,EF,EG,EH);
	
	and (atual,comb,clk);
	
	
	//expressão do ffD1: def+DeF+DEf+ADF
	wire f1,def,DeF,DEf,ADF;
	
	and (def,d,e,f);
	and (DeF,D,e,F);
	and (DEf,D,E,f);
	and (ADF,A,D,F);
	
	or (f1,def,DeF,DEf,ADF);
	
	//expressão do ffD2: DEf+BDeF+ADE
	wire f2,BDeF,ADE;
	
	and (BDeF,B,D,e,F);
	and (ADE,A,D,E);
	
	or (f2,DEf,BDeF,ADE);
	
	//ffD3:  def+bDeF+ACDE+ADEF
	wire f3,bDeF,ACDE,ADEF;
	
	and (bDeF,b,D,e,F);
	and (ACDE,A,C,D,E);
	and (ADEF,A,D,E,F);
	
	or (f3,bDeF,ACDE,ADEF,def);
	
	//ffs:
	flipflopD(atual,f1,D);
	flipflopD(atual,f2,E);
	flipflopD(atual,f3,F);
	
	
	//saída de estados:

	and (EF,D,e,F);
	and (EG,D,E,f);
	and (EH,D,E,F);

	
	
endmodule 