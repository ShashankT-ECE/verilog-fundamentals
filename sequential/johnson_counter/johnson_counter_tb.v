module johnson_counter_tb;
reg clk,rst;
wire [3:0]q;

johnson_counter dut(.clk(clk),.rst(rst),.q(q));

always #5 clk=~clk;

initial begin
    clk=0;rst=0;
    $dumpfile("johnson_counter.vcd");
    $dumpvars(0,johnson_counter_tb);
    $monitor("rst=%b,clk=%b,q=%b",rst,clk,q);

    rst=1;#10;
    rst=0;#50;
    #20;
    $finish;
end
endmodule