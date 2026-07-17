module d_latch(
    input d,en,
    output q,qbar
);
wire a,b,dbar;

not(dbar,d);

nand n1(a,d,en);
nand n2(b,dbar,en);
nand n3(q,a,qbar);
nand n4(qbar,b,q);

endmodule
