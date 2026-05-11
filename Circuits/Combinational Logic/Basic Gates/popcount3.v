module top_module( 
    input [2:0] in,
    output [1:0] out );
    
    //if we made a truth table and determined what the output
    //should be based on every combination of input vector we can
    //draw : 
    
    /*
     Input vector  ,Number of 1's  Output (Y1​Y0​)
        0 0 0,		0,					0 0
        0 0 1,		1,					0 1
        0 1 0,		1,					0 1
        0 1 1,		2,					1 0
        1 0 0,		1,					0 1
        1 0 1,		2,					1 0
        1 1 0,		2,					1 0
        1 1 1,		3,					1 1
    */
    
    //from this using SOP we can create equation for out[1] and out[2];
    
    assign out[1] = (~in[2])&(in[1])&(in[0]) | (in[2])&(~in[1])&(in[0]) | (in[2])&(in[1])&(~in[0]) | (in[2])&(in[1])&(in[0]);
    assign out[0] = (~in[2])&(~in[1])&(in[0]) | (~in[2])&(in[1])&(~in[0]) | (in[2])&(~in[1])&(~in[0]) | (in[2])&(in[1])&(in[0]);

endmodule
