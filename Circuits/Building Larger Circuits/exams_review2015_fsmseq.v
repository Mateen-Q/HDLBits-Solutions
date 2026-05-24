module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    
    /*
    we need to search for the sequenc 1101 so we will create a FSM with the following state
    
    IDLE -> i.e. the first '1' hasn't been found yet
    S1 -> state when first '1' is found
    S11 -> state when consecutively 2 1's are found
    S110 -> state when consecutively 110 is found
    S1101 -> state when 1101 is finally found
    
    */
    
    parameter IDLE = 3'b0,
    S1 = 3'b001,
    S11 = 3'b010,
    S110 = 3'b011,
    S1101 = 3'b100;
    
    reg [2:0] cs,ns;
    
    //state transition logic
    always@(*) begin
        case(cs)
            IDLE: ns = data?S1:IDLE;  //we stay in IDLE state as long as we don't find a 1, when we find a 1 we go to S1
            S1: ns = data?S11:IDLE; //once in S1 if we find a 1 again we go to S1, if we find 0, we go back to IDLE
            S11: ns = data?S11:S110; //once in S11 if we find a 1 again we stay in S1, else if we find 0, we go to S110
            S110: ns = data?S1101:IDLE; //once in S110 we now need a 1 to complete seq, if we get 1, we go to S1101 else if we get a 0 again, we're back to IDLE
            S1101: ns = S1101;            //once in S1101 we need to be stuck there until reset puts ns to IDLE!   
            default: ns = IDLE;
        endcase
    end
    
    always@(posedge clk) begin
        if(reset) cs <= IDLE;
        else cs <= ns;
    end
    
    assign start_shifting = (cs==S1101);  //start_shifting is only set high when we are in sequence found state!
    

endmodule
