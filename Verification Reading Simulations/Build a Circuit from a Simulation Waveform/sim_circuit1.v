module top_module (
    input a,
    input b,
    output q );

    //to solve these circuits we need to analyze the given waveform and need to plot the output input in a table
    //for the given wave form, 
    // at a=0 and b=0, output = 0
    // at a=1 and b=0, output = 0
    // at a=0 and b=1, output = 0
    // at a=1 and b=1, output = 1

    //we can see that this is the behaviour of an and gate.

    assign q = a&b;

endmodule
