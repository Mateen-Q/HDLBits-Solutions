module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );


    /*
    
    - problem requires us to concatenate 5 vectors of 6 bit(making total 30 bit) and 2 bits '11'
    - all of that will then be 32 bits
    - this 32 bit is to be assigned to a combination of 4 vectors of 8 bit(making total 32 bit)
    - concatenation of 4 vectors of 8 bit would be : 
                    {w,x,y,z}
    
    - concatenation of 5 vectors of 6 bit and 2 extra bits would be : 
                    {a,b,c,d,e,f,2'b11}    **here 2b'11 specifies that the value is 2 bit long and in binary and its value is 11


    - next step is fairly simple, we just assign the 30+2 bit vector to the concatenated 32 bit vector
         {w,x,y,z} = {a,b,c,d,e,f,2'b11}
    
    */

    assign {w,x,y,z} = {a,b,c,d,e,f,2'b11};  // here is the assign statment for the last step

endmodule
