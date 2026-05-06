module top_module( 
    input a, 
    input b, 
    output out );


    /*
    
    - xor is a simple logical operation that takes 2 bits, outputs 1 if they're different
      else outputs 0 if they're same
    - in verilog xor is performed using the '^' operator
    - xnor is essentialy just the inverted output of whatever xor outputs
    - if i wanted to perform a XOR b i would write a^b
    - to perform xnor we can just invert the performed xor by writing : ~(a^b)

    */
    
    assign out = ~(a^b);

endmodule
