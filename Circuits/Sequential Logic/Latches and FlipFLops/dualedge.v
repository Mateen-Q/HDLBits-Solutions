module top_module (
    input clk,
    input d,
    output q
);
    wire dp, dn;
    always@(posedge clk)begin
        dp <= d;   //capture d at possitive edge
    end
    
    always@(negedge clk)begin
        dn <= d;   //capture d at negative edge
    end
    
    assign q = clk?dp:dn;  //we will do alternate assignment because alternatively the state of posedge and negedge is 
    						//being overwriten to q, this here is a very clever approach.
    
    						//when clock is high it means it just passed through a possitive edge,so currently
    						//whatever d was captured by possitive edge(dp) should be given to q.

                            //when clock is low it means it just passed through a negative edge so currently
                            //whatever d was captured by negative edge(dn) must be given to q.
    

endmodule
