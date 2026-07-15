module decoder_3x8_tb;
reg a,b,c;
wire [7:0]y;
integer i;

decoder_3x8 dut(
    .a(a),
    .b(b),
    .c(c),
    .y(y)
);

initial begin
    {a,b,c} = 3'b000;
    $monitor("a=%b,b=%b,c=%b,y=%b",a,b,c,y);

    $dumpfile("decoder_3x8.vcd");
    $dumpvars(0,decoder_3x8_tb);

    for(i=0;i<8;i=i+1) begin {a,b,c} = i; #10; end

    #20;
    $finish;


end
endmodule