module PBL4(
	input ch0,ch1,ch2,ch3,ch4,ch5,ch6,clk,BOTAO,
	output d1,d2,d3,d4,sa,sb,sc,sd,se,sf,sg,ponto,
	output [9:0] LED,
	output [2:0] rgb
);
	wire sensor;
	wire newbotao;
	//Leveltopulse para detectar a borda de subida do botao.
	leveltopulse(newclk, !BOTAO, newbotao);
	
	wire clear, pulsoF, pulsoG;
	//leveltopulse para detectar quando esta no estado de espera.
	leveltopulse(clk, EF, pulsoF);
	leveltopulse(clk, EG, pulsoG);
	
	or(clear, pulsoF, pulsoG);
	
	wire newclk, tempo1;
	
	// divisor para definir o tempo de pressurizaçao e aquecimento.
	divisor(clk,newclk,tempo, tempo1,clear);
	
	wire [6:0] segES,segBEBIDA,segBEESCO,esperaDECOD;
	
	
	buf (d3,1);

	// decod espera onde desliga todos os seguimentos e ativa o ponto.
	buf(esperaDECOD[0],1);
	buf(esperaDECOD[1],1);
	buf(esperaDECOD[2],1);
	buf(esperaDECOD[3],1);
	buf(esperaDECOD[4],1);
	buf(esperaDECOD[5],1);
	buf(esperaDECOD[6],1);
	
	//multiplezador para o display de 7 segmentos
	segmentos(esperaDECOD, segES, segBEESCO, segBEBIDA, EA, EB, EC, EE, sa, sb, sc, sd, se, sf, sg);
	
	wire d1sensor,d2sensor,d1es,d2es;
	or (d1,d1sensor,d1es,d1eb,d1be);
	or (d2,d2sensor,d2es,d2eb,d2be);
	
	//Chmando a primeiraira máquina e suas saídas:
	wire y1,y2;
	wire EA,EB;
	
	//Primeira maquina
	maquinaprim(EF,EG,EH,ch0,ch1,ch2,sensor,newclk,y1,y2,EA,EB);
	
	//saida da primeira maquina
	decodSENSORES(ch0,ch1,ch2,EB,segES[0],segES[1],segES[2],segES[3],segES[4],segES[5],segES[6],d2sensor,d1sensor,newclk);
	
	
	//segunda máquina e suas saídas:
	wire y3,y4,d1eb,d2eb;
	
	wire cafe1, cafe2, cfe3, cafe4, ERRO, BEBIDAS, QA, QB, QC;
	
	// possiveis combinaçao para a escolha certa da babida
	and(cafe1, ~ch6, ~ch5, ~ch4, ~ch3);
	and(cafe2, ~ch6, ch5, ~ch4, ch3);
	and(cafe3, ch6, ~ch5, ch4, ~ch3);
	and(cafe4, ch6, ch5, ch4, ch3);
	
	nor(ERRO, cafe1, cafe2, cafe3, cafe4);
	
	//maquinasecun(newbotao,sensor,ch3,ch4,ch5,ch6,newclk,y3,y4,y1,y2,EF,EG,EH);
	wire EC,EE;
	and (EC,!QA,QB,!QC);
	and (EE,QA,!QB,!QC);
	//segunda maquina
	maquinasecund(newclk, sensor, newbotao, ERRO, BEBIDAS, QA, QB, QC);
	
	//acionamento do led para informar a devoluçao de dinheiro
	and(rgb[2] , ERRO,sensor);
	//decod do erro de bebida 
	decodERRORdeBEBIBA(EE,segBEBIDA[0],segBEBIDA[1],segBEBIDA[2],segBEBIDA[3],segBEBIDA[4],segBEBIDA[5],segBEBIDA[6],d1eb,d2eb,d4);
	wire d1be,d2be;
	//decod da bebida escolhida
	decodBEBIDA(newclk,sensor,ch3,ch4,ch5,ch6,segBEESCO[0], segBEESCO[1],segBEESCO[2],segBEESCO[3],segBEESCO[4],segBEESCO[5],segBEESCO[6],EC,d2be,d1be);
	
	
	//Terceira máquina e suas saídas: 
	wire y5,y6,y7,EF,EG,EH;

	
	//maquinatres(ch2,tempo,newclk, y5,y6,y7,EF,EG,EH,BEBIDAS);
	newmaquina3(ch2,tempo,tempo1,newclk,EF,EG,EH,BEBIDAS);
	//led para pressurizaçao e aquecimento
	buf (rgb[1],EF);
	buf (rgb[0],EG);
	//BUFs da barra de led para informar a entrega
	buf (LED[0],EH);
	buf (LED[1],EH);
	buf (LED[2],EH);
	buf (LED[3],EH);
	buf (LED[4],EH);
	buf (LED[5],EH);
	buf (LED[6],EH);
	buf (LED[7],EH);
	buf (LED[8],EH);
	buf (LED[9],EH);

endmodule  