module top_module( 
    input a, 
    input b, 
    output out );
    
    /*

    - NOR operation is essentially just the invert of whatever OR operation results in.
    - in verilog, OR operation is done using the '|' operator
    - so if I wanted to perform a OR b i would write : a|b
    - because NOR is essentially just negate of OR, if i wanted to perform a NOR b i would write
    ~(a|b)

    */

    assign out = ~(a|b);   //so we perform NOR between a and b then assign it to out


endmodule
