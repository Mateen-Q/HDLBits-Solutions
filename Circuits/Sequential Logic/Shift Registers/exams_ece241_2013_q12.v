module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
    
    reg [7:0] Q;
    
    always@(posedge clk) begin   //shifting of register is through a clocked circuit
        if(enable) Q <= {Q[6:0],S};   //at every clock +ve edge, S shifts the register Q, MSB(Q[7]) is removed and S is added in place of LSB 
    end

    assign Z = Q[{A,B,C}]; //the rest of the mux is implemented like this, its not a clocked circuit its a combinational circuit
                        // ABC = 000 then Q[0] is assigned to Z
                        // ABC = 001 then Q[1] is assigned to Z
                        // ABC = 010 then Q[2] is assigned to Z
                        // so on    
                        
endmodule
