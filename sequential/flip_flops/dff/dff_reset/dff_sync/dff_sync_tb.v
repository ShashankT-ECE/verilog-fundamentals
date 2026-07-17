module dff_sync_tb;
reg clk,rst,d;
wire q;

dff_sync dut(.clk(clk),.rst(rst),.d(d),.q(q));

always #5 clk = ~clk;

initial begin
    clk=0;d=0;rst=0;

    $dumpfile("dff_sync.vcd");
    $dumpvars(0,dff_sync_tb);

    $monitor("rst=%b,clk=%b,d=%b,q=%b",rst,clk,d,q);

    rst=0;#5;
    rst=1;#7;
    rst=0; d=1; #10;
    rst=1;#10;
    rst=0;d=1;#10;

    #20;
    $finish;

    
end
endmodule