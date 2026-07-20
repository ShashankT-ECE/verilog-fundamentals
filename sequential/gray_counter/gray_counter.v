module gray_counter(
    input clk,rst,
    output [2:0]gray
);
reg [2:0]bin;

always@(posedge clk)begin
    if(rst)
    bin<=0;
    else
    bin<=bin+1;
end
assign gray = bin ^(bin>>1);
endmodule