module top_module(
    input clk,
    input reset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    //this solution is exactly like fsm2 except we have a synchronous reset in this case so the only difference will be in sensitivity list

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        case(state)
            OFF: next_state <= j?ON:OFF;
            ON: next_state <= k?OFF:ON;
        endcase
    end

    always @(posedge clk) begin //in fsm2 we checked for a +ve edge of both clk and areset, here only clock
        if(reset) state <= OFF; //then we check if reset is high while we are on a posedge of clock, if yes then we set state to OFF.
        else state <= next_state;
    end

    assign out = state?1:0;

endmodule
