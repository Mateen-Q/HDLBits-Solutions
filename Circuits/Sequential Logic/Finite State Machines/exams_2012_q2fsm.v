module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);
    
    parameter A = 3'b000,    
    B = 3'b001,
    C = 3'b010,
    D = 3'b011,
    E = 3'b100,
    F = 3'b101;
    
    reg [2:0] ns,cs;
    
    always@(*)begin
        case(cs)
            A: ns = w?B:A;   //depending on state input and 'w' we will assign the next state based on state diagram
            B: ns = w?C:D;
            C: ns = w?E:D;
            D: ns = w?F:A;
            E: ns = w?E:D;
            F: ns = w?C:D;
        endcase
    end
    
    always@(posedge clk) begin
        if(reset) cs <= A;
        else cs <= ns;
    end
    
    assign z = (cs == E) | (cs == F); //output z is only high when state is F or E

endmodule
