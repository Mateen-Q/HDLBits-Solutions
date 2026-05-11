module top_module (
    input in1,
    input in2,
    input in3,
    output out);
    
    wire w;   //declaring an intermediate wire w so we can wire the output of first 
              //gate(XNOR) to second gate(XOR)

    assign w =~(in1^in2);  //the first gate performs XNOR between in1 and in2 and the output goes 
                            //to the intermediate wire w

    assign out = in3^w; //second gate performs XOR between in3 and w;

endmodule
