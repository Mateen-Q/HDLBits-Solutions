module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    

    //we have to design a mealy FSM for this question
    //we can only have 3 states 
    parameter s0 = 2'b00, //state 0(where 1 hasn't been found yet) you can say this is the idle state
    s1 = 2'b01,  //state 1 where the first 1 has been found
    s2 = 2'b10;  //state 2 where 10 sqeuence has been found
    reg [1:0] cs,ns;
    always@(*) begin
        case(cs)
            s0: begin           //if we are in s0, we go to s1 if x=1 else we stay in s0 when x = 0;
                ns <= x?s1:s0;
                z <= 0;
            end
            s1: begin           //if we are in s1, we go to s2 if x=0 else we stay in s1 when x = 1;
                ns <= x?s1:s2;
                z <= 0;
            end
            s2:begin            //when in s3, we now check for next input x
                if(x) begin     //if x is 1, that means we got 101, and because overlapping is allowed, we now go to s1 to utilize our 101's last 1
                    z <= 1;     //and we set z = 1
                    ns <= s1;
                end
                else begin     //else if x =0 we go back to s0 and start again
                    z <= 0;    //output z = 0 for that case
                    ns <= s0;
                end
            end
        endcase
    end
    
    always@(posedge clk or negedge aresetn) begin
        if(~aresetn) cs <= s0;
        else cs <= ns;
    end

endmodule
