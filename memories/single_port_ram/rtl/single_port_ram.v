`timescale 1ns/1ps
module single_port_ram(
    input clk,
    input rst,
    input we,
    input cs,
    input [3:0] addr,
    input [7:0] din, //16x8
    output reg [7:0] dout

);
    reg[7:0]mem[15:0];
    integer i;
    always@(posedge clk) begin
        if(rst) begin
            for(i=0;i<16;i=i+1) mem[i] <= 0; //RESET
        end
        else if(cs)begin
            if(we) mem[addr] <= din; //WRITE
            else dout <= mem[addr]; //READ
        end
    end
    endmodule

