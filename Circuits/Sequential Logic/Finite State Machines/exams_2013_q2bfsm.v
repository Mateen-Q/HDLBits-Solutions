module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    
    parameter A = 4'd0, //defined the idle state A where Machine stays in as long as reset is asserted
    B = 4'd1,   //defined a state B that machine goes to immediately as soon as reset is de-asserted, this is also the state where output f = 1;
    C = 4'd2,   //defined a state C where machine goes to after setting f =1 in state B to search for sequence 101 based on input x
    C1 = 4'd3,  //then we go to state C1(if we find 1) from C 
    C10 = 4'd4, //then we go to state C10(if we find 1 and 0 consecutively)
    C101 = 4'd5, //then we go to state C101(if we find the whole 101 sequence consecutively)
    Y0 = 4'd6,   //after finding pattern 101 we start focusing on input y, if we find y=0 first we go to state Y0 in hopes to find y=1 in the next cycle 
    PG1 = 4'd7,  //if we find y=1 immediately after finding the pattern 101 at C101, we go to PG1, or we go to PG1 from Y0 after finding y=1 in the next cycle, in state PG1, g =1 permanently
    PG0 = 4'd8;  //if we find y=0 after state Y0 then we go to PG0 where g is permanenly 0.
    
    reg [3:0] cs,ns; 
    
    always@(*) begin
        case(cs)
            A: ns = B;  //after reset is de-asserted we immediately go to state B
            B: ns = C;  //after state B where we set f=1 we immediately go state C to set f=0 again(because we only want f=1 for one clock cycle)
            C: ns = x?C1:C; //after we're in state C, we look for the sequence 101, so first bit is 1, so if x=1, we go to state C1, if we find x = 0 we go to state C
            C1: ns = x?C1:C10; //after we're in state C1, we look for x=0, if found go to C10, if we found x=1 again, go to C1 again
            C10: ns = x?C101:C; //after in C10, we look for x=1, if found, go to C101, else if we found x=0 we go back to C, where we found nothing lol
            C101: ns = y?PG1:Y0; //after in C101 we can now start looking for y=1 somewhere in the next 2 clock cycles, if immediately after C101, we get y=1 we go to PG1 else we go to Y0
            Y0: ns = y?PG1:PG0; //if we are in Y0 state, that means we found y=0 after C101, now if we can find y=1 we go to PG1 else we go to PG0 because this is the last cycle(we had to find in 2 cycles)
            PG1: ns = PG1;  //if in PG1(i.e. Permanent g = 1), we permanently stay there
            PG0: ns = PG0;  //if in PG0(i.e. Permanent g = 0), we permanently stay there until its reset
            default: ns = A;
        endcase
    end
    
    always@(posedge clk) begin
        if(~resetn) cs <= A;     //on reset go to idle state A
        else cs <= ns;   //if not then change states 
    end
    
    assign f = (cs==B);   //f is only high at state B
    assign g = (cs==C101) | (cs==Y0) | (cs==PG1);  //g is high when 101 is found(C101), when we are in PG1 or in Y0 in hopes of finding y=1 the next cycle.

endmodule
