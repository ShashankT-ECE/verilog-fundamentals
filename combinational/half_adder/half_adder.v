module half_adder(
    input a,
    input b,
    output cout,
    output sum
);

assign cout = a & b;
assign sum = a ^ b;
endmodule
