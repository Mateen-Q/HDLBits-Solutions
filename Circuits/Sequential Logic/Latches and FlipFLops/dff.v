module top_module (
    input clk,    // Clocks are used in sequential circuits
    input d,
    output reg q );//


    //whenever the possitive edge of the clock hits, d is assigned to q
    always@(posedge clk) q <= d;  //we always perform non blocking assignment inside clocked always blocks

endmodule
