module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter A=2'b00, B=2'b01, C=2'b10, D=2'b11; //defined states and their binary codes
    
	
    always@(*) begin
        case(state)      //based on the given transition table we define 4 cases
            A: next_state <= in?B:A;  //if current state is A and in is 1 then next state is B else A when in = 0 as shown the rule in the transition table
            B: next_state <= in?B:C;  //if current state is B and in is 1 then next state is B else C when in = 0 as shown the rule in the transition table
            C: next_state <= in?D:A;  //if current state is C and in is 1 then next state is D else A when in = 0 as shown the rule in the transition table
            D: next_state <= in?B:C;  //if current state is D and in is 1 then next state is B else C when in = 0 as shown the rule in the transition table
        endcase
    end

    assign out = (state == D)?1'b1:1'b0; //from the table we can see output is only 1 when state is D else its 0

    //alternative and more defined way to assing out would be : 

    /*
    
    always@(*)begin
        case(state)
            A: out <= 1'b0;
            B: out <= 1'b0;
            C: out <= 1'b0;
            D: out <= 1'b1;
        endcase
    end
    
    */

endmodule
