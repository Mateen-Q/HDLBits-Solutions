//solution for the title "Simple Wire"


module top_module( input in, output out );
 assign out = in;   //we used the assign statments to drive the input(in) to the output(out)
                    //the variable on the left(out) is the one being assigned or driven
                    //the variable on the right(in) is the one driving

//assign is used for continous assignment that means as soon as in changes, out will change too!

endmodule
