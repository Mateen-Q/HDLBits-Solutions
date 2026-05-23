module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    
    parameter A = 0, B=1;   //define the 2 given states
    reg cs ,ns;
    always@(*) begin
        case(cs)
            A: ns = x?B:A;   //we stay in state A as long as input x is 0, when its 1 we go to state B
            B: ns = B;       //when in state B we stay in state B, because once we hit a 1 we need to flip all the bits afterwards
        endcase
    end
    
    always@(*) begin
        case(cs)
            A: z = x;  //if in state A we output bits as they are
            B: z = ~x; //once we hit 1, then we go to state B and every output bit is negated to perform 2's compliment
        endcase
    end
    
    always@(posedge clk or posedge areset)begin
        if(areset) cs <= A;
        else cs <= ns;
    end

endmodule
