module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);


    /*
    
    - the problem has already told us that mod_a is declared as :
            module mod_a(output,output, input,input,input,input)

    - we know we have 4 inputs(a,b,c,d) and 2 outputs(out1,out2)
    - to ensure outputs are connected to outputs and inputs to inputs we will make sure
      during instantiation we write out1 and out2 first and then the inputs
    
    */
    
    mod_a i1(out1, out2,a,b,c,d);  //wrote out1 and out2 first and then the inputs to match
                                   //the way that mod_a was declared.

endmodule
