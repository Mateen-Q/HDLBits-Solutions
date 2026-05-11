module top_module (input x, input y, output z);
    A a1(x,y,z);  //instantiated module A in top module to generate
endmodule

module A(input x, input y, output z);  //created a module A that implements the given function
    assign z = (x^y)&x;  //implmentation of the given function
endmodule

