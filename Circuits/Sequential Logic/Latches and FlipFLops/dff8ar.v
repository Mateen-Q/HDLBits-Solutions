module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q
);


//asynchronous reset means reset won't be just checked at posedge of clk, its an independent event
//and regardless of what the status of the clock is, it must be checked at all times


    always@(posedge clk or posedge areset)begin  //within the sensitivity list we define the block to be activated
                                                //either by a clk signal or by a reset signal

        if(areset) q<=0;  //second check, if the signal is reset then reset all bits of q
        else q<=d;      //if reset signal is not high then continue the usual behaviour of a dflop

        //second check is necessary because the block is activated in both clk and areset posedge
        //so we need to check whether it was activated due to a rest or due to clk's edge
    end
    
    

endmodule
