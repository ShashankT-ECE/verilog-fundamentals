module pipo #(parameter N = 4)(
    input clk,rst,
    input [N-1:0]pin,
    output reg [N-1:0]pout
);


always@(posedge clk)begin
    if(rst)
    pout <= 0;
    else
    pout <= pin;
end
endmodule