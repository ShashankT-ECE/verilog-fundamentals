module demux_1x4_tb;
    reg i;
    reg [1:0]s;
    wire [3:0]y;

    demux_1x4 dut(i,s,y);

    initial begin
        $monitor("i=%b,s=%b,y=%b",i,s,y);
        repeat(10)begin
            {i,s}=$random;#1;
        end
    end
    endmodule
