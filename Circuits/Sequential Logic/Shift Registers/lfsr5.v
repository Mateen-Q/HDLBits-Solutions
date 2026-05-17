module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output [4:0] q
); 
    
    always@(posedge clk)begin
        if(reset) q<= 5'h1;   //if reset then the register gets set to 5'h1
        else begin
            q <= {q[0]^1'b0,q[4], q[3]^q[0], q[2], q[1]};

            /* we can see from the given diagram that 

            q[4] gets q[0] XOR 0, but we know X XOR 0 is just X so we can simply write q[4] gets q[0]
            q[3] gets q[4] as it is 
            q[2] gets q[3] XOR q[0]
            q[1] gets q[2] as it is
            q[0] gets q[1] as it is

            so we just simply use the concatenation operator to write :

            q <= {q[0]^1'b0,q[4], q[3]^q[0], q[2], q[1]};

            which essentially if we expand the q on the left just means : 

            {q[4],q[3],q[2],q[1],q[0]} <= {q[0]^1'b0,q[4], q[3]^q[0], q[2], q[1]}

            which is exactly what we are trying to do!
            */

        end
    end

endmodule
