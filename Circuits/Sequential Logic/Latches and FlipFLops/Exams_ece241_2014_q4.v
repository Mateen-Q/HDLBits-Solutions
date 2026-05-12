module top_module (
    input clk,
    input x,
    output z
);  
    reg q1,q2,q3;  //define 3 registers to get the output of flipflops
    always@(posedge clk) begin
        q1 <= q1^x;     //define working of ff1
        q2 <= (~q2)&x;  //define working of ff2
        q3 <= (~q3)|x;  //define working of ff3

    end
    
    assign z = ~(q1|q2|q3); //this assignment of outputs of flip flops needs to be continuous and not clocked
    //because rest of the circuit is not sequential its combinational
    

endmodule


