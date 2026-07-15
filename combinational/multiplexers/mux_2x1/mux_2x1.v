/* module mux_2x1(
    input [1:0]i,
    input sel,
    output y
);

assign y = ((~sel & i[0]) | (sel & i[1])); //Dataflow

endmodule */


module mux_2x1(
    input [1:0]i,
    input sel,
    output reg y
);

always@(*)begin
    case (sel)   //Behavioral

       1'b0 : y=i[0];
       1'b1 : y=i[1];

        default: y= 1'bx; 
    endcase
    
end
endmodule  