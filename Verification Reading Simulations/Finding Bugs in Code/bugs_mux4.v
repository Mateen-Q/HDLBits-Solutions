module top_module (
    input [1:0] sel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] out  );

    wire [7:0] mux0, mux1;  //declared given wires as 8 bit wires instead of default single bit 

    //changed instance names to m0,m1,m2 because wires had names mux0,mux1, can't have same names for wires and instances!

    mux2 m0 ( sel[0],    a,    b, mux0 );   //output of first MUX is dependent on sel[0]
    mux2 m1 ( sel[0],    c,    d, mux1 );   //output of second MUX is also dependent on sel[0]
    mux2 m2 ( sel[1], mux0, mux1,  out );   //sel[1] decides the final output

endmodule
