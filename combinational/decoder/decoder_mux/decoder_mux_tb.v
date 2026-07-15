module decoder_mux_tb;
reg a,b;
wire [3:0]y;
integer j;

decoder_mux dut(.a(a),.b(b),.y(y));

initial begin
    a=0;b=0;
    $monitor("a=%b,b=%b,y=%b",a,b,y);

    $dumpfile("decoder_mux.vcd");
    $dumpvars(0,decoder_mux_tb);

    for(j=0;j<4;j=j+1)begin
        {a,b} = j; #10;
    end

    #20;
    $finish;



end
endmodule