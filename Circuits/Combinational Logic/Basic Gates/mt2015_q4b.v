module top_module ( input x, input y, output z );

    /*
    we can read the timing graph given and tell that whenever x and y are same, the output
    is 1 and whenever they are different the output is 1 and whenever they are same the 
    output is 0, this behaviour is exhibited by a XNOR gate, so all we need to do is to
    implement a XOR gate
    */

    assign z = ~(x^y);  //performing XOR between x and y and assigning it to z. 
endmodule
