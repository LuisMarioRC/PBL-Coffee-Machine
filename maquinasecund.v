module maquinasecund(clk, sensor, ENTER, ERRO, BEBIDAS, QA, QB, QC);
	input clk, ENTER, ERRO, sensor;
	output BEBIDAS, QA, QB, QC;
	
	
	wire qa, qb, qc, DA, DB, DC, erro,ss;
	
	not (ss,sensor);
	
	not(qa, QA);
	not(qb, QB);
	not(qc, QC);
	not(erro, ERRO);
	not(enter, ENTER);
	
	wire da1, da2;
	
	and(da1, ERRO, qa, QB, QC);
	and(da2, ERRO, QA, qb, qc);
	
	or(DA, da1, da2);
	
	wire db1, db2, db3, db5;
	and(db1, qa, QB, qc);
	and(db2, erro, qa, QB, QC);
	and(db3, erro, QA, qb, qc);
	and(db5, sensor, qa, qb, qc);
	
	or(DB, db1, db2, db3, db5);
	
	and(DC, ENTER, qa, QB, qc);
	
	flipflopD(clk,DA,QA,ss);	
	flipflopD(clk,DB,QB,ss);
	flipflopD(clk,DC,QC,ss);
	

	and(BEBIDAS, erro, qa, QB, QC, sensor);
	
	
endmodule 


	
	/*
	
	ESTADOS: C = 010
				  D = 011
				  E = 110
	
	
	input A,B,C,D,E,F,clk;
	output y1, y2 ;
	
	wire P,Q,R,a,b,c,d,e,f,p,q,r,f1,f2,f3;
	
	not (a,A);
	not (b,B);
	not (c,C);
	not (d,D);
	not (e,E);
	not (f,F);
	not (p,P);
	not (q,Q);
	not (r,R);
	
	//expre. flip flop 1: dFpQR+BdFPqr+cEpQR+BcEPqr+DfpQR+BDfPqr+CepQR+BCePqr+ABpQR+bFpQR+bDpQR+bEpQR
	wire dFpQR,BdFPqr,cEpQR,BcEPqr,DfpQR,BDfPqr,CepQR,BCePqr,ABpQR,bFpQR,bDpQR,bEpQR;
	
	
	and (dFpQR,d,F,p,Q,R);
	and (BdFPqr,B,d,F,P,q,r);
	and (cEpQR,c,E,p,Q,R);
	and (BcEPqr,B,c,E,P,q,r);
	and (DfpQR,D,f,p,Q,R);
	and (BDfPqr,B,D,f,P,q,r);
	and (CepQR,C,e,p,Q,R);
	and (BCePqr,B,C,e,P,q,r);
	and (ABpQR,A,B,p,Q,R);
	and (bFpQR,b,F,p,Q,R);
	and (bDpQR,b,D,p,Q,R);
	and (bEpQR,b,E,p,Q,R);
	
	or (f1,dFpQR,BdFPqr,cEpQR,BcEPqr,DfpQR,BDfPqr,CepQR,BCePqr,ABpQR,bFpQR,bDpQR,bEpQR);
	
	
	//expre. flip flop 2: bePqr+bfPqr+bcdeFPqR+bDPqr+bCPqr+aBcdefpQ+BpQR+aBcDeFpQ+aBCdEfpQ+aBCDEFpQ
	wire bePqr,bfPqr,bcdeFPqR,bDPqr,bCPqr,aBcdefpQ,BpQR,aBcDeFpQ,aBCdEfpQ,aBCDEFpQ;
	
	and (bePqr, b,e,P,q,r);
	and (bfPqr, b,f,P,q,r);
	and (bcdeFPqR, b,c,d,e,F,P,q,R);
	and (bDPqr, b,D,P,q,r);
	and (bCPqr, b,C,P,q,r);
	and (aBcdefpQ,a,B,c,d,e,f,p,Q);
	and (BpQR,B,p,Q,R);
	and (aBcDeFpQ,a,B,c,D,e,F,p,Q);
	and (aBCdEfpQ,a,B,C,d,E,f,p,Q);
	and (aBCDEFpQ,a,B,C,D,E,F,p,Q);
	or (f2,bePqr,bfPqr,bcdeFPqR,bDPqr,bCPqr,aBcdefpQ,BpQR,aBcDeFpQ,aBCdEfpQ,aBCDEFpQ);
	
	
	//expre. flip flop 3: BcdefpQ+BpQr+BcDeFpQ+ABCdfpQ+ABCDEFpQ
	wire BcdefpQ,BpQr,BcDeFpQ,ABCdfpQ,ABCDEFpQ;
	
	and (BcdefpQ,B,c,d,e,f,p,Q);
	and (BpQr,B,p,Q,r);
	and (BcDeFpQ,B,c,D,e,F,p,Q);
	and (ABCdfpQ,A,B,C,d,f,p,Q);
	and (ABCDEFpQ,A,B,C,D,E,F,p,Q);
	
	or (f3,BcdefpQ,BpQr,BcDeFpQ,ABCdfpQ,ABCDEFpQ);
	
	//entrada dos ffs :
	flipflopD ff1(clk,f1,P);
	flipflopD ff2(clk,f2,Q);
	flipflopD ff3(clk,f3,R);
	
	
	//saida de erro de valor: BdFPqr+BcEPqr+BDfPqr+BCePqr
	
	or(y1,BdFPqr,BcEPqr,BDfPqr,BCePqr);
	
	// saida da bebida escolhida : ABcdefpQR+ABcDeFpQR+ABCdEfpQR+ABCDEFpQR
	
	wire ABcdefpQR,ABcDeFpQR,ABCdEfpQR,ABCDEFpQR;
	and (ABcdefpQR,A,B,c,d,e,f,p,Q,R);
	and (ABcDeFpQR,A,B,c,D,e,F,p,Q,R);
	and (ABCdEfpQR,A,B,C,d,E,f,p,Q,R);
	and (ABCDEFpQR,A,B,C,D,E,F,p,Q,R);
	
	or (y2,ABcdefpQR,ABcDeFpQR,ABCdEfpQR,ABCDEFpQR);
*/	

