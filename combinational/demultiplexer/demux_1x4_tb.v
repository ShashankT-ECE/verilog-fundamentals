module demux_1x4_tb;
reg d;
reg [1:0]sel;
wire [3:0]y;
integer i;

demux_1x4 dut(.d(d),.sel(sel),.y(y));

initial begin
    d=1;
    $dumpfile("demux_1x4.vcd");
    $dumpvars(0,demux_1x4_tb);

    $monitor("d=%b,sel=%b,y=%b",d,sel,y);

    for(i=0;i<4;i=i+1)begin
        sel = i; #10;
    

    end
    
    #20;
    $finish;

end
endmodule