module top_module(
    input a,
    input b,
    input c,
    output out  ); 
    

    //to solve these problems you need to know how to solve a kmap or reduce a given boolean 
    //expression into a SOP or POS form then into a K-map and then to a simplified boolean expression.

    //you can learn how to solve K-maps using neso academy's videos on K-map on youtube for free. 

    //on solving the given K-map in the given question we are left with the reduced equation a+b+c
    //or a|b|c 

    assign out = a|b|c;  

endmodule
