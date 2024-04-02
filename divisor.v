module divisor(clk,q18,q28,q29, clear);
	input clk,clear;
	output q18,q28, q29;
	
	wire q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q13,q14,q15,q16,q17,q18,vcc;
	// +-30 flipflops ultilizado para o divisor de frequencia
	// Aproximadamente 6hz.
	
	buf (vcc,1'b1);
	
	flipflopT fl1(clk,vcc,q1,clear);
	flipflopT fl2(q1,vcc,q2,clear);
	flipflopT fl3(q2,vcc,q3,clear);
	flipflopT fl4(q3,vcc,q4,clear);
	flipflopT fl5(q4,vcc,q5,clear);
	flipflopT fl6(q5,vcc,q6,clear);
	flipflopT fl7(q6,vcc,q7,clear);
	flipflopT fl8(q7,vcc,q8,clear);
	flipflopT fl9(q8,vcc,q9,clear);
	flipflopT fl10(q9,vcc,q10,clear);
	flipflopT fl11(q10,vcc,q11,clear);
	flipflopT fl13(q11,vcc,q13,clear);
	flipflopT fl14(q13,vcc,q14,clear);
	flipflopT fl15(q14,vcc,q15,clear);
	flipflopT fl16(q15,vcc,q16,clear);
	flipflopT fl17(q16,vcc,q17,clear);
	flipflopT fl18(q17,vcc,q18,clear);
	
	wire q19,q20,q21,q22,q23,q24,q25, q26, q27;
	
	flipflopT (q18,vcc,q19,clear);
	flipflopT (q19,vcc,q20,clear);
	flipflopT (q20,vcc,q21,clear);
	flipflopT (q21,vcc,q22,clear);
	flipflopT (q22,vcc,q23,clear);
	flipflopT (q23,vcc,q24,clear);
	flipflopT (q24,vcc,q25,clear);
	flipflopT (q25,vcc,q26,clear);
	flipflopT (q26,vcc, q27, clear);
	flipflopT (q27,vcc, q28, clear);
	flipflopT (q28,vcc, q29, clear);
	

endmodule 