module decade_counter(
    input clk,rst,
    output reg [3:0]q
);

always@(posedge clk)begin
    if(rst)
    q<=4'b0000;
    else if(q<9)
    q<=q+1;
    else
    q<=0;
end
endmodule