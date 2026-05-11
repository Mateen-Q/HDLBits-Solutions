module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );

    //we will perform manual bit assignment using concatenation operator: 
    
    assign out_both = {in[3]&in[2], in[2]&in[1], in[1]&in[0]};  //out_both[2] will be the
    //check for same bit of in[2] and the bit to its left in[3] so out[2] = in[3]&in[2]
    //simillar check happens for all the 2 bit pairs


    assign out_any = {in[3]|in[2], in[2]|in[1], in[1]|in[0]}; //out_any wil check for
    //any of the bits being 1 out of a bit and its right adjacent bit.
    //out_any[3] will check whether any one of in[3] and the bit to its right in[2] 
    //are 1, so out_any[3] = in[3]|in[2]; simillar thing happens for the rest of pairs

    assign out_different = {in[0]^in[3], in[3]^in[2], in[2]^in[1], in[1]^in[0]};

    //out_different checks whether a bit and its left adjacent bit is same or different
    //if the bits are different we need an output 1 indicating its differemt, this 
    //comparision can be easily performed using a XOR. there is no bit to the left
    //of in[3] but because the vector wraps around, it is XOR-ed with in[0]


    //we could have also peformed this using a for loop but its better to perform
    //this manual assignment from a fabrication POV, for loops make fabrication
    //complicated.


    //we could also perfrom this using vector slicing operations, we'll see that when we
    //have longer vectors

endmodule
