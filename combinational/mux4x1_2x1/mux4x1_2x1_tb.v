module mux4x1_2x1_tb;
    reg [3:0]i;
    reg [1:0]s;
    wire y;

    mux4x1_2x1 dut(i,s,y);

    initial begin
        $monitor("i=%b,s=%b,y=%b",i,s,y);
        repeat(10)begin
            {i,s}=$random;#1;
        end
    end
    endmodule

