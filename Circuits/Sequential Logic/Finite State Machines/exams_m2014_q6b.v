module top_module (
    input [3:1] y,
    input w,
    output Y2);


    //declared states based on given 
    
    parameter A = 3'b000,    
    B = 3'b001,
    C = 3'b010,
    D = 3'b011,
    E = 3'b100,
    F = 3'b101;
    
    reg [3:1] ns;
    
    always@(*)begin
        case(y)
            A: ns = w?A:B;   //depending on state input and 'w' we will assign the next state
            B: ns = w?D:C;
            C: ns = w?D:E;
            D: ns = w?A:F;
            E: ns = w?D:E;
            F: ns = w?D:C;
        endcase
    end
    
    assign Y2 = ns[2];  //finally we assign 2nd output of next state ns[3:1] to Y2S
    
endmodule
