module top_module( 
    input a, b, sel,
    output out ); 


    /*

    The ternary operator in Verilog (also called the conditional operator) acts like a compact "if-else" statement. It evaluates a condition and selects one of two values based on whether that condition is true or false.

    Syntax
    assign result = (condition) ? value_if_true : value_if_false;

    */

    assign out = sel?b:a;  //if sel is 0, out will be assigned the latter(a), if its 1, out will be 
                            //assigned the earlier(b);

endmodule
