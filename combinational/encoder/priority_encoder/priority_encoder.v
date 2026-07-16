module priority_encoder(
    input [3:0]d,
    output reg [1:0]y,
    output reg v
);
always@(*)begin
    casex (d)
        4'b0001 : begin y=2'b00; v=1'b1; end 
        4'b001x : begin y=2'b01; v=1'b1; end 
        4'b01xx : begin y=2'b10; v=1'b1; end 
        4'b1xxx : begin y=2'b11; v=1'b1; end
        4'b0000 : begin y=2'bxx; v=1'b0; end 
    endcase
end

endmodule