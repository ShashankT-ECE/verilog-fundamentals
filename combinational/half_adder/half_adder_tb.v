module half_adder_tb;
reg a,b;
wire sum,cout;
integer i; //loop variable

half_adder uut(.a(a),.b(b),.cout(cout),.sum(sum));

initial begin
    $dumpfile("half_adder.vcd");
    $dumpvars(0,half_adder_tb);

    a=0;b=0;

    $monitor("a=%0b,b=%0b,cout=%0b,sum=%0b",a,b,cout,sum);

    for(i=0;i<4;i=i+1)begin
        {a,b} = i; #10;
    end

    $finish;



end

endmodule
