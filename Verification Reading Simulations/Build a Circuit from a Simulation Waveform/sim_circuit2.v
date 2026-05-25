module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );

/*
    -on observing a first few signals and plotting bits against output,
    a   b   c   d   q
    0   0   0   0   1
    0   0   0   1   0
    0   0   1   0   0
    0   0   1   1   1
    0   1   0   0   0
    0   1   0   1   1

    - we can see the circuit is outputting 1 if there are even number of 1's in the abcd code and 0 if there are odd number of ones in abcd code
    - we can mimic this behaviour using xnor amongst all bits
      

*/

    assign q = ~(a^b^c^d);    //xnor of all bits

endmodule
