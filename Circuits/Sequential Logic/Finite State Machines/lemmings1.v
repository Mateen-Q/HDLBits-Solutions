module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right);  

    parameter LEFT=0, RIGHT=1; //defined 2 states of the lemming
    reg state, next_state;  //defined 2 registers to hold current and next state

    always @(*) begin
        case(state) 
            LEFT: next_state <= bump_left?RIGHT:LEFT;  //if lemming is walking left and encounters a bump_left then it goes to right else stays left
            RIGHT: next_state <= bump_right?LEFT:RIGHT; //if lemming is walking right and encounters a bump_right then it goes to left else stays right
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset) state <= LEFT;  //on reset, fresh lemmings walk left
        else state <= next_state;  //else state will depend on next state determined earlier
    end
    
    assign walk_left = ~state;  //lemming walks left when state is LEFT(0)
    assign walk_right = state;  //lemming walks rigth when state is RIGHT(1)
endmodule
