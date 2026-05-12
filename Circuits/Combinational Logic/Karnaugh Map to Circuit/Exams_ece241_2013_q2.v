module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
    
    
);
    //on solving the Karnaugh Map for a SOP equation we are left with the following equation that we 
    //assign to out_sop

    assign out_sop = c&d | (~a)&(~b)&c;


    //on solving the Karnaugh Map for a POS equation we are left with the following equation that we 
    //assign to out_pos

    assign out_pos = c& ((~b)|d) & ((~a)|d);

endmodule
