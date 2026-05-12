module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);
    
    always@(posedge clk) q <=d; //we assign all 8 bits of d to all 8 bits of q at once
    //always use non blocking assignment inside a clocked always block

endmodule
