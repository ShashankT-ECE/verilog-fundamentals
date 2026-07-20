module mod_n_counter_tb;
parameter N=26;
reg clk,rst;
wire [$clog2(N)-1:0]q;

mod_n_counter #(.N(N)) dut(.clk(clk),.rst(rst),.q(q));

always #5 clk=~clk;

initial begin
    clk=0;rst=0;
    $dumpfile("mod_n_counter.vcd");
    $dumpvars(0,mod_n_counter_tb);
    $monitor("rst=%b,clk=%b,q=%d",rst,clk,q);

    rst=1;#10;
    rst=0; #300;
    #20;
    $finish;
end
endmodule