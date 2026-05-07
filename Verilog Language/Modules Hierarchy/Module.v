module top_module ( input a, input b, output out );

/*

    - the problem requires us to connect a,b and out of the top_module to mod_a
    - to do this we must know how mod_a was declared
    - given that mod_a was declared as '  mod_a(in1 in2, out)  ' we can now know in what
      order to instantiate the mod_a
    - mod_a can be instantiated as mod_a instancename(connections)

    - now we wanna connect a to in1, b to in2 and out to out
    - so when we instantiate mod_a we will instantiate a,b,out
    - because in1, in2, out is the order in which mod_a was declared
    - so this way a will connect to in1, b to in2 and out to out


*/
    
    //mod_a was declared as ' module mod_a (input wire in1, input wire in2, output wire out) '
    //so when we instantiate it with a,b and out, we will make sure order is a,b and out
    //if we wrote out, a, b during instantiation then in1 will connect to out, in2 to a and out to be
    //this would produce wrong results

    mod_a i1(a,b,out);

endmodule
