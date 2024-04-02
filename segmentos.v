module segmentos(segmentosespera, segmentoserrosensor, segmentosbebida, segmentoserrobebida, A, B, C, E, sa, sb, sc, sd, se, sf, sg);
	
	input [6:0] segmentosespera, segmentoserrosensor, segmentosbebida, segmentoserrobebida;
	input  A, B, C, E;
	
	output sa, sb, sc, sd, se, sf, sg;
	
	wire s0, s1;
	
	wire and1, and2, and3;
	

	
	or(s0, C, E);
	
//multiplexador para selecionar a passagem do display do 7 segmentos
	
	or(s1, B, E);
	
	mux4_1(segmentosespera[0], segmentoserrosensor[0], segmentosbebida[0], segmentoserrobebida[0], s0,  s1, sa);
	mux4_1(segmentosespera[1], segmentoserrosensor[1], segmentosbebida[1], segmentoserrobebida[1], s0,  s1, sb);
	mux4_1(segmentosespera[2], segmentoserrosensor[2], segmentosbebida[2], segmentoserrobebida[2], s0,  s1, sc);
	mux4_1(segmentosespera[3], segmentoserrosensor[3], segmentosbebida[3], segmentoserrobebida[3], s0,  s1, sd);
	mux4_1(segmentosespera[4], segmentoserrosensor[4], segmentosbebida[4], segmentoserrobebida[4], s0,  s1, se);
	mux4_1(segmentosespera[5], segmentoserrosensor[5], segmentosbebida[5], segmentoserrobebida[5], s0,  s1, sf);
	mux4_1(segmentosespera[6], segmentoserrosensor[6], segmentosbebida[6], segmentoserrobebida[6], s0,  s1, sg);
	
endmodule