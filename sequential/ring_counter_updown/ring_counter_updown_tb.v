module ring_counter_updown_tb;
reg clk,rst,control;
wire [3:0]q;

ring_counter_updown dut(.clk(clk),.rst(rst),.control(control),.q(q));

always #5 clk = ~clk;

initial begin
    clk=0;rst=0;control=0;
    $dumpfile("ring_counter_updown.vcd");
    $dumpvars(0,ring_counter_updown_tb);
    $monitor("rst=%b,clk=%b,control=%b,q=%b",rst,clk,control,q);

    rst=1;#10;
    rst=0; control=1;#75;
    rst=1;#10;
    rst=0;control=0;#75;

    #20;
    $finish;
end
endmodule