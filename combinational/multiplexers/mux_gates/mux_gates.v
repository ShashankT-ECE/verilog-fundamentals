module mux_gates(
    input a,b,
    output and_r,or_r,nand_r,nor_r,xor_r,xnor_r
);

mux_2x1 m0(.i({b,1'b0}),.sel(a),.y(and_r));
mux_2x1 m1(.i({1'b1,b}),.sel(a),.y(or_r));
mux_2x1 m2(.i({~b,1'b1}),.sel(a),.y(nand_r));
mux_2x1 m3(.i({1'b0,~b}),.sel(a),.y(nor_r));
mux_2x1 m4(.i({~b,b}),.sel(a),.y(xor_r));
mux_2x1 m5(.i({b,~b}),.sel(a),.y(xnor_r));

endmodule