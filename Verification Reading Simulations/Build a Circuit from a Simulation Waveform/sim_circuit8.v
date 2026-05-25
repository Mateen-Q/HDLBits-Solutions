module top_module (
    input clock,
    input a,
    output reg p,
    output q );


    //on observation of the given waveform, we can see 3 things:
    //      1) p is same as a whenever clock is high, when its low, it holds its value when clock is low
    //      2) if we hit a negedge of clock and along with that a is low, output of q becomes 0
    //      3) if we hit a nededge of clock and along with that a is high, output of q becomes 1
    
    always@(*)begin
        if(clock) p = a;
    end
    
    always@(negedge clock) begin
        if(a) q = 1'b1;
        else q = 1'b0;
    end

endmodule
