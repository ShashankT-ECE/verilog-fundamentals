module mux_4x1(
    input [3:0]i,
    input [1:0]sel,
    output reg y
);

always@(*)begin     //Behavioral
    case (sel)
       2'b00 : y=i[0];
       2'b01 : y=i[1];
       2'b10 : y=i[2];
       2'b11 : y=i[3];
        default: y=1'bx;
        
    endcase

end

endmodule

/*

module mux_4x1(
    input [3:0]i,
    input [1:0]sel,
    output y
);

assign y = ( (~s1 & ~s0 & i[0]) | (~s1 & s0 & i[1]) | (s1 & ~s0 & i[2]) | (s1 & s0 & i[3]) ); //Dataflow
endmodule


//conditional operator
module mux_4x1(
    input [3:0]i,
    input [1:0]sel,
    output reg  y
);

always@(*)begin
    y = (sel[1] & sel[0]) ? i[3] : (sel[1] & ~sel[0])? i[2] : (~sel[1] & sel[0]) ?  i[1] : (~sel[1] & ~sel[0]) ? i[0] : 1'bx; 
    
end
endmodule

*/

