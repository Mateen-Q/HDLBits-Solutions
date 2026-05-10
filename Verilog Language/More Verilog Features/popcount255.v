module top_module( 
    input [254:0] in,
    output reg [7:0] out );  //we need to declare output as reg because we will incrementing
                            //it as we find more and more 1's in the 'in' vector.
    
    
    always@(*) begin

        out = 8'b0;     //initialize count as 0 initially before counting

        for(int i = 0;i<$bits(in);i++) begin  //running a loop from 0 to 254
            out = out + in[i];       //if the bit in[i] is 1, it will increment out, if its 
                                     //0 nothing will change for out
        end
        
    end

endmodule
