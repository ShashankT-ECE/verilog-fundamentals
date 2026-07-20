module ring_counter_updown(
    input clk,rst,control,
    output reg [3:0]q
);

always@(posedge clk)begin
    if(rst)
    q <= 4'b0001;
    else if(control)
    q <= {q[2:0],q[3]};
    else
    q <= {q[0],q[3:1]};
end
endmodule