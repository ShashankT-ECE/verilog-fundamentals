module fa_ha(
    input a,b,c,
    output sum,carry
    );
    wire s1,c1,c2;

    half_adder u1(.a(a),.b(b),.sum(s1),.carry(c1));
    half_adder u2(.a(s1),.b(c),.sum(sum),.carry(c2));

    or(carry,c1,c2);
    endmodule


