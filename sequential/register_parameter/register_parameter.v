module register_parameter #(parameter WIDTH = 4)(
    input clk,rst,write_enable,
    input [WIDTH-1:0]data_in,
    output reg [WIDTH-1:0]q
);

always@(posedge clk)begin
    if(rst)
    q<=0;
    else if(write_enable)
    q <= data_in;
    else
    q <= q;
end
endmodule