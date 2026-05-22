module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    
    
    //define states
    parameter nf = 4'd0,  //nothing is found yet 
    s0 = 4'd1,   //in = 0 was found
    s1 = 4'd2,   //state 01 
    s2 = 4'd3,   //state 011
    s3 = 4'd4,   //state 0111
    s4 = 4'd5,   //state 01111
    s5 = 4'd6,   //state 011111
    s6 = 4'd7,   //state 0111111
    d = 4'd8,    //state 011110
    f = 4'd9,    //state 01111110
    e = 4'd10;   //state 01111111
    
    reg [3:0] cs,ns;
    
    always@(*) begin
        case(cs)
            nf: ns <= in?nf:s0; //initially we are on nothing found state, if we encounter a 0(in=0) we go to s0(state where 0 has been found) else we stay in nf state
            s0: ns <= in?s1:s0; //if we are in s0(i.e. 0 has been encountered) then we go to s1(i.e. 01) if we get in=1 else we stay on s0
            s1: ns <= in?s2:s0; //if we are in s1(i.e. 01 has been encountered) then we go to s2(i.e. 011) if we get in=1 else we go back to s0
            s2: ns <= in?s3:s0; //if we are in s2(i.e. 011 has been encountered) then we go to s3(i.e. 0111) if we get in=1 else we go back to s0 if we encounter a 0(in = 0)
            s3: ns <= in?s4:s0; //if we are in s3(i.e. 0111 has been encountered) then we go to s4(i.e. 01111) if we get in=1 else we go back to s0 if we encounter a 0(in = 0)
            s4: ns <= in?s5:s0; //if we are in s4(i.e. 01111 has been encountered) then we go to s5(i.e. 011111) if we get in=1 else we go back to s0 if we encounter a 0(in = 0)
            s5: ns <= in?s6:d;  //if we are in s5(i.e. 011111 has been encountered) then we go to s6(i.e. 0111111) if we get in=1 else we go to discard d(i.e. 0111110) 
            s6: ns <= in?e:f;   //if we are in s6(i.e. 0111111 has been encountered) then we go to flag f(i.e. 01111110) if we get in=0 else we go to error e(i.e. 01111111) 
            d: ns <= in?s1:s0;  //if we are in discard state(i.e. 0111110) so we consider overlapping sequence so if we get (in =1) we go to s1(01) because we already has 0 at end of discard, else if another 0 comes (in=0) then we go to s0
            f: ns <= in?s1:s0;  //if we are in flag state(011111110) we consider overlapping sequence so if we get (in = 1) so we go to s1(01) else if in=0 we gi to s0 again
            e: ns <= in?e:s0;   //if we are in error state(011111111) we stay in error state as long as we keep receiving 1's, as soon as we receive a 0 we go back to s0.
        endcase
    end
    
    
    always@(posedge clk) begin
        if(reset) cs <= s0;     //reset takes us to a state where we just found a 0, and that is s0
        else cs <= ns;
    end
    
    assign disc = (cs == d);  //disc bit will be high if we are in discard state d
    assign flag = (cs == f);  //flag bit will be high if we are in flag state f
    assign err = (cs == e);   //err bit will be high if we are in error state e
    
    

endmodule
