module ripple_carry_adder_tb;
reg [3:0]a,b;
reg cin;
wire [3:0]sum;
wire cout;

ripple_carry_adder uut(
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

initial begin
    a=0;b=0;;cin=0;

    $dumpfile("ripple_carry_adder.vcd");
    $dumpvars(0,ripple_carry_adder_tb);

    $monitor("a=%d,b=%d,cin=%d,sum=%d,cout=%d",a,b,cin,sum,cout);

    a=3;b=2;cin=0;#10;
    a=5;b=3;cin=1;#10;
    a=0;b=5;cin=1;#10;

    a=15;b=15;cin=0;#10;
    a = 15; b = 1;  cin = 0; #10;   // 16
    a = 15; b = 1;  cin = 1; #10;   // 17
    a = 8;  b = 8;  cin = 0; #10;   // 16
    a = 7;  b = 9;  cin = 0; #10;   // 16
    a = 15; b = 15; cin = 1; #10;   // 31
        



    #20;
    $finish;



    
end


endmodule