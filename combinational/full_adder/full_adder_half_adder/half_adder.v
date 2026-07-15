module half_adder(
    input a,
    input b,
    output cout,
    output sum
);

assign cout = a & b;  //Dataflow
assign sum = a ^ b;
endmodule
