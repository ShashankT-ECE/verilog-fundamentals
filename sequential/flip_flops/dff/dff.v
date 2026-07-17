 module dff(
    input clk,rst,d,
    output reg q
);

always@(negedge clk)begin
    if(rst)
    q<=0;
    else
    q<=d;


end
endmodule



