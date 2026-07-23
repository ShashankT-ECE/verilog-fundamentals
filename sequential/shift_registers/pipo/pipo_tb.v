module pipo_tb;
parameter N = 4 ;
reg clk,rst;
reg [N-1:0]pin;
wire [N-1:0]pout;
pipo dut(.clk(clk),.rst(rst),.pin(pin),.pout(pout));

always #5 clk = ~clk;

task reset_dut;
begin
rst=1;pin=0;
@(posedge clk); #1;
rst=0;
end
endtask

task drive;
input [N-1:0]parallel_in;
begin
    pin = parallel_in;
    @(posedge clk); #1;
end
endtask

initial begin
    clk=0;rst=0;pin=0;
    $dumpfile("pipo.vcd");
    $dumpvars(0,pipo_tb);
    $monitor("clk=%b,rst=%b,pin=%b,pout=%b",clk,rst,pin,pout);

    reset_dut;
    drive(4'b1101); // Parallel load happens in 1 clk cycle

    $finish; //Parallel out requires 0 clk cycles

end
endmodule
