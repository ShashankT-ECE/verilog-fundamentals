module siso_tb;
parameter N = 4 ;
reg clk,rst,sin;
wire sout;
siso dut(.clk(clk),.rst(rst),.sin(sin),.sout(sout));

always #5 clk = ~clk; //Toggles every 5 time units,so time period is 10

task dut_reset;
begin
    rst=1;sin=0;
    @(posedge clk);  //-> posedge delay
    rst=0;
end
endtask

task drive;
input reset;
input serial_in;
begin
    rst = reset;
    sin = serial_in;
    @(posedge clk); //-> check waveform to understand properly
end
endtask

initial begin
    clk=1;rst=0;sin=0; //-> clk is initilialized to 1'b1
    $dumpfile("siso.vcd");
    $dumpvars(0,siso_tb);
    $monitor("rst=%b,clk=%b,sin=%b,shift_reg=%b,sout=%b",rst,clk,sin,dut.shift_reg,sout);

    dut_reset;
    drive(0,1);
    drive(0,1);
    drive(0,0);
    drive(0,1); //Loading of 4 bit data has happened

    repeat(N) drive(0,0); //Taking serial output
    $finish;
    
end
endmodule