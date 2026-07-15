module mux_4x1_tb;
reg [3:0]i;
reg [1:0]sel;
wire y;
integer j;

mux_4x1 dut(
    .i(i),
    .sel(sel),
    .y(y)
);

initial begin
    i=4'b0000;sel=2'b00;

    $dumpfile("mux_4x1.vcd");
    $dumpvars(0,mux_4x1_tb);

    $monitor("i=%b,sel=%b,y=%b",i,sel,y);


    for(j=0;j<64;j=j+1)begin
        {sel,i} = j;#10;
        
    end
    #20;
    $finish;



    
end
endmodule