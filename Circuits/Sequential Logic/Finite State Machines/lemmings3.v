module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    parameter Left = 0, Right = 1, Fall_left = 2, Fall_right = 3, Dig_left = 4, Dig_right = 5;  //define 6 states
    reg [2:0] state,next_state;  //define a 3 bit vector to hold these states
    
    always@(*) begin
        case(state)
            Left: next_state <= ground?(dig?Dig_left:(bump_left?Right:Left)):Fall_left; 
            //if lemming is walking left and ground is still there then we check for any dig commands,
            //if no dig command is encountered then we check for bump(because dig takes precedence over bump so we checked that first), 
            //then we handle the bump case like previous 2 cases, if there is no ground then lemming goes into fall left state

            
            Right: next_state <= ground?(dig?Dig_right:(bump_right?Left:Right)):Fall_right;

            //if lemming is walking right and ground is still there then we check for any dig commands,
            //if no dig command is encountered then we check for bump(because dig takes precedence over bump so we checked that first), 
            //then we handle the bump case like previous 2 cases, if there is no ground then lemming goes into fall right state

            Fall_left: next_state <= ground?Left:Fall_left; //if lemming is in fall left then it will stay in fall left until ground is encountered, then it goes to left state
            Fall_right: next_state <= ground?Right:Fall_right; //if lemming is in fall right then it will stay in fall right until ground is encountered, then it goes to right state
            Dig_right: next_state <= ground?Dig_right:Fall_right; //lemming will dig until it reaches no ground state and falls
            Dig_left: next_state <= ground?Dig_left:Fall_left; //lemming will dig unti it reaches no ground state and falls
        endcase
    end
    
    always@(posedge clk or posedge areset) begin
        if(areset) state <= Left;
        else state <= next_state;
    end
    
    assign walk_left = (state == Left);
    assign walk_right = (state == Right);
    assign aaah = (state == Fall_left) || (state == Fall_right); //lemming will shout if its falling
    assign digging = (state == Dig_right) || (state == Dig_left); //lemming will be digging if its in dig right or dig left state

endmodule
