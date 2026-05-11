module top_module( 
    input a, b,
    output out_and,
    output out_or,
    output out_xor,
    output out_nand,
    output out_nor,
    output out_xnor,
    output out_anotb
);
    assign out_and = a&b; //assigning out_and to AND between a and b
    assign out_or = a|b;  //assigning out_or to OR between a and b
    assign out_xor = a^b; //assigning out_xor to XOR between a and b
    assign out_nand = ~(a&b); //assigning out_nand to NAND between a and b
    assign out_nor = ~(a|b);  //assigning out_nor to NOR between a and b
    assign out_xnor = ~(a^b);  //assigning out_xnor to XNOR between a and b
    assign out_anotb = a&(~b);  //assigning out_anotb to AND between a and negative of b

endmodule
