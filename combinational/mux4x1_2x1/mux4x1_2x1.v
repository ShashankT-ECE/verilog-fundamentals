module mux4x1_2x1(
    input [3:0]i,
    input [1:0]s,
    output y
);
wire y1,y2;

mux2x1 u1(.i0(i[0]),.i1(i[1]),.s0(s[0]),.y(y1));
mux2x1 u2(.i0(i[2]),.i1(i[3]),.s0(s[0]),.y(y2));
mux2x1 u3(.i0(y1),.i1(y2),.s0(s[1]),.y(y));


endmodule
