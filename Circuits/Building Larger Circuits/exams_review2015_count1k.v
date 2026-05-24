module top_module (
    input clk,
    input reset,
    output reg [9:0] q);   //remember to declare q as register so it can hold its value when we increment it
    
    always@(posedge clk) begin
        if(reset || q == 10'd999) q <= 0;  //on reset or if we hit 999, q goes to 0
        else q <= q+1'b1;   //else we increment q by 1 every clock cycle
    end

endmodule
