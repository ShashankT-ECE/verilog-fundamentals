module gray_counter_tb;
reg clk,rst;
wire [2:0]gray;

gray_counter dut(.clk(clk),.rst(rst),.gray(gray));

always #5 clk=~clk;

initial begin
    clk=0;rst=0;
    $dumpfile("gray_counter.vcd");
    $dumpvars(0,gray_counter_tb);
    $monitor("rst=%b,clk=%b,gray=%b",rst,clk,gray);

    rst=1; #10;
    rst=0; #50;

    #20;
    $finish;
end
endmodule