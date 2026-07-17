 module dff_tb;
reg clk,rst,d;
wire q;

dff dut(.clk(clk),.rst(rst),.d(d),.q(q));

always #10 clk = ~clk;

initial begin
    clk=0;d=0;

    $dumpfile("dff.vcd");
    $dumpvars(0,dff_tb);

    $monitor("rst=%b,clk=%b,d=%b,q=%b",rst,clk,d,q);

    rst=1; #10;
    rst=0;
    d=1; #5;
    d=0; #5;

    #20;
    $finish;
end
endmodule 

