module ripple_counter(
    input clk,rst,
    output [3:0]q
);

jkff u0(.jk(2'b11),.rst(rst),.clk(clk),.q(q[0]));
jkff u1(.jk(2'b11),.rst(rst),.clk(q[0]),.q(q[1]));
jkff u2(.jk(2'b11),.rst(rst),.clk(q[1]),.q(q[2]));
jkff u3(.jk(2'b11),.rst(rst),.clk(q[2]),.q(q[3])); 

endmodule