module top_module (input a, input b, input c, output out);


	wire o;  //declared a wire to take output from the AND gate we have been given so we can later negate it to produce NAND like results

    andgate inst1 (o, a, b, c,1'b1,1'b1);  //rearranged inputs and outputs according to given declaration of the 5 Input NAND gate,
    // made the 2 extra inputs as 1'b1, because 1.x = x, so it doesn't change anything

    assign out = ~o;  //then we assign the negate of the final output of andgate to produce NAND behaviour

endmodule
