module demux_1x4_1x2(
    input i,
    input [1:0]s,
    output [3:0]y
);
wire p,q;

demux_1x2 u1(.i(i),.s(s[1]),.y0(p),.y1(q));
demux_1x2 u2(.i(p),.s(s[0]),.y0(y[0]),.y1(y[1]));
demux_1x2 u3(.i(q),.s(s[0]),.y0(y[2]),.y1(y[3]));

endmodule



