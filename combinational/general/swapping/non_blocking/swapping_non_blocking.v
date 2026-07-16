module swapping_non_blocking(
    input clk,
    input [3:0]a,b,
    output reg [3:0]a_out,b_out
);

always@(posedge clk)begin
    a_out <= b;
    b_out <= a;
end
endmodule