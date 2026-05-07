module top_module ( input clk, input d, output q );


/*

    - from the given circuit in the problem we can tell we need to instantiate my_dff thrice
    - my_dff is declared as ' module my_dff(input clk, input d, output q) ' 
    - to avoid confusion with ordering, we will use name based connections when instantiation modules
    - we can also see we have 2 intermediate wires, one between 1st and 2nd flipflop and one between 2nd and 3rd
    - to deal with this instead of declared 2 seperate wires we will just declare a 2 bit wire and use its bits
    - we can declare a wire iw(intermediate wire) of 2 bits
    - iw[1] will be between ff1 and ff2, and iw[0] will be between ff2 and ff3
  
*/
    
    wire [1:0] iw;  //here we declared a 2 bit wire iw to deal with intermediate connections
    
    my_dff d1(.clk(clk), .d(d), .q(iw[1]));  //this is the first instantiation, we can see
                                             //first ff is directly connected to input d and clk and outputs 
                                             //its value q into iw[1] so we connect them accordingly

    my_dff d2(.clk(clk), .d(iw[1]), .q(iw[0])); //ff2 takes output of ff1 (iw[1]) and makes its input(d)
                                                //then it generates an output q and feeds it to iw[0] so we connect accordingly
                                                //clk remains same for all, so we leave it at that
    
    my_dff d3(.clk(clk), .d(iw[0]), .q(q));    //connections of the last ff

endmodule
