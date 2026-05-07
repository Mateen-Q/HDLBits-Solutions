module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);


/*

    - sometimes maintaining same order as declaration and instantiation to connect modules 
      to outside variables can get complex comparitively
    - to ensure all connections are made properly we can simply connect them by name
    - connecting by name is simple and has a simple syntax : 
            .nameOfVariableInModuleBeingInstantiated(nameOfVariableInThisModule)

*/
    
    mod_a i1(.out1(out1), .out2(out2), .in1(a), .in2(b), .in3(c), .in4(d));
//                                       ^  ^
//                                       |  |
//            name when mod_a was declared  name in top module
//            this tells verilog that 'a' needs to be connected to in1 pin of mod_a


endmodule
