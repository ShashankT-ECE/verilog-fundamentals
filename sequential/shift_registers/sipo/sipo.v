module sipo #(parameter N = 4)(
    input clk,rst,sin,
    output [N-1:0]pout
);
reg [N-1:0]shift_reg;

always@(posedge clk)begin
    if(rst)
    shift_reg <= 0;
    else
    shift_reg <= {shift_reg[N-2:0],sin};
end
assign pout = shift_reg;

endmodule