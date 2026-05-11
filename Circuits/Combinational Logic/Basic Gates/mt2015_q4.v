module top_module (input x, input y, output z);
    wire w1,w2,w3,w4,w5,w6;  //creating intermediate wires to carry values between modules and gates
    
    A a1(x,y,w1);  //assiging output of first instance of Mod A to w1
    B b1(x,y,w2);  //assiging output of first instance of Mod B to w2
    A a2(x,y,w3);  //assiging output of second instance of Mod A to w3
    B b2(x,y,w4);  //assiging output of second instance of Mod B to w4
    
    assign w5 = w1|w2;  //assiging output of OR gate to w5
    assign w6 = w3&w4;  //assiging output of AND gate to w6
    assign z = w5^w6;  //finally performing XOR between ouputs from AND and OR gate and
                        //assiging final output to z
    
endmodule

//picked up mod A from mt2015_q4a;

module A(input x, input y, output z);  //created a module A that implements the given function
    assign z = (x^y)&x;  //implmentation of the given function
endmodule

//picked up mod b from mt_2015_q4b;

module B( input x, input y, output z);

    assign z = ~(x^y);  //performing XOR between x and y and assigning it to z. 
endmodule

