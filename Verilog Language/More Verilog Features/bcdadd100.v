module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

    // Create a wire to carry the bits between adders
    // we need 100 internal carry links + the initial cin
    wire [100:0] carry;   
    assign carry[0] = cin; //assigning carry[0] as cin;
    
    genvar i;
    generate
        for(i = 0;i<400;i= i+4)begin : bcd_adder
            bcd_fadd f(a[i+3:i],b[i+3:i],carry[i/4],carry[(i/4)+1],sum[i+3:i]);

            //carry[i/4] will fetch the cin, for i=0, it fetches carry[0] that is cin;
            //carry[i/4+1] will store the carry generatef for next iteration
            //when i=4(next iteration bcz i increments by 4), carry[4/4] = carry[1]
            //carry[1] was where the carryout from previous iteration was stored
            //so now in this iterations it will be used as carryIn.
        end
    endgenerate
    
    assign cout = carry[100];
endmodule
