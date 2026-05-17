module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 
    
    reg [31:0] q_next; //lets create another variable to store our shifted solution
    
    
    always@(*) begin
        q_next = {q[0],q[31:1]};  //lets first shift everything once

//tap at n means q[n-1] gets q[n] XOR q[0]
//tap at 32 does not matter because 32 is the last Resgister and gets q[0] anyways.

        q_next[21] = q[22]^q[0]; //tap at 22 means q[21] gets xor of q[22] and q[0]
        q_next[1] = q[2]^q[0];   //tap at 2 means q[1] gets xor of q[2] and q[0]
        q_next[0] = q[1]^q[0];   //tap at 1 means q[0] gets xor of q[1] and q[0]
    end
    always@(posedge clk) begin
        if(reset) q <= 1'b1;     //on reset lfsr are set to a simple 1'b1
        else q <= q_next;     //if no reset is requested then q gets the next value of q
    end

endmodule
