module top_module(
    input clk,
    input [7:0] in,
    input reset,
    output [23:0] out_bytes,
    output done
);

    parameter N  = 2'd0,   //defined 4 states again
              B1 = 2'd1,
              B2 = 2'd2,
              B3 = 2'd3;

    reg [1:0] cs, ns;  //2 registrs to hold current and prev state
    reg [23:0] val;  //intermediary value register that will completely assign its value to out_bytes when done is hit

    // Next-state logic only
    always @(*) begin
        case(cs)       //state transition logic remains same as fsmps2
            N :  ns = in[3] ? B1 : N;  
            B1:  ns = B2;
            B2:  ns = B3;
            B3:  ns = in[3] ? B1 : N;
            default: ns = N;
        endcase
    end

    // Sequential state + datapath
    always @(posedge clk) begin
        if(reset) begin
            cs  <= N;      //if we hit reset, then go to N
            val <= 24'b0;  //and set val to 0.
        end
        else begin
            cs <= ns;

            case(cs)
                N: begin        //if we are in state Not found
                    if(in[3])    //and just hit a in[3]
                        val[23:16] <= in;   //we assign that in to val[23:16]
                end

                B1: begin
                    val[15:8] <= in;   //if we are in B1, i.e. next byte is to start, we assign val[15:8] to current byte
                end

                B2: begin
                    val[7:0] <= in;  //if we are in B2, i.e. next byte is to start, we assign val[7:0] to current byte
                end
                
                B3: begin
                    if(in[3]) val[23:16] <= in;  //as soon as byte3 ends and we again find in[3] = 1 in the next sequence, then we need to assign val[23:16] to first found byte
                end
            endcase
        end
    end

    assign done = (cs == B3);
    assign out_bytes = done ? val : 24'b0;   //whenever all 3 bytes are stored in val, we assign it all at once to out_bytes.

endmodule