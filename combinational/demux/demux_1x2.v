module demux_1x2(
    input i,
    input s,
    output y0,
    output y1
);

assign y0 = (~s&i);
assign y1 = (s&i);

endmodule

