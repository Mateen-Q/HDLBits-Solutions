//IMP QUESTION FOR GENERATOR CONCEPT

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum 
);

    // Create a wire to carry the bits between adders
    // we need 100 internal carry links + the initial cin
    wire [100:0] carry;
    assign carry[0] = cin;

    genvar i;   //a variable must be declared to use inside generate block
    generate   //a generate block is never inside a always block.
        for(i = 0; i < 100; i = i + 1) begin: adder_gen
            fadd f(a[i],b[i],carry[i],sum[i],carry[i+1]);   //instantiating fadd;
        end
    endgenerate

    // Assign the internal carry wires to the output cout port
    assign cout = carry[100:1];

endmodule

module fadd(input a, input b, input cin, output sum, output cout);
    assign {cout, sum} = a + b + cin;
endmodule



//alternate solution without requiring full adder module : 


/*

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    reg ctemp;
    
    always@(*) begin
        ctemp = cin;
        for(int i = 0;i<$bits(sum);i++) begin
            {cout[i],sum[i]} = a[i] + b[i] + ctemp;
            ctemp = cout[i];
        end
    end

endmodule




*/