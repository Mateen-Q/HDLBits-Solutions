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
    
    parameter Left = 3'b0, Right = 3'b001, Fall_left = 3'b010, Fall_right = 3'b011, Dig_left = 3'b100, Dig_right = 3'b101,ded = 3'b110;  //define 6 states
    reg [2:0] state,next_state;  //define a 3 bit vector to hold these states
    reg [8:0] count;
    
    always@(*) begin
        case(state)
            Left: next_state = ground?(dig?Dig_left:(bump_left?Right:Left)):Fall_left; 
            //if lemming is walking left and ground is still there then we check for any dig commands,
            //if no dig command is encountered then we check for bump(because dig takes precedence over bump so we checked that first), 
            //then we handle the bump case like previous 2 cases, if there is no ground then lemming goes into fall left state

            
            Right: next_state = ground?(dig?Dig_right:(bump_right?Left:Right)):Fall_right;

            //if lemming is walking right and ground is still there then we check for any dig commands,
            //if no dig command is encountered then we check for bump(because dig takes precedence over bump so we checked that first), 
            //then we handle the bump case like previous 2 cases, if there is no ground then lemming goes into fall right state

            Fall_left: next_state = ground?((count > 19)?ded:Left):Fall_left; //if lemming is in fall left then it will stay in fall left until ground is encountered, 
            //then we check how long it fell for, if count >19 then lemming dies, if not then lemming starts walking to left again
            Fall_right: next_state = ground?((count > 19)?ded:Right):Fall_right; //if lemming is in fall right then it will stay in fall right until ground is encountered,
            //then we check how long it fell for, if count > 19 then lemming dies, else it keeps walking to the right
            Dig_right: next_state = ground?Dig_right:Fall_right; //lemming will dig until it reaches no ground state and falls
            Dig_left: next_state = ground?Dig_left:Fall_left; //lemming will dig unti it reaches no ground state and falls
            ded: next_state = ded;  //once lemming dies it stays dead
        endcase
    end
    
    always@(posedge clk or posedge areset) begin
   
        if(areset) begin 
            state <= Left;
        end
        else if(state == Fall_left || state == Fall_right) begin
                count <= count + 1'b1;   //if its falling we keep counting
                state <= next_state;  //and we keep progressing to next state
        end 
        else begin
                state <= next_state; //otherwise if lemming stops falling we just go to next state
                count <= 0;  //and reset the counter to 0
        end
    end
    
    assign walk_left = (state == Left);
    assign walk_right = (state == Right);
    assign aaah = (state == Fall_left) || (state == Fall_right); //lemming will shout if its falling
    assign digging = (state == Dig_right) || (state == Dig_left); //lemming will be digging if its in dig right or dig left state
    

endmodule
