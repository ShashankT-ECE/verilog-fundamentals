module comparator_parameter_tb;
parameter n=12;
reg [n-1:0]a,b;
wire greater,lesser,equal;

comparator_parameter #(.n(9)) dut(.a(a),.b(b),.greater(greater),.lesser(lesser),.equal(equal));

initial begin
    a=0;b=0;

     $dumpfile("comparator_parameter.vcd");
     $dumpvars(0, comparator_parameter_tb);

     $monitor("a=%d b=%d gt=%b lt=%b eq=%b",
              a,b,greater,lesser,equal);

    a = 5;  b = 3;  #10;
    a = 2;  b = 9;  #10;
    a = 7;  b = 7;  #10;
    a = 321; b = 293; #10;

    $finish;
end



endmodule