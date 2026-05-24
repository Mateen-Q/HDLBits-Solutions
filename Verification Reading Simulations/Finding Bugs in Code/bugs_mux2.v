module top_module (
    input sel,
    input [7:0] a,
    input [7:0] b,
    output [7:0] out); //output wasn't declared as a 8 bit wide wire, it was just declared as 1 bit so we made that change

    assign out = sel?a:b;  //used a ternary operator to derive logic instead of given boolean expression

endmodule
