module top_module(
    input clk,
    input in,
    input areset,
    output out); 


    //this problem is the same as fsm3 except with a synchronous reset rather than asynchronous

    reg [1:0] cs,ns;  //define 2 registers of state-sizes one for holding current state and one for holding next state
    parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;  //define state codes
    
    always@(*) begin
        case(cs) 
            A: ns <= in?B:A;  //if current state(cs) is A, and in = 1 then next state(ns) is B else if in = 0, ns is A
            B: ns <= in?B:C;  //if current state(cs) is B, and in = 1 then next state(ns) is B else if in = 0, ns is C
            C: ns <= in?D:A;  //if current state(cs) is C, and in = 1 then next state(ns) is D else if in = 0, ns is A
            D: ns <= in?B:C;  //if current state(cs) is D, and in = 1 then next state(ns) is B else if in = 0, ns is C
        endcase
    end
    

    always@(posedge clk or posedge areset) begin
        if(areset) cs <= A;  //if reset is hit then state goes to A
        else cs <= ns;  //else cs gets next state
    end

    always@(*) begin
        case(cs)    //dependin on current state the output is determined
            A: out <= 1'b0;    //if cs = A then output is 0
            B: out <= 1'b0;    //if cs = B then output is 0
            C: out <= 1'b0;    //if cs = B then output is 0
            D: out <= 1'b1;    //if cs = B then output is 1
        endcase
    end

endmodule
