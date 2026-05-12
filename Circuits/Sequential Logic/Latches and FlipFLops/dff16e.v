module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    
    always@(posedge clk) begin    
        if(~resetn) q <= 0;     //because reset is active low i.e. circuit resets when reset = 0; so
                                // ~0 = 1, therefore when  resetn goes low, q becomes 0.

        else begin              //else handles the rest of the cases incase a +ve edge of clock comes
            if(byteena[1]) q[15:8] <= d[15:8];  //if byteena[1] is high, then upperbyte is written
            if(byteena[0]) q[7:0] <= d[7:0];   //if byteena[0] is high then lower byte is written
        end
    end

endmodule
