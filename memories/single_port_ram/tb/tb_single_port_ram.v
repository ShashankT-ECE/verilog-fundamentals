`timescale 1ns/1ps
module tb_single_port_ram();
    reg clk;
    reg rst;
    reg we;
    reg cs;
    reg [3:0] addr;
    reg [7:0] din;
    wire [7:0] dout;

    single_port_ram uut(
        .clk(clk),
        .rst(rst),
        .we(we),
        .cs(cs),
        .addr(addr),
        .din(din),
        .dout(dout)
    );

    always #5 clk = ~clk; // Clock generation

    initial begin
        $dumpfile("single_port_ram.vcd");
        $dumpvars(0, tb_single_port_ram);

        $monitor("Time=%0t | clk=%b rst=%b we=%b cs=%b addr=%h din=%h dout=%h", $time, clk, rst, we, cs, addr, din, dout);

        clk=0;rst=0;we=0;cs=0;addr=0;din=0; 
        rst=1; #10; rst=0; // RESET TEST

        
        cs=1; we=1; addr=4'd3; din=8'hAA; #10; // Write 0xAA to address 3 

        cs=1; we=1; addr=4'd5; din=8'h55; #10; // Write 0x55 to address 5

        cs=1; we=0; addr=4'd3; #10; // Read from address 3, expect 0xAA

        cs=1; we=0; addr=4'd5; #10; // Read from address 5, expect 0x55

        cs=0; we=0; addr=4'd3; #10; // Chip select low, no operation

        $finish;

        
        
    end
endmodule