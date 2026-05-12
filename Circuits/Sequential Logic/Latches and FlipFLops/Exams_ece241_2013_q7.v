module top_module (
    input clk,
    input j,
    input k,
    output Q); 
    
    always@(posedge clk)begin   
        case({j,k})
            2'b00: Q<=Q;     //when JK = 00, Q remains as it is, so we assign Q to Q
            2'b01: Q<=1'b0;  //when JK = 01, Q is reset to 0;
            2'b10: Q<=1'b1;  //when JK = 01, Q is set to 1;
            2'b11: Q<=(~Q);  //when JK = 00, Q is toggled, so we assign Q to ~Q
        endcase
    end

endmodule
