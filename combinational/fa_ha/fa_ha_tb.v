module fa_ha_tb;
    reg a,b,c;
    wire sum,carry;

    fa_ha dut(a,b,c,sum,carry);

    initial begin
        repeat(10)begin
            {a,b,c}=$random;#1;
            $display("a=%b,b=%b,c=%b,sum=%b,carry=%b",a,b,c,sum,carry);
        end
    end
    endmodule
