module full_adder_half_adder(
    input a,b,cin,
    output sum,carry
);
wire x,c1,c2;

half_adder u1(.a(a),.b(b),.sum(x),.cout(c1));

half_adder u2(.a(x),.b(cin),.sum(sum),.cout(c2));

or(carry,c1,c2);

endmodule


