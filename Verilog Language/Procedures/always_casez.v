module top_module (
    input [7:0] in,
    output reg [2:0] pos );
    
//if we solved it by considering everycase we would have 256( = 2^8) different cases
//we can instead solve it in just 9 cases using casex or casez
//casex and casez let us use z and x values in our case statments when a particular bit does not
//matter in the decision making process it can be ignored and written as x or z

always@(*) begin
    casex(in)        //here we will use casex that uses x(undefined value) or don't care value
        8'bxxxxxxx1: pos = 3'd0;  //in this particular case if we find 1 at the very first index
                                  //then it doesn't matter what values the rest 7 indices hold.
                                  //our position of 1st 1 will always be 0, so we mark rest of the
                                  //values as x.

        8'bxxxxxx10: pos = 3'd1;  //simmilarly for this case 
        8'bxxxxx100: pos = 3'd2;
        8'bxxxx1000: pos = 3'd3;
        8'bxxx10000: pos = 3'd4;
        8'bxx100000: pos = 3'd5;
        8'bx1000000: pos = 3'd6;
        8'b10000000: pos = 3'd7;
        default: pos = 2'b00;     //this case covers the possibility where there is no '1' and the
                                  //input is just 0.
    endcase
end

endmodule
