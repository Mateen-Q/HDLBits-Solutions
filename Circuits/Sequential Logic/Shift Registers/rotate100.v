module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q); 
    
    always@(posedge clk) begin
        if(load) q<= data;      //if load is high then q gets data
        else if(ena == 2'b01) q<= {q[0],q[99:1]};  //if ena == 01, then we shift right, that means right most bit(q[0]) is picked up and taken to back, the rest of the bits shift ahead
        else if(ena == 2'b10) q<= {q[98:0],q[99]}; //if ena == 01, then we shift right, that means left most(q[99]) bit is picked up and taken to front, the rest of the bits shift ahead
        else q <=q;  //if none of the above cases meet then q stays q
    end

endmodule
