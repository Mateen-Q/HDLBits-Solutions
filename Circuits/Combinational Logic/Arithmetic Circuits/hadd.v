module top_module( 
    input a, b,
    output cout, sum );
    
    assign {cout,sum} = a+b; //if we use concatenation operator for assignment our solution will be really simple
                            //just add a+b and assign it to sum, if sum exceeds its bits, then there is a
                            //carry out and it will be assigned to sum.
    
    //alternatively we can use the equations of half adder
    
    //assign sum = a^b;
    //assign cout = a&b;

endmodule
