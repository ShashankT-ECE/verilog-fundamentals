module ring_counter_struc(
    input clk,rst,
    input [3:0]d,
    output [3:0]q
);

dff_set u0(.clk(clk),.rst(rst),.d(q[3]),.q(q[0]));
dff u1(.clk(clk),.rst(rst),.d(q[0]),.q(q[1]));
dff u2(.clk(clk),.rst(rst),.d(q[1]),.q(q[2]));
dff u3(.clk(clk),.rst(rst),.d(q[2]),.q(q[3]));

endmodule