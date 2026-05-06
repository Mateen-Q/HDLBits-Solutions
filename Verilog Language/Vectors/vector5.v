module top_module (
    input a, b, c, d, e,
    output [24:0] out );


    /*
    
    - problem requires us to compare every possible combination between the 5 variables
    - comparision can be done using xnor, if bits are same it outputs = 1, if diff, output = 0;
    - lets approach this problem by creating 2 vectors, one repeating abcde 5 times, another
      repeating a 5 times then b 5 times and so on
    - these 2 vectors when put one above other will create all possible combinations
    - vector c1 =    a    b    c d e a b c d e a b c d e a b c d e a b c d e
    - vector c2 =    a    a    a a a b b b b b c c c c c d d d d d e e e e e
    - vector out =   a^a b^a ..........so on................................
    
    */

    wire [24:0] c1,c2;   //lets declare 2 wires c1 and c2 for out intermediary purpose
    assign c2 = { {5{a}},{5{b}},{5{c}},{5{d}},{5{e}} };  //lets create the vector c2
    assign c1 = {5{a,b,c,d,e}};     //creating the vector c1 by concatenation
    
    assign out = ~(c1^c2);   //performing xnor on c1 and c2 and assigning the result to out
    

endmodule
