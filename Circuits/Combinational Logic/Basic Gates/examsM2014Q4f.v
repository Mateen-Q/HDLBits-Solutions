module top_module (
    input in1,
    input in2,
    output out);
    
    assign out = in1&(~in2);  //the circuit shows AND operation between in1 and invert of in2

endmodule
