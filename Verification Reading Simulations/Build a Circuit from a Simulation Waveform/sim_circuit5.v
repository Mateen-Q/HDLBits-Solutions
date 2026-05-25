module top_module (
    input [3:0] a,
    input [3:0] b,
    input [3:0] c,
    input [3:0] d,
    input [3:0] e,
    output [3:0] q );

/*

on observing the given signal waveform, we can decipher the following:
whenever c = 0, output is whatever is in the input b (Explaination : in simulation 1, b gets input b, so circuit outputs b, in simulation 2, b gets input 2, so circuit outputs 2)
whenever c = 1, output is whatever is in the input e 
whenever c = 2, output is whatever is in the input a
whenever c = 3, output is whatever is in the input d
whenever c is anything other than 0,1,2,3 the output is hex value f(1111)

so essentially its a 4:1 mux with default case output 1111

    
    
 */   
    always@(*)begin
        case(c)
            4'b0000: q = b;
            4'b0001: q = e;
            4'b0010: q = a;
            4'b0011: q = d;
            default: q = 4'hf;
        endcase
    end

endmodule
