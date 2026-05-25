module top_module();
    
    reg A, B;  //declared registers for input and output, for test benches
    wire Y;  //for test benches, output are wires and inputs are registers.
            //because well input values keep changing in the testbench while output is continously driven
    initial begin
        A = 0; B = 0;
        #10
        A = 0; B = 1;
        #10
        A = 1;B = 0;
        #10 
        A = 1;B = 1;
        #10;
        
    end
    
    andgate a1(.in({A,B}),.out(Y));   //connected {A,B} to in of the andgate module and Y to the out of the andgate module

endmodule


/*
alternative approach that realistically works but the website isn't accepting that solution: 

module top_module();
    
    reg A, B, Y;
    
    initial begin
        A = 0; B = 0; //initial values of A and B are 0 
        #40 $finish;   //simulation finishes after 40 seconds so only the 4 possible cases are accounted once and not again
    end
    
    always #20 A = ~A;  //A flips every 20 second
    always #10 B = ~B;  //B fiips every 10 second

    //so in 40 seconds all combinations will be accounted for
    
  
    
    andgate a1(.in({A,B}),.out(Y));

endmodule

*/
