module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    wire [7:0] min1,min2;   //decalring 2 intermdiate minimum variables
    assign min1 = a>b?b:a;  //comparing a and b and assigning min to min1
    assign min2 = min1>c?c:min1; //comparing min1 with c to create min2
    assign min = min2>d?d:min2;  //comparing min2 with d to finally assign min

endmodule
