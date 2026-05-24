// synthesis verilog_input_version verilog_2001
module top_module ( 
    input do_sub,
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] out,
    output result_is_zero  //result_is_zero did not need to be a register
);//

    always @(*) begin
        case (do_sub)
          0: out = a+b;
          1: out = a-b;
        endcase
    end
    
    assign result_is_zero = (out == 8'b0)?1'b1:1'b0;   //assignment of result_is_zero done seperately outside using a assign statement

endmodule
