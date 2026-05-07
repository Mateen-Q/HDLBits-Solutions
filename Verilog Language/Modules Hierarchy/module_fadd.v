module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire ci,cout;
    add16 a1(a[15:0], b[15:0], 1'b0, sum[15:0], ci);
    add16 a2(a[31:16], b[31:16], ci, sum[31:16], cout);

endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

    assign {cout,sum} = a+b+cin;

endmodule
