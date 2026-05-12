module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );
    
    assign out = in[sel];  //when sel=0, first bit of in will be chosen in[0], and thats what we want
    //when sel = 0, in[1] will be chosen and thats what we want 
    //so based on the sel, we just choose the 'sel' bit of the vector
endmodule
 