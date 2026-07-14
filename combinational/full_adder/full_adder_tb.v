module full_adder_tb;
reg a,b,cin;
wire sum,carry;
integer i;

full_adder uut(.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));

initial begin
    $dumpfile("full_adder.vcd");
    $dumpvars(0,full_adder_tb);

    a=0;b=0;cin=0;
    $monitor("a=%b,b=%b,cin=%b,sum=%b,carry=%b",a,b,cin,sum,carry);

    for(i=0;i<8;i=i+1)begin
        {a,b,cin} = i; #10;

    end
    

    $finish;


end

endmodule