module swapping_non_blocking_tb;
reg [3:0]a,b;
reg clk;
wire [3:0]a_out,b_out;

swapping_non_blocking dut(.a(a),.b(b),.clk(clk),.a_out(a_out),.b_out(b_out));

always #5 clk = ~clk;

initial begin
    a=4'b0000;b=4'b0000; clk=0;
    $dumpfile("swapping_non_blocking.vcd");
    $dumpvars(0,swapping_non_blocking_tb);

    $monitor("a=%b,b=%b,a_out=%b,b_out=%b",a,b,a_out,b_out);

    a=4'b1001;b=4'b1011; #10;
    a=4'b0010;b=4'b0101; #10;

    #20;
    $finish;

end

endmodule