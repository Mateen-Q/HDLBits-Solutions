module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 


    //on solving the Karnaugh Map for a SOP equation we are left with the following equation that we 
    //assign to out
    
    assign out = a | (c)&(~b);  //using SOP form;


    
    /*
    
    alternatively, using the POS form we will have the equation :
    
    assign out = (a|(~b))&(c|a)&(c|(~d));

    and it will yeild the same results as the SOP equation!

    */
    
  

endmodule
