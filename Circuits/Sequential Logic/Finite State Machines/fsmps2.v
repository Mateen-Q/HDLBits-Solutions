module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

    parameter N = 2'b00, B1 = 2'b01,B2 = 2'b10,B3 = 2'b11; //define states, No start byte encountered, first byte, second byte and 3rd byte
    reg [1:0] cs,ns;
    
    always@(*) begin
        case(cs)
            N: ns <= in[3]?B1:N;  //if No byte is yet encountered, check in[3], if its 1, we go into state B1
            B1: ns <= B2;    //from state B1 we only go to state B2
            B2: ns <= B3;    //from state B2 we only go to state B3
            B3: ns <= in[3]?B1:N;  //on B3 we again check for start byte, if found we go to B1 again else to Not found(N) again
        endcase
    end

    always@(posedge clk) begin
        if(reset) cs <= N;   //reset takes system to not found state
        else cs <= ns;   //else to next state
    end
 
    assign done = (cs == B3)?1:0;  //when 3rd byte is found, we output done=1 else 0

endmodule
