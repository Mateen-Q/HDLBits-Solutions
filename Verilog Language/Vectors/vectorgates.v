module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);


    /*
    
    - the problem requires us to perform logical OR and bitwise OR on 2 input vectors of 3 bits
    - a logical OR basically performs OR between all bits of a vector first and finds out a final output
    - logical OR is performed using '||' operator
        - so  a||b    will lead to ( a[2] | a[1] | a[0] )  |  ( b[2] | b[1] | b[0] )


    - a bitwise OR performs OR bit by bit, a^b will lead to a[2]^b[2] , a[1]^b[1] , a[0]^b[0]
        - so a[2]^b[2] will be assigned to out_or_bitwise[2]
        - so a[1]^b[1] will be assigned to out_or_bitwise[1]
        - so a[0]^b[0] will be assigned to out_or_bitwise[0]
    
    */
    
    assign out_or_bitwise = a|b;     //so we assign a|b to out_or_bitwise
    assign out_or_logical = a||b;    //we assign a||b to out_or_logical
    assign out_not = {(~b),(~a)};    //the problem requires upper byte to be inverse of b and lower byte to be inverse of a
                                     //so we use the {} concatenation operator to combine the negate of a and b into a single 6 bit vector

endmodule
