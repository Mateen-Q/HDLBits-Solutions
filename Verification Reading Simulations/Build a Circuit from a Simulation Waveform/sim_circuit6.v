module top_module (
    input [2:0] a,
    output [15:0] q ); 


    /*
    
    the given circuit is nothing but a simple 16 bit wide 8:1 mux which depends on input a and outputs q accordingly
    */
    
    always@(*)begin
        case(a)
            3'b000: q = 16'h1232;    //when a=0, q = 1232 according to the given waveform, simmilarly the rest
            3'b001: q = 16'haee0;
            3'b010: q = 16'h27d4;
            3'b011: q = 16'h5a0e;
            3'b100: q = 16'h2066;
            3'b101: q = 16'h64ce;
            3'b110: q = 16'hc526;
            3'b111: q = 16'h2f19;
        endcase     
    end

endmodule
