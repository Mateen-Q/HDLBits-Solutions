module top_module (
    input d, 
    input ena,
    output q);
    
    assign q = ena?d:q;   //incase enable is high, we will write d to q, otherwise q will remain q
    //this creates a latch because incase enable is not high, q will be routed back to q.

endmodule
