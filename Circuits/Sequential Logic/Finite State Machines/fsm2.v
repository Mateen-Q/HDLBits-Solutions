module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1;   //defined states 
    reg state, next_state;   //defined 2 registers for current and next state

    always @(*) begin
        case(state)
            OFF: next_state <= j?ON:OFF;  //if currently in OFF state and j = 1 then we go to ON else we stay on OFF
            ON: next_state <= k?OFF:ON;  //if currently in ON state and k = 1 then we go to OFF else we stay on ON
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset) state <= OFF;
        else state <= next_state;
    end

    assign out = state?1:0;

endmodule
