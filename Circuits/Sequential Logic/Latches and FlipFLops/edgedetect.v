module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] ls;   //we will declare a register to keep track of previous state so we can compare new In 
                    //with its previous state to see if there were any changes

    always@(posedge clk) begin
        pedge <= in & ~ls;  //basically we need to detect 0 to 1 transitions so if previous state was 0 (~ls)
                            //and new state is 1 (in) then pedge will be 1
                            //so, pedge = in&(~ls);

        ls <= in;       //we store the currently received 'in' inside ls so we can use it to check on next clock;
    end

endmodule
