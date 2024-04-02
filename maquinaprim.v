module maquinaprim(EF,EG,EH,A,B,C,sensor,clk,y1,y2,EA,EB,EES);
	input EF,EG,EH,A,B,C,clk;
	output y1,y2,sensor,EA,EB,EES;
	
	not (a,A);
	not (b,B);
	not (c,C);
	not (d,D);
	not (e,E);
	not (f,F);
	
	//Combinaçao para parar a maquina
	not (ss,sensor);
	not (ef,EF);
	not (eg,EG);
	not (eh,EH);
	wire M3;
	or (M3,EF,EG,EH);
	wire ss,comb,ef,eg,eh,comb1,opcoes,atual;
	
	and (comb1,c,EH); // se tiver na maquina 3 e no estado H, volta a funcionar quando tirar o sensor do copo
	and (comb,ss,ef,eg,eh);
	or (opcoes,comb,comb1); //opcoes para essa maquina funcionar
	and (atual,opcoes,clk);
	//teste acima
	
	wire D,E,F,a,b,c,d,e,f;
	
	
	wire f1,f2,ABC,def,oABC,x1,deF,funcao,funcao1;
	
	//ff 1 = ABC.def
	wire and1;
	and (ABC,A,B,C);
	and (def,d,e,f);
	and (f1,ABC,def);
	and (EB,x1,!M3); //desligando a saída do estado diretamnete.

	
	//ff 2 = (((ABC)^(A+B+C)).def) + (((ABC)^(A+B+C)).deF )
	or (oABC,A,B,C);
	and (deF,d,e,F);
	xor (x1,ABC,oABC);
	and (funcao,x1,def);
	and (funcao1,x1,deF);
	or (f2,funcao,funcao1);
	
	//entrada do ff D
	flipflopD(atual,0,D);
	flipflopD(atual,f1,E);
	flipflopD(atual,f2,F);
	
	//and (EA,d,e,f);
	and (EA,a,b,c);
	//and (EB,d,e,F);
	and (EES,d,E,f);
	
	
	//SAÍDAS ERROS SENSORES= aCde+Bcde+Abde
	wire aCde,Bcde,Abde;
	and (aCde,a,C,d,e);
	and (Bcde,B,c,d,e);
	and (Abde,A,b,d,e);
	or (y1,aCde,Bcde,Abde);
	
	
	//SAÍDA DE ESPERA abcde
	
	and (y2,a,b,c,d,e);

	and (sensor,A,B,C);
	
endmodule 
	