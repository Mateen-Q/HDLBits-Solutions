module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);

    //define the given states
    
    parameter s0 = 3'd0,   
    s1 = 3'd1,
    s2 = 3'd2,
    s3 = 3'd3,
    s4 = 3'd4;
    
    reg [2:0] cs,ns;   //define 2 registers to hold current state and next state
    
    always@(*)begin

        //depending on the state transition table assign state transition
        case(cs)
            s0: ns = x?s1:s0;   
            s1: ns = x?s4:s1;
            s2: ns = x?s1:s2;
            s3: ns = x?s2:s1;
            s4: ns = x?s4:s3;
        endcase
    end
    
    always@(posedge clk) begin
        if(reset) cs <= s0;
        else cs <= ns;
    end
    
    assign z = (cs == s3)||(cs == s4);   //based on the given transition table, output is 1 only when state is s3 or s4

endmodule
