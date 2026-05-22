// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;


    //this solution is exactly like fsm1 except we have a synchronous reset here so the only change will be in sensitivity list

    parameter A = 0;
    parameter B = 1;

    reg present_state, next_state;

    always@(*)begin
        next_state = ~(present_state^in);
    end
    
    always@(posedge clk) begin    //in asynchronous we checked posedge of both reset and clk, here we only check clock
        if(reset) present_state <= B;  //once we have hit clock then we check whether reset is high too, if yes then we reset
        else present_state <= next_state;  //otherwise present state gets next state
    end
    
    assign out = present_state?1:0;  //output depends on current state

endmodule
