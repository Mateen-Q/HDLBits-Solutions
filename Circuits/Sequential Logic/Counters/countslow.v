module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    
    always@(posedge clk) begin    //clocked always block

        if(reset) q <= 4'd0;   //check to see if reset signal is received, if yes then we reset!

        else if(slowena) begin       //if slowena is active then only we will increment

            if(q == 4'd9) q<= 4'b0;    //if q has hit 9 then it should go back to 0
            else q <= q+1'b1;         //if q has not hit 9 then it should increment by 1.
        end
        else q <= q;     //if neither reset nor slowena is active, q won't roll over and stay as it is.
    end

endmodule
