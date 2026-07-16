module encoder_8x3_tb;
reg [7:0]d;
wire [2:0]y;
integer i;

encoder_8x3 dut(.d(d),.y(y));

initial begin
    d=8'b0000_0000;
    $dumpfile("encoder_8x3.vcd");
    $dumpvars(0,encoder_8x3_tb);

    $monitor("d=%b,out=%b",d,y);

    for(i=0;i<8;i=i+1)begin
        d = 8'b0000_0001 << i; #10; 
    end
    #20;
    $finish;


end
endmodule



/*
for(i=0;i<8;i=i+1)
 d[i] = 1'b1;  */