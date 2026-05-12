module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 


/*

- to solve this problem we need to analyze the K-map column by column

1) for the first column, ab=00, we have 3 1's, at cd= 01, cd = 11 and cd =10;
   so essentially what we have is (~a)(~b) [ ~c&d | c&d | c&~d ] , ab=00 is common for all
   on simplifying the expression inside the bracket, we will have (~a)&(~b) [ c|d ]

   we will feed the inside expression to the mux line(mux_in[0]) that is already feeding into ab=00, so we can
   remove the (~a)&(~b) part.

   so mux_in[0] = c|d;

2) for the second column, ab=01, we have no 1's in the entire column
   so essentially what we have is (~a)(b) [0] , ab=10 is common for all
   can't further simplify expression inside the bracket, we will have (~a)&(~b) [ 0 ]

   we will feed the inside expression to the mux line(mux_in[1]) that is already feeding into ab=01, so we can
   remove the (~a)&(b) part. so all we are left with is 0

   mux_line[1] = 1'b0;

3) for the third column, ab=11, we have a single 1 in the entire column
   so essentially what we have is (a)&(b) [c&d] , ab=11 is common for all
   can't further simplify the expression inside the bracket, we will have (~a)&(~b) [ c&d ]

   we will feed the inside expression to the mux line(mux_in[3]) that is already feeding into ab=11, so we can
   remove the (~a)&(b) part. so all we are left with is c&d

   mux_line[3] = c&d;

3) for the fourth column, ab=10, we have a two 1's in the entire column
   so essentially what we have is (a)&(~b) [ ~c&~d | c&~d ] , ab=10 is common for all
   on further simplifying the expression inside the bracket, we will have (a)&(~b) [ ~d ]

   we will feed the inside expression to the mux line(mux_in[2]) that is already feeding into ab=10, so we can
   remove the (a)&(~b) part. so all we are left with is ~d

   mux_line[2] = ~d;


    */

    //now we implement those reduced expressions for every using ternary operator(2:1 mux)

    assign mux_in[0] = c?1:d;      // c?1:d is equivalent to c | d
    assign mux_in[1] = 1'b0;
    assign mux_in[3] = c?d:0;     //c?d:0 is equivalent to c&d;
    assign mux_in[2] = d?0:1;     //d?0:1 is equivalent to ~d;

endmodule
