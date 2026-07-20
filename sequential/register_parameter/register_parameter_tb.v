module register_parameter_tb;
parameter WIDTH = 4 ;
reg clk,rst,write_enable;
reg [WIDTH-1:0]data_in;
wire [WIDTH-1:0]q;

register_parameter #(.WIDTH(WIDTH)) dut(.clk(clk),.rst(rst),.data_in(data_in),.write_enable(write_enable),.q(q));

always #5 clk = ~clk;

initial begin
    rst=0;clk=0;write_enable=0;data_in=0;

    $dumpfile("register_parameter.vcd");
    $dumpvars(0,register_parameter_tb);
    $monitor("rst=%b,clk=%b,wr_en=%b,data_in=%b,q=%b",rst,clk,write_enable,data_in,q);

    rst=1;#10;
    rst=0; write_enable=1;data_in=4'b1010;#10;
    write_enable=0;#20;
    write_enable=1;data_in=4'b1111;#20;
    rst=1;#10;
    rst=0;
    #20;
    $finish;
end
endmodule



