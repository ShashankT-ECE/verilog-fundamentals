module sipo_tb;
parameter N = 4;
reg clk,rst,sin;
wire [N-1:0]pout; 
sipo dut(.clk(clk),.rst(rst),.sin(sin),.pout(pout));

always #5 clk = ~clk;

task reset_dut;
begin
    rst=1;sin=0;
    @(posedge clk); #1;
    rst=0;
end
endtask

task drive;
input reset;
input serial_in;
begin
    rst = reset;
    sin = serial_in;
    @(posedge clk); #1;
end
endtask

initial begin
    clk=0;rst=0;sin=0;
    $dumpfile("sipo.vcd");
    $dumpvars(0,sipo_tb);
    $monitor("rst=%b,clk=%b,sin=%b,shift_reg=%b,pout=%b",rst,clk,sin,dut.shift_reg,pout);

    reset_dut;
    drive(0,1);
    drive(0,1);
    drive(0,0);
    drive(0,1);

    $finish;   //since parallel out- no need to wait.
end
endmodule