module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    

    //whenver we have alternate 1's and 0's in a karnaugh map arranged in a chessboard fashion
    //starting with top left corner being 0, the karnaugh map is implying a XOR function amongst all the variables

    //simillarly if we have alternate 1's and 0's in a K-map arranged in a cheesboard fashion
    //BUT starting with top left corner being 1, the K-map is implying a XNOR amongst all the variables


    //in our question our pattern starts with topleft corner being 0, so XOR is happening here.


    assign out = a^b^c^d; //assigned out with XOR amongst all variables

endmodule
