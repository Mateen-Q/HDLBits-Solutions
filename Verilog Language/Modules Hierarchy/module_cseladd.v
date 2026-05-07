module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] sc0,sc1;  //these will be the sum outputs of adder2(a2) and adder3(a3) which will 
    //go into multiplxers and finally we will choose them based on cout of the first adder(a1)


    wire cout, c0,c1;    //declaring these wires as intermediate wires to handle the carry out of all the 3 adders


    add16 a1(a[15:0], b[15:0], 1'b0, sum[15:0], cout); 
    //adder1 is instantiated and it is given the lower bits of a and b(bits 15-0), carryIn to
    //the first adder is 0, output sum is given to lower bits of the sum vector.



    add16 a2(a[31:16], b[31:16], 1'b0, sc0, c0);
    //adder 2 is instantiated, it will perform addition of the higher bits of a and b
    //assuming that the carryout of 1st adder is 0


    add16 a3(a[31:16], b[31:16], 1'b1, sc1, c1);
    //adder 3 is instantiated, it will perform addition of the higher bits of a and b
    //assuming that the carryout of 1st adder is 1.
    


    assign sum[31:16] = cout?sc1:sc0;

    //here we devise a Multiplexer using the ternary operator simmilar to other HLL.
    //remember, a2 and a3 were performing addition assuming the values of carryIns
    //now when we have computed cout(the carryOut of adder1) we can tell whether it was 1 or 0
    //a2 computed sum of higher bits assuming cout was 0, so if cout =0 then its sum output(sc0) will be chosen
    //a3 computed sum of higher bits assuming cout was 1, so if cout =1 then its sum output(sc0) will be chosen
    //finally the chosen sum output is assigned to the higher bits(31-16) of actual sum vector


endmodule
