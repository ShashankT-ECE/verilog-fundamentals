module swapping_blocking_tb;
reg [3:0]a,b;
wire [3:0]a_out,b_out;

swapping_blocking dut(.a(a),.b(b),.a_out(a_out),.b_out(b_out));

initial begin
    a=4'b0000;b=4'b0000;

    $dumpfile("swapping_blocking.vcd");
    $dumpvars(0,swapping_blocking_tb);

    $monitor("a=%b,b=%b,a_out=%b,b_out=%b",a,b,a_out,b_out);

    a=4'b0010;b=4'b1011;#10;
    a=4'b0001;b=4'b1110;#10;
end
endmodule
