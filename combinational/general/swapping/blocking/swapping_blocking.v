/* module swapping_blocking(
    input [3:0]a,b,
    output [3:0]a_out,b_out
);

assign a_out = b;
assign b_out = a;

endmodule
*/


module swapping_blocking(
    input [3:0]a,b,
    output reg [3:0]a_out,b_out
);
reg [3:0]temp;

always@(*)begin
    temp = a;
    b_out = temp;
    a_out = b;

end
endmodule
