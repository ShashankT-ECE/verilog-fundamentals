module mod_n_counter #(parameter N = 26)(
    input clk,rst,
    output reg [$clog2(N)-1:0]q
);

always@(posedge clk)begin
    if(rst)
    q <= 0;
    else if(q == N-1)
    q <= 0;
    else
    q <= q+1;
end
endmodule