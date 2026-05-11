module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
    assign f = (~x3)&(x2)&(~x1) | (~x3)&(x2)&(x1) | (x3)&(~x2)&(x1) | (x3)&(x2)&(x1);
    

    //so basically we create a sum of products form, to create that we look at the truth table
    //and we find combinations where output(f) is 1, and then we look at inputs that cause
    //that output to be one, for example the very first case of output f = 1 is at line 3,
    //where x3 = 0, x2 = 1, x1 = 0; to make a SOP term of this, we negate the variables
    //that are at 0 and leave the variables at 1 as it is, so in the 3rd line case, we will
    //negate x3 and x1, leave x2 as it is and the SOP term will be : (~x3)&(x2)&(~x1)

    //simmilarly we can find all the SOP terms for the lines where output f = 1;
    //once we find all SOP terms we simply perform OR between all SOP terms and assign to output(f)


    //these SOP terms aren't the most efficient, they can be simplified a lot using K-maps

endmodule
