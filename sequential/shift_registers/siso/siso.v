module siso #(parameter N = 4)(
    input clk,rst,
    input sin,
    output sout
);

reg [N-1:0]shift_reg;

always@(posedge clk)begin
    if(rst)
    shift_reg <= 0;
    else
    shift_reg <= {shift_reg[N-2:0],sin};
end
assign sout = shift_reg[N-1];
endmodule