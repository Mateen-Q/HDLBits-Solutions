module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    
    wire [3:0] Q1,Q2,Q3;
    assign c_enable[0] = 1'b1;
    assign c_enable[1] = Q1[3]&Q1[0];
    assign c_enable[2] = Q2[3]&Q2[0] & Q1[3]&Q1[0];



    bcdcount counter0 (clk, reset, 1'b1,Q1);
    bcdcount counter1 (clk, reset, Q1[3]&Q1[0] ,Q2);   //second counter to be enabled only when first counter output hits 9
                                                        //Q1[3] & Q1[0] will only be 1 at 1001.

    bcdcount counter2 (clk, reset, Q2[3]&Q2[0] & Q1[3]&Q1[0] ,Q3);

                                                        //third counter to be enabled only when 1st and 2nd counter output hits 9
                                                        //Q1[3] & Q1[0] & Q2[3]&Q2[0] will only be 1 at 1001 & 1001.
    
    assign OneHertz = (Q3 == 4'd9 && Q2 == 4'd9 && Q1 == 4'd9);  //finally OneHertz is when all 3 output 1001.

endmodule
