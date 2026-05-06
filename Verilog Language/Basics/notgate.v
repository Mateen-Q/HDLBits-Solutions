module top_module( input in, output out );

    //we want output to invert the input, so basically that means we need to connect the invert 
    //of the input [i.e. ~in] to the output, we can make this connection via the assign statment

	assign out = ~in;   //on a single bit we can use either ~(bitwise not) or !(logical not) doesn't matter, but if 'in' and 'out' 
                        //were a vector we would use '~', we'll look at vectors later! 

endmodule
