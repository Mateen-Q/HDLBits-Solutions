module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
    output reg Q);

    //the circuit might look scary but we only have to implement one of the mux-dff combo in this solution
    
    always@(posedge clk)begin  //created a clocked always block
        Q <= L?r_in:q_in;     //now whatever is assigned to Q is dependent on the output of mux
                              //so we implement the mux using the ternary operator and assign the 
                              //mux resultant to Q.
    end

endmodule

