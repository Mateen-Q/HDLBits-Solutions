`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 


    /*

    - Sometimes complex circuits require declaration of wires that will be used as intermediates
      in the circuit, wires can be declared using the 'wire' keyword.
    - wires must be declared before they are used in the module
    - wires are private and internal to the module and not visible outside the module

    -our circuit requires a minimum of 2 intermediate wires:
        1) a1(coming out of the first and gate with inputs a and b)
        2) a2(coming out of the first and gate with inputs c and d)
    */
    
    wire a1,a2;   //here we have decalred both the wires together at once using a comma
    
    assign a1 = a&b;  //here we assign a1 as a&b because a1 wire is the output of an AND gate with inputs a,b
    assign a2 = c&d;  //here we assign a2 as c&d because a1 wire is the output of an AND gate with inputs c,d
    assign out = a1|a2; //we can see output is the result of OR operation between a1 and a2 so we assign it as that
    assign out_n = ~(a1|a2);  //out_n is just the invert of out so we assign it as invert of what out was assigned to.

endmodule
