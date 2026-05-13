module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
    
    always@(posedge clk)begin   //increments will happen every possitive egde, once every clock cycle
        if(reset || q == 4'd9) q <=0; //here we have 2 conditions for going to 0, either we hit 9 or reset
        else q <= q+1;  //if we aren't at 9 or have a reset signal we will keep incrementing
    end

endmodule
