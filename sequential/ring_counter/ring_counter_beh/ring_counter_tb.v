module ring_counter_tb;
reg clk,rst;
wire [3:0]q;

ring_counter_beh dut(.clk(clk),.rst(rst),.q(q));
always #5 clk = ~clk;

initial begin
    clk=0;rst=0;

    $dumpfile("ring_counter.vcd");
    $dumpvars(0,ring_counter_tb);
    $monitor("rst=%b,clk=%b,q=%b",rst,clk,q);

    rst=1; #10;
    rst=0; #50;

    #20;
    $finish;



    
end
endmodule