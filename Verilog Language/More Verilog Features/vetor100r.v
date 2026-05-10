module top_module( 
    input [99:0] in,
    output [99:0] out
);


/*
for this problem we will use a for loop because manually changing order by assigning:

out[99] = in[0]
out[98] = in[1]
....
....
....

would take a lot of time and would be inefficient code so instead we will use a for
loop inside a combinational always block;
*/

    always@(*) begin       //declaring a combinational always block, 'begin... end'
                           //define a code block kind of like {} in java defining a code block
    
        for(int i = 0;i<=99;i++) begin    //here we directly ran loop till 99 but we can
                                          //also use $bits(out) function which gives the
                                          //length of a vector = 100 in our case so it would look like:
                                          // for (int i=0;i<$bits(out);i++)	

            out[99-i] = in[i];            //performing the bit reversal, assiging first bits of in
                                          //to last bits of out
        
        end
        
    end
            
endmodule
