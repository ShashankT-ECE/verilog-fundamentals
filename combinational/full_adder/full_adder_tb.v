module full_adder_tb;
    reg a,b,c;
    wire sum,carry;
    integer i;

    full_adder dut(a,b,c,sum,carry);

    initial begin
        for(i=0;i<8;i=i+1)begin
            {a,b,c}=i;
            #1;

            $display("a=%b,b=%b,c=%b,sum=%b,carry=%b",a,b,c,sum,carry);
        end


    end
    endmodule
