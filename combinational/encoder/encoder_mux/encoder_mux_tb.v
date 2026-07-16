module encoder_mux_tb;
reg [3:0]d;
wire [1:0]y;
integer i;

encoder_mux dut(.d(d),.y(y));

initial begin
    d=4'b000;

    $dumpfile("encoder_mux.vcd");
    $dumpvars(0,encoder_mux_tb);

    $monitor("d=%b,y=%b",d,y);

    for(i=0;i<4;i=i+1)begin
        d = 4'b0001 <<i; #10;
    end
    #20;
    $finish;
end
endmodule

