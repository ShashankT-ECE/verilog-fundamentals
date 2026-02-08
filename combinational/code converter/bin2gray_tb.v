module bin2gray_tb;
    reg [2:0]binary;
    wire [2:0]gray;
    integer i;

    bin2gray dut(binary,gray);

    initial begin
        $monitor("binary=%b,gray=%b",binary,gray);
        for(i=0;i<16;i=i+1)begin
            binary=i;#1;
        end
    end
    endmodule
