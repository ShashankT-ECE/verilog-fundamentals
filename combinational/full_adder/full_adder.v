module full_adder(a,b,c,sum,carry);
    input a,b,c;
    output sum,carry;
    wire x,y,z;

    xor(sum,a,b,c);
    and(x,a,b);
    and(y,b,c);
    and(z,c,a);
    or(carry,x,y,z);

endmodule 

//behavioral:

/*module fa(a,b,c,sum,carry);
    input a,b,c;
    output reg sum,carry;

    always@(*)begin
        case({a,b,c})
            3'b000: begin sum = 0; cout = 0; end
            3'b001: begin sum = 1; cout = 0; end
            3'b010: begin sum = 1; cout = 0; end
            3'b011: begin sum = 0; cout = 1; end
            3'b100: begin sum = 1; cout = 0; end
            3'b101: begin sum = 0; cout = 1; end
            3'b110: begin sum = 0; cout = 1; end
            3'b111: begin sum = 1; cout = 1; end
          
        endcase
    end
    endmodule*/
