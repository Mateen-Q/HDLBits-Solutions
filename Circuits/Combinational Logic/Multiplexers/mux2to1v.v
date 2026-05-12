module top_module( 
    input [99:0] a, b,
    input sel,
    output [99:0] out );

    //this circuit essentially does what a simple 2 to 1 mux does, except the input here is 100 bit wide
    //rather than 1 bit widem
    
    assign out = sel?b:a;

endmodule
