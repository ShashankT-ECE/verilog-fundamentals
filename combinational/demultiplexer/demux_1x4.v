module demux_1x4(
    input d,
    input [1:0]sel,
    output reg[3:0]y
);
/*
always@(*)begin
    case (sel)
        2'b00 : y = {3'b000,d};
        2'b01 : y = {2'b00,d,1'b0};
        2'b10 : y= {1'b0,d,2'b00};
        2'b11 : y = {d,3'b000};

        default: y = 4'bxxxx;
    endcase
end    




assign  y[0] = ~sel[1] & ~sel[0] & d;
assign y[1] = ~sel[1] & sel[0] & d;
assign y[2] = sel[1] & ~sel[0] & d;
assign y[3] = sel[1] & sel[0] & d;   */

always@(*)begin
    y = 4'b0000;
    case (sel)
       2'b00 : y[0] = d;  
       2'b01 : y[1] = d;  
       2'b10 : y[2] = d;  
       2'b11 : y[3] = d;  
        default: y=4'bxxxx;
    endcase
end

endmodule