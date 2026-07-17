module jkff(
    input [1:0]jk,
    input clk,rst,
    output reg q
);

always@(negedge clk)begin
    if(rst)
    q<=0;
    else
    case (jk)
        2'b00: q<=q;
        2'b01:q<=0;
        2'b10:q<=1;
        2'b11:q<=~q;
         
        default: q<=1'bx;
    endcase
end
endmodule