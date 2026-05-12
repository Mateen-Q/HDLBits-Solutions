module top_module (
    input clk,
    input d, 
    input r,   // synchronous reset
    output q);

    //the solution is same as ' dffr.v ' please refer to it for your convenience.
    
    always@(posedge clk) begin
        if(r) q <=0;
        else q<=d;
    end

endmodule
