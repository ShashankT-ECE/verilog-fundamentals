module operators_eg;

reg [3:0] a, b;

initial begin
    a = 4'd10;
    b = 4'd3;

    // Arithmetic
    $display("a + b      = %d", a + b);
    $display("a - b      = %d", a - b);
    $display("a * b      = %d", a * b);
    $display("a / b      = %d", a / b);
    $display("a %% b     = %d", a % b);
    $display("a ** b     = %d", a ** b);

    $display("----------------------------");

    // Relational
    $display("a < b      = %b", a < b);
    $display("a > b      = %b", a > b);
    $display("a <= b     = %b", a <= b);
    $display("a >= b     = %b", a >= b);

    $display("----------------------------");

    // Equality
    $display("a == b     = %b", a == b);
    $display("a != b     = %b", a != b);
    $display("a === b    = %b", a === b);
    $display("a !== b    = %b", a !== b);

    $display("----------------------------");

    // Logical
    $display("a && b     = %b", a && b);
    $display("a || b     = %b", a || b);
    $display("!a         = %b", !a);

    $display("----------------------------");

    // Bitwise
    $display("a & b      = %b", a & b);
    $display("a | b      = %b", a | b);
    $display("a ^ b      = %b", a ^ b);
    $display("~a         = %b", ~a);

    $display("----------------------------");

    // Shift
    $display("a << 2     = %b", a << 2);
    $display("a >> 2     = %b", a >> 2);
    $display("a <<< 2    = %b", a <<< 2);
    $display("a >>> 2    = %b", a >>> 2);

    $display("----------------------------");

    // Concatenation
    $display("{a,b}      = %b", {a,b});

    // Replication
    $display("{2{a}}     = %b", {2{a}});
    $display("{3{b}}     = %b", {3{b}});
    $display("{{2{a}},{3{b}}} = %b", {{2{a}}, {3{b}}});

    #10;
    $finish;
end

endmodule