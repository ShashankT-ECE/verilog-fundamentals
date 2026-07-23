module piso_tb;
parameter N = 4;
reg clk,rst;
reg [N-1:0]pin;
wire sout;
reg load;
piso dut(.clk(clk),.rst(rst),.pin(pin),.sout(sout),.load(load));

always #5 clk = ~clk;

task reset_dut;
begin
    rst=1;pin=0;load=1;
    @(posedge clk);#1;
    rst=0;
end
endtask

task drive;
input reset;
input [N-1:0]parallel_in;
begin
    rst = reset;
    pin = parallel_in;
    @(posedge clk); #1;
end
endtask

task drive_serial;
input ld;
begin
    load = ld;
    @(posedge clk); #1;
end
endtask

initial begin
    clk=0;rst=1;pin=0;load=1;
    $dumpfile("piso.vcd");
    $dumpvars(0,piso_tb);
    $monitor("rst=%b,clk=%b,pin=%b,shift_reg=%b,sout=%b",rst,clk,pin,dut.shift_reg,sout);

    reset_dut;
    drive(0,4'b1101); //1 clk for parallel load
    repeat(4) drive_serial(0); //N clks for serial output
    $finish;

    

end
endmodule