module top_module (
    input clk,
    input d, 
    input ar,   // asynchronous reset
    output q);

    //this solution is same as ' dff8ar.v ' please refer it!
    
    always@(posedge clk or posedge ar) begin
        if(ar) q <= 0;
        else q <=d;
    end

endmodule
