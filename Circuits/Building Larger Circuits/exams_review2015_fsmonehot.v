module top_module(
    input d,
    input done_counting,
    input ack,
    input [9:0] state,    // 10-bit one-hot current state
    output B3_next,
    output S_next,
    output S1_next,
    output Count_next,
    output Wait_next,
    output done,
    output counting,
    output shift_ena
); //

    // You may use these parameters to access state bits using e.g., state[B2] instead of state[6].
    parameter S=0, S1=1, S11=2, S110=3, B0=4, B1=5, B2=6, B3=7, Count=8, Wait=9;


    /*
    
    like all previous one hot FSM problem, this problem is no different, all we need to do is 
    examine ways of reaching any specific state to determine its next state.

    for example, there are 4 ways to reach S
        1) when you are already in state S(state[S]) and you get input d = 0, you stay in state S
        2) when you are in state S110 (state[S110]) and you get intput d = 0;
        3) when you are in wait state (state[Wait]) and you get input ack = 1
        4) when you are in state S1 (state[S110]) and you get input d = 0;

    so, S_next will be assigned the OR of all these possible cases
    so, 
            S_next = state[S]&(~d) | state[S110]&(~d) | state[Wait]&ack | state[S1]&(~d);

    Similarly, I urge you to look at the rest of the states and determine their logic and then assign it to their next state
 
    */


    //assigned by determining equations by inspection
    
    assign S_next = state[S]&(~d) | state[S110]&(~d) | state[Wait]&ack | state[S1]&(~d);
    assign S1_next = state[S]&d;
    assign B3_next = state[B2];
    assign Count_next = state[B3] | (~done_counting)&state[Count];
    assign Wait_next = state[Wait]&(~ack) | state[Count]&(done_counting);
    assign done = state[Wait];      //done will be high when we are in state[Wait]
    assign counting = state[Count];  //counting will be high when we are in state[Count]
    assign shift_ena = state[B3] | state[B2] | state[B1] | state[B0];   //shift_ena will be high when we are in B0,B1,B2 or B3 state
    


endmodule
