module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);
    
    always@(posedge clk) begin
        
        if(reset) q <= 0;         //if reset is active then we set the counter to 0

        else q <= q +1'b1;        //else if reset is not hit we increment the counter until its 15 then it rolls over automatically
                                  //because 4 bits can't store more than 15
    end

endmodule
