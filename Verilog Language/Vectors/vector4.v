module top_module (
    input [7:0] in,
    output [31:0] out );


    /*
    
    - the problem requires us to extend an 8 bit vector to a 32 bit vector
    - to perform this we could just simply add 24 0's the the 8 bit vector and call it a day
    - but we need to perfrom signed extension, so the integrity of number being +ve or -ve is maintainted
    - so instead of simply concatenating 24 0's we'll concatenate whatever bit is MSB 24 times
    - concatenation operator allows you to concatenate same thing multiple times
    - {3{1'b1}}  => 3'b111    3 times 1 bit = 1 leads to 3 bits = 1, i.e. 111;
    - so we need to just concatenate the 8 bit vector with 24 times of MSB
    - 24 times MSB will be : {24{in[7]}}
    - concatenatination of 24 times MSB with the vector would be : {{24{in[7]}},in}
    
    */

    assign out = {{24{in[7]}},in}; //here we assign out to concatenation of vector and its MSB 24 times (to preserve sign)

endmodule
