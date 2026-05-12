module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
    
    //here we need to select 4 bits at a time, vector slicing requires constant values so we 
    //can't just do in[sel*4+3 : sel*4], in this case we need to use the indexed part select

    /*
    To solve this, Verilog provides a specific syntax for "variable base, constant width" selection: the +: operator.

    assign out = in[sel*4 +: 4];

    Breakdown of the Syntax: 

    'sel*4' This is the variable base. It tells the hardware where to start looking in the 1024-bit vector.

    '+:' This indicates you want to select a range starting from the base and moving up (increasing indices).

    '4' This is the constant width. Since this number is a hard-coded integer, the compiler can successfully synthesize the 4-bit wide wires.

    case 1: sel = 0, then base = 0*4 = 0.
            starting from base(0) range and going up(+:) until we have a 4 bit vector.
            so finally we will have in[3:0] .. 4 bit starts from 0

    case 1: sel = 1, then base = 1*4 = 4.
            starting from base(4) range and going up(+:) until we have a 4 bit vector.
            so finally we will have in[7:4] .. 4 bit starts from 4

    */

    assign out = in[sel*4 +: 4];

endmodule
