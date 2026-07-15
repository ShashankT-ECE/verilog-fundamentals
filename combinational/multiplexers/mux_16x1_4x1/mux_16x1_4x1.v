module mux_16x1_4x1(
    input [15:0]i,
    input [3:0]sel,
    output y
);
wire a,b,c,d;

mux_4x1 m0(.i(i[3:0]),.sel(sel[1:0]),.y(a));

mux_4x1 m1(.i(i[7:4]),.sel(sel[1:0]),.y(b));

mux_4x1 m2(.i(i[11:8]),.sel(sel[1:0]),.y(c));

mux_4x1 m3(.i(i[15:12]),.sel(sel[1:0]),.y(d));

mux_4x1 m4(.i({d,c,b,a}),.sel(sel[3:2]),.y(y));

endmodule

















