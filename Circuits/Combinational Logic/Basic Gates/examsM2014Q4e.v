module top_module (
    input in1,
    input in2,
    output out);
    
    assign out = ~(in1|in2); //the circuit shows a NOR gate with inputs in1 and in2 and output out
                            //so we peform nor between (in1 and in2) and assign to out

endmodule
