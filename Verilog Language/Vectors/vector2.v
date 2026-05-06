module top_module( 
    input [31:0] in,
    output [31:0] out );


    /*

    - so basically we need to mirror the vector by bytes(group of 8 bits)
    - so essentially what we need to do is 1st byte of in will be 4th byte of out
    - 2nd byte of in will be assigned to 3rd byte of out
    - 3rd byte of in will be assigned to 2nd byte of out
    - 4th byte of in will be assigned to 1st byte of out
    
    */

    assign out = {in[7:0]  ,  in[15:8],  in[23:16],  in[31:24]};
    //              ^            ^           ^           ^
    //              |            |           |           |
    //           [1st byte] [2nd byte]  [3rd byte]  [4th byte] 

    //and out is already declared as ' [31:0] out '
    //so automatically out[31:24] is being assigned by in[7:0]  
    //so automatically out[23:16] is being assigned by in[15:8]  
    //so automatically out[15:8] is being assigned by in[23:16]  
    //so automatically out[7:0] is being assigned by in[31:24]  

endmodule
