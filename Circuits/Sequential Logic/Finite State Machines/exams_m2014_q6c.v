module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4);


    /*
    
    
    by one hot encoding,
    
    y[1] = A
    y[2] = B
    y[3] = C
    y[4] = D
    y[5] = E
    y[6] = F
  

    */
    
    assign Y4 = w&(y[2]|y[3]|y[5]|y[6]); //to reach y[4] or state D in the next state there are 4 ways, 
                                            //when w = 1 and previous state was B
                                            //when w = 1 and previous state was C
                                            //when w = 1 and previous state was E
                                            //when w = 1 and previous state was F
                                        // so y[4] = w&y[2] | w&y[3] | w&y[5] | w &y[6]
                                        //we've written simply by taking w common
    assign Y2 = (~w)&y[1];   //there is only one way to reach y[2] or state B, through state A(y[1]) when w = 1;

endmodule
