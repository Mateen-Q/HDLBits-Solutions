module top_module(
    input in,
    input [3:0] state,
    output [3:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    /*
    
    by the one hot code,
    A = 0001
    B = 0010
    C = 0100
    D = 1000

    so we can tell by just one bit whether the machine is in a particular state or not

    if you draw a state diagram by the given transition table this problem will make much more sense

    see its simple, there are only 2 ways to reach state A, 
        1) you are in state A (ie state = 0001) so state[0] = 1 and you have in = 0
        2) you are in state C (ie state = 0100) so state[2] = 1 and you have in = 0
    so, state A achieved on : state[0]&(~in) | state[2]&(~in);
    this is what our equation is for state A, so we will assign this exact equation to given next_state[A]

    similarly if you look at the given table, there are 3 ways to reach B,
       1) you are in state A(0001) so state[0] = 1 and in = 1;
       2) you are in state B(0010) so state[1] = 1 and in = 1;
       3) ypu are in state D(1000) so state[3] = 1 and in = 1
    so resulting equation for B will be :  state[0]&in | state[1]&in | state[3]&in;

    similarly you can derive equations for C and D, i'll leave that to you, you can always
    confirm with the equations I derived to ensure its correct !
    
    */
    assign next_state[A] =  (state[0]&(~in)) | (state[2]&(~in));
    assign next_state[B] =  state[0]&in | state[1]&in | state[3]&in;
    assign next_state[C] =  state[3]&(~in) | state[1]&(~in);
    assign next_state[D] =  state[2]&(in);

    // Output logic: 
    assign out = state[3];  //output is only 1 on state D(1000) state D is when State[3] = 1, so we assign out to state[3]

endmodule
