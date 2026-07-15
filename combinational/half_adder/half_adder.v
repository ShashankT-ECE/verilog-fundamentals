module half_adder(
    input a,
    input b,
    output cout,
    output sum
);

assign cout = a & b;  //Dataflow
assign sum = a ^ b;
endmodule



/*
module half_adder(
    input a,
    input b,
    output cout,
    output sum
);
xor(sum,a,b); //Gate level or Structural
and(cout,a,b);
endmodule

module half_adder(
    input a,
    input b,
    output cout,
    output sum
);
  //Behavioral
always@(*)begin
    case (a,b)
      2'b00  : begin sum=0;cout=0; end
      2'b01  : begin sum=1;cout=0; end
      2'b10  : begin sum=1;cout=0; end
      2'b11  : begin sum=0;cout=1; end



        default: begin sum = 1'bx;cout = 1'bx; end
    endcase
end

*/



