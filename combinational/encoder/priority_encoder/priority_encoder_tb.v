module priority_encoder_tb;
reg [3:0]d;
wire [1:0]y;
wire v;
integer i;

priority_encoder dut(.d(d),.y(y),.v(v));

initial begin
    d=4'b0000;
     $dumpfile("priority_encoder.vcd");
     $dumpvars(0,priority_encoder_tb); 

     $monitor("d=%b,y=%b,v=%b",d,y,v);

     d=4'b1010; #10;
     d=4'b0001; #10;
     d=4'b0011; #10;
     d=4'b1001; #10;

     #20;
     $finish;

     
end

endmodule