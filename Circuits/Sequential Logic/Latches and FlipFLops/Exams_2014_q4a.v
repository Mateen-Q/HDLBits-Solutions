module top_module (
    input clk,
    input w, R, E, L,
    output Q
);

//again we only need to write the code for one level of this circuit.


    always@(posedge clk) begin
        Q <= L?R:(E?w:Q);       //this is a nested ternary block
                                //if L is 1 then R is assigned else if L is 0 then output of the 1st Mux is assigned
                                //output of the first Mux is dependent on E, if E is 1 then its w else its Q.
                                //so when L=0, the ternary operation for 1st Mux will be looked at i.e. E?w:Q
    end

endmodule
