module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    
    //define your states 
    parameter n = 4'd0   //state n is when no startbit(0) has been found yet
    ,s0 = 4'd1           //state s0 is when starbit(0) was found     
    ,s1 = 4'd2           //state s1 is state after s0 when 'in' is received
    ,s2 = 4'd3           //state s2 is state after s1 when 'in' is received
    ,s3 = 4'd4          //state s3 is state after s2 when 'in' is received  
    ,s4 = 4'd5          //state s4 is state after s3 when 'in' is received
    ,s5 = 4'd6          //state s5 is state after s4 when 'in' is received
    ,s6 = 4'd7          //state s6 is state after s5 when 'in' is received
    ,s7 = 4'd8          //state s7 is state after s6 when 'in' is received
    ,s8 = 4'd9          //state s8 is state after s7 when 'in' is received
    ,sf = 4'd10         //state sf(set finish) is the finish state when all 8 'in' receiving states(s0-s8) are finished and finally in = 1 (stop bit) is received
    ,nf = 4'd11;        //state nf(not found) is when all 8 bits are received but no stop bit is received
    
    reg [3:0] cs,ns;
    
    always@(*)begin
        case(cs)
            n: ns <= in?n:s0;  //if we are in state n, we check in, if start bit(in =0) we go to state 0 else stay in state n
            s0: ns <= s1;  //once in state 0 we go to state 1 and receive in
            s1: ns <= s2;  //once in state 1 we go to state 2 and receive in
            s2: ns <= s3;  //once in state 2 we go to state 3 and receive in
            s3: ns <= s4;  //once in state 3 we go to state 4 and receive in
            s4: ns <= s5;  //once in state 4 we go to state 5 and receive in
            s5: ns <= s6;  //once in state 5 we go to state 6 and receive in
            s6: ns <= s7;  //once in state 6 we go to state 7 and receive in
            s7: ns <= s8;  //once in state 7 we go to state 8 and receive in
            s8: ns <= in?sf:nf; //once in state 8 we check for stop bit(in =1), if stop bit is received right after we go to finished state, else we go to not found state
            sf: ns <= in?n:s0;  //once in finish state,if next bit is start bit(in=0) then we go to s0 or go back to n
            nf: ns <= in?n:nf;  //once in not found state, we wait till we find a stop bit(in=1) to go back to n, else we stay here
        endcase
    end
    
    always@(posedge clk) begin    //state change logic
        if(reset) cs <= n;
        else cs <= ns;
    end
    
    assign done = (cs == sf);   //done is high when we are in finish state!

endmodule
