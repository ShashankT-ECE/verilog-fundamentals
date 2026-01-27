module mux_8x1_tb;
    reg [7:0]i;
    reg [2:0]s;
    wire y;
    
    mux_8x1 dut(i,s,y);

    initial begin
        repeat(10)begin
            {i,s} = $random;
            #1;
            $display("i=%b,s=%b,y=%b",i,s,y);
        end
    end
    endmodule

