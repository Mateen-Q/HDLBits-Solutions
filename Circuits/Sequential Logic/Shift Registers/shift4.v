module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q);
    
    always@(posedge clk or posedge areset) begin   //because asynchronous reset so we include it in the sensitivity list
        if(areset) q <= 4'b0;   //if reset condition is true, set all bits of q to 0
        else if(load) q <= data;  //if there is a load then the bits become load instead
        else if(ena) q <= {1'b0,q[3],q[2],q[1]};  //if enable then data shifts by 1 bit, MSB becomes 0 
                                                  //q[2] becomes q[3], q[1] becomes q[2], q[0] becomes q[1] and the 
                                                  //original value of q[3] just disappears.
        else q<=q;
    end

endmodule
