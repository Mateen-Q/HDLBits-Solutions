module top_module ();
    
    reg clk,reset, t;  //declared variables for all the inputs as registers
    wire q;   //declared variables for output
    
    initial clk = 0;   //initially clock starts a 0
    always #5 clk = ~clk;  //clock has a time period of 10 TU
    
    initial begin
        reset = 1;   //reset is set to one initiall
        #6           //reset stays high for 6 seconds to ensure it is high when first possitive edge of clk hits at t= 5
        reset = 0;   //then reset is set to 0 for normal operation of flipflop
    end
    
    initial begin
        t = 0;      //t is set to 0 intitiall because we don't want to toggle the flipflop in the beginning
        #14;        //it stays at 0 for 14 seconds
        t = 1;      //at 214th second it becomes 1, this is to ensure t=1 when next posedge hits at t=15
        #2;         //we keep it on for 2 seconds till (t=16) because we only needed it to be high at t=15
        t = 0;
    end
    
    tff i1(clk,reset,t,q);  //then we give our declared variables into the flipflop in the same order as ff declarations
    

endmodule
