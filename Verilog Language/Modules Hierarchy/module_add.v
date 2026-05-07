module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);




    wire ci,cout;  //we need to declare these intermediate wires ci(sits between adder 1 and adder2)
                   //cout will be the wire connected to carry out of adder2

    add16 a1(a[15:0], b[15:0], 1'b0, sum[15:0], ci); 
    //adder one deals with the lower bits (i.e. 15-0) so lower bits of a and b are given to it as input
    //carry in is 0 for the first adder, the output is given to sum[15:0] and the carryout is given to ci
                                                     
    add16 a2(a[31:16], b[31:16], ci, sum[31:16], cout);
    //now adder2 deals with the upper bits (i.e. bits 31-16) so upper bits of a and b are given to it as inputs
    //carryin for adder 2 will be the carrrout of adder 1 which we gave to wire ci, so here 
    //ci will be in place of cin, the output will be given to sum[31:16] and the carryOut which
    //is irrelevant will be given to cout, cout is not connected to anything outside the module.

endmodule
