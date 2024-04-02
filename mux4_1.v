module mux4_1(a, b, c, d, s0, s1, out);
	input a, b, c, d, s0, s1;
	output out;
	//multiplexador para selecionar qual a saida ira exibir no display
	wire asel, bsel, csel, dsel;
	
	and (asel, a, ~s0, ~s1);
	and (bsel, b, ~s0, s1);
	and (csel, c, s0, ~s1);
	and (dsel, d, s0, s1);

	or(out, asel, bsel, csel, dsel);
	
endmodule