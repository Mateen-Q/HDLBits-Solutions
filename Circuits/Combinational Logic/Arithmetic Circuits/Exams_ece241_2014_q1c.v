module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); 
    assign s = a+b;
    assign overflow = (~s[7])&a[7]&b[7] | s[7]&(~a[7])&(~b[7]);

    /*
    
    - to understand this solution you need to understand what a signed overflow is, a signed overflow
      occurs when 2 negative numbers are added and they produce a possitive number or when 2 possitive
      numbers are added and they produce a negative number.

    - the sign of a number can be detemined from its MSB, if its a negative number its MSB will be 1,
      if its a possitive number its MSB will be 0.

    - now our signed overflow can occur in 2 cases,
        1) MSB of a (a[7]) and MSB of b (b[7]) both are 1 but the MSB of s (s[7]) is 0
        2) MSB of a (a[7]) and MSB of b (b[7]) both are 0 but the MSB of s (s[7]) is 1
    
    - so our overflow bit must consider both cases 
    - then, overflow = (~s[7])&a[7]&b[7] | s[7]&(~a[7])&(~b[7])
                                ^                   ^
                                |                   |
                              Case1     or        Case2
                             

    */
    

endmodule
