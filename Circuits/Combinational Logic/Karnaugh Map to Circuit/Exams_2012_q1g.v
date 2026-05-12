module top_module (
    input [4:1] x,
    output f
); 

//on solving the Karnaugh Map for a SOP equation we are left with the following equation that we 
//assign to f: 
    
    assign f = (~x[4])&(~x[2]) | x[3]&(~x[1]) | x[3]&x[4]&x[2];

endmodule
