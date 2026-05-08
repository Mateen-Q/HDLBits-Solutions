module top_module(
    input a, 
    input b,
    output wire out_assign,
    output reg out_alwaysblock
);
    assign out_assign = a&b;   //assignment using the assign statement
    
    always@(*) begin
        out_alwaysblock = a&b;   //assignment inside a combinational always block
    end
    

endmodule
