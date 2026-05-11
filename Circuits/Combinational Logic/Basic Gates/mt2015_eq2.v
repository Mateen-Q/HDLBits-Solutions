module top_module ( input [1:0] A, input [1:0] B, output z ); 
    
    assign z = (A^B)?1'b0:1'b1;
    
    //a simple way to compare 2 variables is XOR between them if they are same it will 
    //result in 0 else result in some other value, so if we got result 0 we assign 1'b1
    //else we assign 1'b0, this is what our ternary operator peforms


    //alternative solution:
    //direct assignment of comparision result because comparision outputs 1(if true) and 0(if false)
    
    // assign z = (A==B);


endmodule