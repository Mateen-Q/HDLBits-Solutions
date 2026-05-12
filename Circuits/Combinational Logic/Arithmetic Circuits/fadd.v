module top_module( 
    input a, b, cin,
    output cout, sum );
    
    assign {cout,sum} = a+b+cin; //same as half adder, the only difference is addition of cin along 
                                 //with a and b

    //alternatively we can use the equations of cout and sum, better from a fabrication POV to use
    //direct boolean expressions

    //assign sum = a^b^cin;
    //assing cout = (a&b)|(cin&(a^b))


endmodule
