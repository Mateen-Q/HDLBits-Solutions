module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11; //declare states and assign them codes
    reg [1:0] cs,ns;  //declared 2 registers, cs(current state) and ns(next state) to store cs and ns depending on input 
    
    always@(*) begin
        case(cs)       
            A: begin    //if we are in state A, depeding on value of r[1] r[2] r[3], state will change
                if(r == 3'b000) ns = A;  //given that machine stays in state A if (~r1)&(~r2)&(~r3)
                else if(r[1]) ns = B; //given that if r1 is active, machine will go to state B regardless of r2 and r3
                else if(r[2:1] == 2'b10) ns = C; //given that if (~r1)&(r2) i.e. r2,r1 = 10, machine will go in state C regardless of r3
                else if(r == 3'b100) ns = D; //given that if (r3)(~r2)(~r1) i.e. r3,r2,r1 = 100, machine will go in state D.
            end
            
            B: begin
                if(r[1]) ns = B;    //while in state B if r1 is active, Machine stays in state B
                else ns = A;        //if r1 goes low, machine goes to state A
            end
            
            C: begin
                if(r[2]) ns = C;    //while in state C if r2 is active, Machine stays in state C
                else ns = A;        //if r2 goes low, machine goes to state A
            end
            
            D: begin
                if(r[3]) ns = D;    //while in state D if r3 is active, Machine stays in state D
                else ns = A;        //if r3 goes low, machine goes to state A
            end
            
            default: ns = A;    //by default machine is in state A(not necessary to declare but declaring a default case is a safe practice)
        endcase
    end
    
    always@(posedge clk) begin
        if(~resetn) cs <= A;    //active low reset, so it resets when resetn = 0,then only ~resetn will be 1
        else cs <= ns;   //else state change happens 
    end
    
    assign g = {(cs == D),(cs == C),(cs == B)};  //g[3] is 1 in stateD, g[2] is 1 in state C and g[1] is 1 in state B

endmodule
