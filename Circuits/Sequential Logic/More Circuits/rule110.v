module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q     // Added 'reg' here
); 


/*
    - to solve this problem you need to know how to solve kmap.
    - the problem has given a truth table stating what combinations produce what output
    - lets say we had a 4 bit vector with bits Q[3] Q[2] Q[1] Q[0]
    - so the output of each bit depends upon itself and its left and right neighbour
    - also given that for extremes(Q[3] and Q[0]) we can assume their left and right neighbours to be 0
    - so Q[3] depends on Q[2], 0 and Q[3] itself
    - Q[2] depends on Q[3], Q[1] and Q[2] itself
    - Q[1] depends on Q[2], Q[0] and Q[1] itself
    - Q[0] depends on Q[1], 0 and Q[0] itself

    - so every bit needs the bit before it and bit after it
    - if i wanted to align them I could create 2 dummy vectors, Qr amd Ql
    - Ql would bring the left bit forward to be on the same level as current bit(by rigth shifting Q)
    - Qr would bring the right bit backward to be on the same level as current bit(by left shifting Q)

    - so on aligning Q, Qr and Ql we would have all our combinations
    - Ql ->  0     Q[3]     Q[2]     Q[1]
    - Q  -> Q[3]   Q[2]     Q[1]     Q[0]
    - Qr -> Q[2]   Q[1]     Q[0]      0

    - so see, left shifted(Qr), right shifted(Ql) and current (Q) aligned give us all combinations
    - this same concept we will apply to the 512 bit vector

    - now on solving the given table by kmap, equation formed is next state of Q depends on -> (~L)&(R) | C^(Qr)
    - to apply this on entire vector at once we just use Ql in place of L, Qr in place of R, and Q in place of C
*/
    
    wire [511:0] ql,qr;
    assign ql = {1'b0, q[511:1]};  //right shift q to get ql as discussed
    assign qr = {q[510:0], 1'b0};  //left shift q to get qr as discussed

    always @(posedge clk) begin
        if (load) begin
            q <= data;     //on load, q just gets whatever data is given
        end else begin
            q <= ((~ql) & qr) | (q ^ qr); //otherwise q gets the result of boolean expression formed by solving given table by a K-map
        end
    end

endmodule