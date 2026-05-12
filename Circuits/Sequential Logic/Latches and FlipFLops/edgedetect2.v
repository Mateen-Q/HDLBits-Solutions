module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    
    reg [7:0] ls;     //declaring a register to store previous state so we can compare with next state
    always@(posedge clk) begin
        anyedge <= in&(~ls) | (~in)&(ls);  //check both 0 to 1[in&(~ls)] transitions and 1 to 0 transition[(~in)&(ls)]
                                            // unlike the previous case that only checked for 0 to 1 transitions.

                                            
        ls <= in; //this stores current state in ls(last state) so it could be used in next stage.
    end

endmodule
