module encoder_8x3(
    input [7:0]d,
    output reg [2:0]y
);

always@(*)begin
    case (d)
        8'b0000_0001: begin y=3'b000; end 
        8'b0000_0010: begin y=3'b001; end 
        8'b0000_0100: begin y=3'b010; end 
        8'b0000_1000: begin y=3'b011; end 
        8'b0001_0000: begin y=3'b100; end 
        8'b0010_0000: begin y=3'b101; end 
        8'b0100_0000: begin y=3'b110; end 
        8'b1000_0000: begin y=3'b111; end 
        

        default: y = 3'bxxx;
    endcase
end
endmodule