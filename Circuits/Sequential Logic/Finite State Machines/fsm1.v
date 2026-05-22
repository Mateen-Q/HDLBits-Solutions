module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1;   //define binary codes for each state, here we only have 2 states so 0 and 1
    reg state, next_state;  //define 2 registers, one for current state, one next state

    always @(*) begin    //state transition logic is always inside a combinational block
                         //so we can have a blob of combinational followed by a flipflop that does the actual change

        next_state <= ~(state^in);  //define what next state depends upon, I solved this by using a truth table you can also use ternary

        /*

        alternative way : 
        
        case (state)
			A: next_state = in ? A : B;  //if current state is A, and you get input 1, it stays A, else goes to B
			B: next_state = in ? B : A;  //if current state is B, and you get input 1, it stays B, else goes to A
		endcase
        
        */
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        if(areset) state <= B;
        else state <= next_state;
    end

    assign out = state?1:0;

endmodule
