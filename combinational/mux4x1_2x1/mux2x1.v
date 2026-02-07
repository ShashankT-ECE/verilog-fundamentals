module mux2x1(
    input i0,i1,s0,
    output y
);

assign y = (~s0&i0) | (s0&i1);

endmodule
