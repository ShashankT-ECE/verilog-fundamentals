module dff_latch_tb;
reg d,clk;
wire q,qbar;

dff_latch dut(.d(d),.clk(clk),.q(q),.qbar(qbar));

always #5 clk = ~clk;

initial begin
    clk=0;d=0;

    $dumpfile("dff_latch.vcd");
    $dumpvars(0,dff_latch_tb);

    $monitor("clk=%b,d=%b,q=%b,qbar=%b",clk,d,q,qbar);

    d=1;#7;
    d=0;#10;
    d=0;#4;
    #10;
    $finish;
end
endmodule