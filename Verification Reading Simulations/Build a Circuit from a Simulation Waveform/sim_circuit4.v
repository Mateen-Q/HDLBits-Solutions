module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );
    
    /*


    - lets observe and plot the given waveform output(q) against a,b,c,d

    
    // Truth Table for Inputs abcd:
    // Decimal | a b c d | Output
    // ------------------------
    //    0    | 0 0 0 0 |   0
    //    1    | 0 0 0 1 |   0
    //    2    | 0 0 1 0 |   1
    //    3    | 0 0 1 1 |   1
    //    4    | 0 1 0 0 |   1
    //    5    | 0 1 0 1 |   1
    //    6    | 0 1 1 0 |   1
    //    7    | 0 1 1 1 |   1
    //    8    | 1 0 0 0 |   0
    //    9    | 1 0 0 1 |   0
    //   10    | 1 0 1 0 |   1
    //   11    | 1 0 1 1 |   1
    //   12    | 1 1 0 0 |   1
    //   13    | 1 1 0 1 |   1
    //   14    | 1 1 1 0 |   1
    //   15    | 1 1 1 1 |   1


    if we solved this using a kmap
    we will get an expression c|b;

    
    */

    assign q = c|b;

endmodule
