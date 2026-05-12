module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    //on simplifying the given kmap we are left with the following boolean expression that we assign to out:

    assign out = (~c)&(~b) | (~d)&(~a) | (c)&(d)&(b) | (c)&(d)&(a);



endmodule
