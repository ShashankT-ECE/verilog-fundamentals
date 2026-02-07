module comparator_3bit(
    input [2:0]a,
    input [2:0]b,
    output greater,lesser,equal
);

assign greater = (a>b);
assign lesser = (a<b);
assign equal = (a==b);

endmodule
