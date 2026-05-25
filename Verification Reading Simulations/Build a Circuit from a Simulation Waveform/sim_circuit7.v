module top_module (
    input clk,
    input a,
    output q );

    //I'll solve this using an FSM simply because I want to.
    
    parameter s0 = 1'b0, s1= 1'b1;  //defined 2 states s0 and s1
    reg cs,ns; //defined 2 registers to hold current state and next state
    
    always@(*) begin
        case(cs)
            s0: ns = a?s1:s0;  //when in s0, we stay in s0 until a goes to 1, in state s0, q = 1
            s1: ns = a?s1:s0;  //when in s1 we stay in s1 as long as a is one, in state s1, q = 0
        endcase
    end
    
    always@(posedge clk)begin
        cs <= ns;
    end
    
    assign q = (cs == s0);  //q is only high when we are in state s0.
    

endmodule


/*

there is also a simple alternative solution: 

always@(posedge clk) begin
    q = ~a;
end

*/