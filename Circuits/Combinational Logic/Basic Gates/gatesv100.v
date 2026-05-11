module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );
    


	// Use bitwise operators and vector slicing or part select to do this

    assign out_both = in[99:1] & in[98:0];   //bit in[98] will be AND-ed with [99] 
    										 //which is exactly what we want comparision
    //of in[98] will be compared with the bit to its left in[99], same will happen for
    //all adjacent pairs in[98] with in[97] and so on till in[1] with in[0]

    assign out_any = in[99:1] | in[98:0];
	
    assign out_different = in ^ {in[0], in[99:1]}; //because vector wraps around 
    
    //we took the in[0] and brought it to front, now we just XOR the original
    //vector with existing vector and find the comparision! of adjacent bits


endmodule
