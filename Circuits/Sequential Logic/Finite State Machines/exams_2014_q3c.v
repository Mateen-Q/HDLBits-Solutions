module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
    
	

    assign Y0 = y[0]&(~x) | y[2]&(~x) | (~y[2])&(~y[0])&x; //by the given table we determined an equation of last bit of next state dependent on input state and input x using a Karnaugh Map
    assign z = (y == 3'b011) || (y == 3'b100); //z is only high when state 3'b011 or 3'b100 is hit.
    
    



endmodule
