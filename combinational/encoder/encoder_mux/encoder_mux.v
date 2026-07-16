module encoder_mux(
    input [3:0]d,
    output [1:0]y
);

mux_2x1 m0(.i({1'b1,d[3]}),.sel(d[2]),.y(y[0]));

mux_2x1 m1(.i({1'b1,d[3]}),.sel(d[1]),.y(y[1]));

endmodule