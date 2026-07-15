module mux_16x1_4x1_tb;
reg [15:0]i;
reg [3:0]sel;
wire y;
integer j;

mux_16x1_4x1 dut(.i(i),.sel(sel),.y(y));

initial begin
    i=16'b1010_0101_1000_0011;sel = 4'b0000;

     $dumpfile("mux_16x1_4x1.vcd");
     $dumpvars(0,mux_16x1_4x1_tb);
     $monitor("i=%b,sel=%b,y=%b",i,sel,y);

     for(j=0;j<16;j=j+1)begin
        sel=j;#10;
     end
     #20;
     $finish;
end
endmodule