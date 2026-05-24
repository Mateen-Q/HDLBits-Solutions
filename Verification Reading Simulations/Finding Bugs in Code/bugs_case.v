module top_module (
    input [7:0] code,
    output [3:0] out,   //out did not need to be a register, this is a combinational circuit
    output valid);  //valid also did not need to be a register and hold values, it was entirely dependent on current input

    always @(*) begin
        valid = 1'b1;   //defined the default value of valid as 1, because its only 0 when no cases meet, else its 1 for all cases
        case (code)

            //defined all outputs as 4 wide decimal instead of just 1,2,3 because those take up 32 bits

            8'h45: out = 4'd0; 
            8'h16: out = 4'd1;
            8'h1e: out = 4'd2;
            8'h26: out = 4'd3;    //this line had a bug, instead of the case being 8'h26, it was 8'd26, causing bugs
            8'h25: out = 4'd4;
            8'h2e: out = 4'd5;
            8'h36: out = 4'd6;
            8'h3d: out = 4'd7;
            8'h3e: out = 4'd8;
            8'h46: out = 4'd9;
            default: begin out = 4'd0; valid = 1'b0;end   //in invalid cases too, out = 4'd0 from inspection of incorrect results
        endcase
    end

endmodule
