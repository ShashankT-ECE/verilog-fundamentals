module ripple_counter_tb;
reg clk,rst;
wire [3:0]q;

ripple_counter dut(.clk(clk),.rst(rst),.q(q));

always #5clk = ~clk;

initial begin
    clk=0; rst=0;

    $dumpfile("ripple_counter.vcd");
    $dumpvars(0,ripple_counter_tb);

    $monitor("clk=%b,rst=%b,q=%d",clk,rst,q);

    rst=1;#10;
    rst=0;

    #145;
    $finish;

end
endmodule