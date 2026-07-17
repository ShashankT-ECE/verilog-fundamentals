module d_latch_tb;
reg d,en;
wire q,qbar;

d_latch dut(.d(d),.en(en),.q(q),.qbar(qbar));

initial begin
    en=0;d=0;
    $dumpfile("d_latch.vcd");
    $dumpvars(0,d_latch_tb);

    $monitor("en=%b,d=%b,q=%b,qbar=%b",en,d,q,qbar);


    en=0;d=0;#10;
    en=1;d=0;#10;
    d=1;#10;
    d=0; #4;
    d=1; #6;

end
endmodule 