module top_module(
    input in,
    input [9:0] state,
    output [9:0] next_state,
    output out1,
    output out2);


    /*

    first of all, in one hot encoding, a single specific bit is 1 for a specific state and rest are 0
    s0 - 0000000001
    s1 - 0000000010
    s2 - 0000000100
    s3 - 0000001000
    s4 - 0000010000
    s5 - 0000100000
    s6 - 0001000000
    s7 - 0010000000
    s8 - 0100000000
    s9 - 1000000000
    
    to solve this question you need to determine when any state is acheived, for example,
    
    s0 is acheived in following circumstances : 
        1) its at s4 and receives input 0 (i.e. state[4]&(~in))   //because for s4, only state[4] would be high
        2) its at s3 and receives input 0 (i.e. state[3]&(~in)) 
        3) its at s2 and receives input 0 (i.e. state[2]&(~in)) 
        4) its at s1 and receives input 0 (i.e. state[1]&(~in)) 
        5) its at s0 and receives input 0 (i.e. state[0]&(~in)) 
        6) its at s9 and receives input 0 (i.e. state[9]&(~in)) 
        7) its at s8 and receives input 0 (i.e. state[8]&(~in)) 
        8) its at s7 and receives input 0 (i.e. state[7]&(~in)) 

    so next_state[0] will be an OR amongst all these cases

    s1 is acheived in following cases: 
        1) its at s0 and receive input 1
        2) its at s8 and receive input 1
        3) its at s9 and receive input 1
    
    so next_state[1] = (in)&state[0] || (in)&state[8] || (in)&state[9];

    s2 is acheived only in one case, when its s1 and input = 1 is received
    s3 is acheived only in one case, when its s2 and input = 1 is received
    s4 is acheived only in one case, when its s3 and input = 1 is received
    s5 is acheived only in one case, when its s4 and input = 1 is received
    s6 is acheived only in one case, when its s5 and input = 1 is received
    s7 is acheived when its s6 and input = 1 is received or its already s7 and input 1 is received
    s8 is acheived only in one case, when its s5 and input = 0 is received
    s9 is acheived only in one case, when its s6 and input = 0 is received

    so we can make equations for all these cases!

    
    */
    
    assign next_state[0] = (~in)&state[4] || (~in)&state[3] || (~in)&state[2] ||(~in)&state[1] ||(~in)&state[0] || (~in)&state[8] 
        || (~in)&state[7] || (~in)&state[9];
    
    assign next_state[1] = (in)&state[0] || (in)&state[8] || (in)&state[9];
    assign next_state[2] = in&state[1];
    assign next_state[3] = in&state[2];
    assign next_state[4] = in&state[3];
    assign next_state[5] = in&state[4];
    assign next_state[6] = in&state[5];
    assign next_state[7] = in&state[6] || state[7]&in;
    assign next_state[8] = (~in)&state[5];
    assign next_state[9] = (~in)&state[6];
    
    assign out1 = state[8] || state[9];
    assign out2 = state[7] || state[9];

endmodule
