`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );


    /*
    - the problem requires us to split the input 'in' into 2 output parts
    - we know when a vector is declare ' [15:0] in '  so in[15] will be MSB and in[0] will be LSB
    - so upper 8 bits can be sliced as in[15:8] 
    - so lower 8 bits can be sliced as in[7:0]; 

    */

    assign out_lo = in[7:0];    //so we assign lower 8 bits(byte) to out_lo
    assign out_hi = in[15:8];   //and we assign higher 8 bits(byte) to out_high

endmodule
