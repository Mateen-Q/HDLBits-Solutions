module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] w1,w2,w3;
    my_dff8 d1(clk, d, w1);
    my_dff8 d2(clk, w1, w2);
    my_dff8 d3(clk, w2, w3);
    
    assign q = sel[1]?(sel[0]?w3:w2):(sel[0]?w1:d);

endmodule


    
