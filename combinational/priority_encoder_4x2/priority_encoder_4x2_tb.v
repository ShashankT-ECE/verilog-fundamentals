module priority_encoder_4x2_tb;
    reg [3:0]d;
    wire [1:0]y;
    wire v;

    priority_encoder_4x2 dut(d,y,v);

    initial begin
        $monitor("d=%b,y=%b,v=%b",d,y,v);
        repeat(10)begin
            d = $random;
            #1;
        end
    end
    endmodule
