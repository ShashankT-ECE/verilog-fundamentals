module comparator_parameter #(parameter n=5) (
    input [n-1:0]a,b,
    output greater,lesser,equal
);

assign greater = (a>b);
assign lesser = (a<b);
assign equal = (a==b);

endmodule