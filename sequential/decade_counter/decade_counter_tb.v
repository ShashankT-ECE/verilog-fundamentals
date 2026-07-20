module decade_counter_tb;
reg clk,rst;
wire [3:0]q;

decade_counter dut(.clk(clk),.rst(rst),.q(q));

always #5 clk =~clk;

initial begin
    clk=0;rst=0;
    $dumpfile("decade_counter.vcd");
    $dumpvars(0,decade_counter_tb);
    $monitor("rst=%b,clk=%b,q=%b",rst,clk,q);

    rst=1;#10;
    rst=0;#80;
    #20;
    $finish;
end
endmodule