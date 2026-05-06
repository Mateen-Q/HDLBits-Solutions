module top_module( 
    input [7:0] in,
    output [7:0] out
);


    /*
    
    - problem requires us to reverse the bit ordering of in and assign it to out
    - we can just simply do out[7:0] = in[0:7] because verilog does not allow bit reversal
    - we can use concatenation operator to reduce the number of lines of code

    - out is declared as [7:0] out   so out[7] is MSB and out[0] is LSB
    - we need to assign out[7] to in[0] for reversal 
    - so we will concatenate bits of 'in' in the order 0,1,2,3,4,5,6,7;
        {in[0],in[1],in[2],in[3],in[4],in[5],in[6],in[7]}

    - this way out[7] will be assigned to in[0] because out is declared as [7:0] out
    - so first assignment in[0] goes to MSB of out i.e. out[7]
    - essentially out looks like : {out[7],out[6],out[5],out[4],out[3],out[2],out[1],out[0]}
    
    */
    
    assign out = {in[0],in[1],in[2],in[3],in[4],in[5],in[6],in[7]}; 

endmodule
