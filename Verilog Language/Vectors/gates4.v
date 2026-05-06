module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);


    /*
    
    - the problem requires us to create gates whose inputs are inidivdual bits of the vectors
    - a really efficient way to solve this problem is to use unary logical operators
    - suppose I have a vector [2:0] a, so if i write '  &a  ' it would lead to : 
            a[2]&a[1]&a[0], this happens because the operator is applied onto a single value rather than between 2 variables

    - so unary operators on vectors performs an operation amongst their bits
    - XOR = ^
    - OR = |
    - AND = &

    */


    assign out_and = &in;  //we want to create a gate that performs AND on all bits of in so 
                           // &in will perform AND between all bits of in
                           //we then assign that output to out_and

    assign out_or = |in;   // '|in' performs OR amongst all bits of 'in' and then its assigned to out_or
    assign out_xor = ^in;  // '^in' performs XOR amongst all bits of 'in' and then its assigned to out_xor

endmodule
