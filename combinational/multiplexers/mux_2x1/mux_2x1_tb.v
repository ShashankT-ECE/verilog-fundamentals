module mux_2x1_tb;
reg [1:0]i;
reg sel;
wire y;

integer j; //Loop Variable

mux_2x1 dut(
    .i(i),
    .sel(sel),
    .y(y)
);

initial begin
    i=2'b00;sel=0;

    $dumpfile("mux_2x1.vcd");
    $dumpvars(0,mux_2x1_tb);

    $monitor("i=%b,sel=%b,y=%b",i,sel,y);

    for(j=0;j<8;j=j+1)begin
        {sel,i} = j; #10;

        
    end

    #20;
    $finish;


    
end

endmodule