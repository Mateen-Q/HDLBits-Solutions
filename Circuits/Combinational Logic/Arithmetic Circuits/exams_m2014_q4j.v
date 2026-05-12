module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
	
    wire cout [2:0];
    fa a1(x[0],y[0],1'b0,sum[0],cout[0]);      //instantiating first adder and passing in 1'b0 because no cin is mentioned
    										   //for first adder.
    fa a2(x[1],y[1],cout[0],sum[1],cout[1]);  //instantiation second adder and passing in cout[0] as cin for it 
                                              //(carry out from previous stage becomes carry IN of this stage)
    fa a3(x[2],y[2],cout[1],sum[2],cout[2]);  //instantiating 3rd adder
    fa a4(x[3],y[3],cout[2],sum[3],sum[4]);   //instantiating 4th adder and its cout becomes sum[4] as per circuit
     
    
endmodule

module fa(input a,b,cin,output sum,cout);  //creating a full adder module to use in our top module
    assign {cout,sum} = a+b+cin;
endmodule