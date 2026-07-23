module piso #(parameter N = 4) (
    input              clk,
    input              rst,
    input  [N-1:0]     pin,
    input              load,
    output reg         sout
);

    reg [N-1:0] shift_reg;

    always @(posedge clk) begin
        if (rst) begin
            shift_reg <= 0;
            sout      <= 0;
        end
        else begin
            if (load)
                shift_reg <= pin;        // parallel load — 1 clock
            else begin
                sout      <= shift_reg[N-1];   // MSB shifts out
                shift_reg <= shift_reg << 1;   // shift left
            end
        end
    end

endmodule