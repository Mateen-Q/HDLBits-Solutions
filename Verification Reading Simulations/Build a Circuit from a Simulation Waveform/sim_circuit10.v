module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );
    
    


    /*
    
    from the given waveform we can infer the following: 

    -inference 1:  state changes whenever ab = 11 or ab = 00
    -inference 2:  if a and b are same i.e. 00 or 11 then output(q) is whatever the value of state pin is, if they are not same then output is invert of whatever state pin is


    so lets create 2 state s0 and s1, in s0, state =0 and in s1, state = 1
    */

    parameter s0 = 1'b0, s1 = 1'b1;  //defined the states s0 and s1
    reg cs, ns;  //defined registers cs and ns.
    
    always@(*)begin
        case(cs)
            s0: ns = (a&b)?s1:s0;   //when in s0, we go to s1 only when ab=11 else we stay in s0
            s1: ns = ((~a)&(~b))?s0:s1;   //when in state s1, we go to state s0 only when ab = 00
        endcase
    end
    
    
    //state change logic on clk
    always@(posedge clk)begin
        cs <= ns;
    end
    
    assign state =(cs == s1);   //state is high when in s1 state
    
    assign q = (a==b)?state:~state;  //from inference 2 we would end up with this equation

endmodule
