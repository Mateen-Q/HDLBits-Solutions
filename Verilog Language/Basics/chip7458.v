module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    
    /*

    - this problem is identical to wiredecl problem except its a little more complex
    - we can see here that we require a minimum of 4 intermediate wires: 
         1) a1 - output of AND performed between p2a and p2b;
         2) a2 - output of AND performed between p2c and p2d;
         3) a3 - output of AND performed between p1a,p1b and p1c
         4) a4 - output of AND performed between p1d,p1e and p1f

    */

    wire a1,a2,a3,a4;
    
    assign a1 = p2a&p2b;   //wire a1 is assigned to the output of AND gate that performs AND between p2a and p2b so we assign a1 to p2a&p2b
    assign a2 = p2c&p2d;   //wire a2 is assigned to the output of AND gate that performs AND between p2c and p2d so we assign a1 to p2c&p2d
    assign p2y = a1|a2;    //finally a1 and a2 go into an OR gate to produce p2y so p2y is assigned to a1|a2
    
    assign a3 = p1a&p1b&p1c; //wire a3 is assigned to the output of AND gate that performs AND between p1a, p1b and p1c so we assign a1 to p1a&p1b&p1c
    assign a4 = p1d&p1e&p1f; //wire a4 is assigned to the output of AND gate that performs AND between p1d, p1e and p1f so we assign a1 to p1d&p1e&p1f
    assign p1y = a3|a4;      //finally a3 and a4 go into an OR gate to produce p2y so p2y is assigned to a3|a4


endmodule
