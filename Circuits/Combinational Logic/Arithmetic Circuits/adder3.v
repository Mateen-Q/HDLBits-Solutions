module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    fa a1(a[0],b[0],cin,sum[0],cout[0]);      //instantiating first adder and passing in cin.
    fa a2(a[1],b[1],cout[0],sum[1],cout[1]);  //instantiation second adder and passing in cout[0] as cin for it 
                                              //(carry out from previous stage becomes carry IN of this stage)
    fa a3(a[2],b[2],cout[1],sum[2],cout[2]);  //instantiating 3rd adder

endmodule

module fa(input a,b,cin,output sum,cout);  //creating a full adder module to use in our top module
    assign {cout,sum} = a+b+cin;
endmodule
