module comparator_3bit_tb;
    reg [2:0]a;
    reg [2:0]b;
    wire greater,lesser,equal;
    integer seed;

    comparator_3bit dut(a,b,greater,lesser,equal);

    initial begin
        seed=42;
        $monitor("a=%b,b=%b,greater=%b,lesser=%b,equal=%b",a,b,greater,lesser,equal);
        repeat(10)begin
            {a,b} = $random(seed);#1;
        end
    end
    endmodule
