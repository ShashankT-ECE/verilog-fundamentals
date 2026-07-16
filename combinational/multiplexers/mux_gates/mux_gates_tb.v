module mux_gates_tb;
reg a,b;
wire and_r,or_r,nand_r,nor_r,xor_r,xnor_r;
integer i;

mux_gates dut(.a(a),.b(b),.and_r(and_r),.or_r(or_r),.nand_r(nand_r),.nor_r(nor_r),.xor_r(xor_r),.xnor_r(xnor_r));

initial begin
    a=0;b=0;
    $dumpfile("mux_gates.vcd");
    $dumpvars(0,mux_gates_tb);

    $monitor("a=%b,b=%b,and_r=%b,or_r=%b,nand_r=%b,nor_r=%b,xor_r=%b,xnor_r=%b",a,b,and_r,or_r,nand_r,nor_r,xor_r,xnor_r);

    for(i=0;i<4;i=i+1)begin
        {a,b} = i; #10;
    end
    #20;
    $finish;


end
endmodule