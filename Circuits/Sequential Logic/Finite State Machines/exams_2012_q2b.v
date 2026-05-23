module top_module (
    input [5:0] y,
    input w,
    output Y1,
    output Y3
);
    
    /*
    because given question uses a one hot representation, every Bit represents a state
    
    y[0] = A
    y[1] = B
    y[2] = C
    y[3] = D
    y[4] = E
    y[5] = F
    
    Y1 represents B
    Y3 represents D
    
    there is only 1 way to reach B, when you have w = 1 and you are currently in state A
   
    so Y1 will only be active when next state is B and that will only happen when above condition is satisfied
    
    so Y1 = (~w)&y[0];
    
    
    
    there are 4 ways to reach state D, 
    1) w = 0 on state B
    2) w = 0 on state C
    3) w = 0 on state E
    4) w = 0 on state F
    
    so Ye will be active when we are in state D and that only happens on any of the 4 above conditions
    
    so Y3 = (~w)&(y[1] | y[2] | y[4] | y[5])
    */
    
    assign Y1 = (w)&y[0];
    assign Y3 = (~w)&(y[1] | y[2] | y[4] | y[5]);
    
    

endmodule
