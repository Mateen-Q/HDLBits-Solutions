module top_module( 
    input a,b,c,
    output w,x,y,z );

    //make connections through assign statements using the given diagram

    assign w = a;  //in the diagram output(w) is connected to input(a) so we assign output(w)[the one being driven] to input(a)[the one driving the output]
    assign x = b;  //in the diagram output(x) is connected to input(b) so we assign output(x)[the one being driven] to input(b)[the one driving the output]
    assign y = b;  //in the diagram output(y) is connected to input(b) so we assign output(y)[the one being driven] to input(b)[the one driving the output]
    assign z = c;  //in the diagram output(z) is connected to input(c) so we assign output(z)[the one being driven] to input(c)[the one driving the output]
endmodule
