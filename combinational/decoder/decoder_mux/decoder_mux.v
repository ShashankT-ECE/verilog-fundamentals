module decoder_mux(
    input a,b,
    output [3:0]y
);
// 2-to-4 decoder implemented using four 2:1 multiplexers

mux_2x1 m0(.i({1'b0,~b}),.sel(a),.y(y[0]));

mux_2x1 m1(.i({1'b0,b}),.sel(a),.y(y[1]));

mux_2x1 m2(.i({~b,1'b0}),.sel(a),.y(y[2]));

mux_2x1 m3(.i({b,1'b0}),.sel(a),.y(y[3]));

endmodule

