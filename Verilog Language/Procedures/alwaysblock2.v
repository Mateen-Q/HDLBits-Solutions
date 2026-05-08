module top_module(
    input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff   );
    
    assign out_assign = a^b;   //a XOR b using the assign statment
    
    always@(*) out_always_comb = a^b; //a XOR b using the combinational always statement
    
    always@(posedge clk) out_always_ff = a^b;  //a^b using clocked always statement

endmodule
