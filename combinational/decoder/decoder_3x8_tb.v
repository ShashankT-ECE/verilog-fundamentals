module decoder_3x8_tb;
    reg [2:0]a;
    wire [7:0]y;

    decoder_3x8 dut(a,y);

    initial begin
        $monitor("a=%b,y=%b",a,y);
        repeat(10)begin
            a=$random;#1;
        end

    end
    endmodule
