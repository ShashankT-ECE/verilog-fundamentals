module dff_async_tb;
reg clk,d,rst;
wire q;

dff_async dut(.clk(clk),.rst(rst),.d(d),.q(q));

always #5 clk = ~clk;

initial begin
    clk=0;d=0;
    $dumpfile("dff_async.vcd");
    $dumpvars(0,dff_async_tb);

    $monitor("rst=%b,clk=%b,d=%b,q=%b",rst,clk,d,q);

    rst=1;#20;
    rst=0; 
    d=0; #4;
    d=1; #5;
    rst=7; #10;
    rst=0; d=1; #6;

    #20;
    $finish;


end
endmodule