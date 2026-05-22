module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
    parameter l= 0,r = 1,fr = 2, fl = 3; //define 4 states, left,right,fall right and fall left
    reg [1:0] state,next_state;  //define 2 variables to hold current and next states
    
    always@(*) begin
        case(state)
            l: next_state <= ground?(bump_left?r:l):fl;  //when state is left and ground is present, check for bumps, else if ground vanished, go into state fall left
            r: next_state <= ground?(bump_right?l:r):fr; //when state is right and ground is present, check for bumps, else if ground vanished, go into state fall right
            fr: next_state <= ground?r:fr; //if you're falling right and then ground appears you go back to walking right
            fl: next_state <= ground?l:fl; //if you're falling left and then ground appears you go back to walking left 
        endcase
    end
    
    always@(posedge clk or posedge areset) begin
        if(areset) state <= l;
        else state <= next_state;
    end
    
    assign walk_left = (state == l);
    assign walk_right = (state == r);
    assign aaah = (state == fr || state == fl);  //lemming will scream when its falling be it right or left
   

endmodule
