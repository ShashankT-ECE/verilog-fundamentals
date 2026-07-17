module dff_latch(
    input clk,d,
    output q,qbar
);
wire nclk; // nclk = ~clk
wire a; // to connect output of first latch to input of 2nd latch
wire unused;
not(nclk,clk);


d_latch u0(.d(d),.en(nclk),.q(a),.qbar(unused));

d_latch u1(.d(a),.en(clk),.q(q),.qbar(qbar));

endmodule