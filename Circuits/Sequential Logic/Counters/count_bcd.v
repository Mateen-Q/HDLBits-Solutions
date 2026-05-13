module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    assign ena[1] = (q[3:0] == 4'd9);    //enable 1 will be active when we have exhausted ones space and it reached 9

    assign ena[2] = (q[7:4] == 4'd9 && q[3:0] == 4'd9); //enable 2 will be active when we have exhausted ones and tens place and reached 99
    assign ena[3] = (q[11:8] == 4'd9 && q[7:4] == 4'd9 && q[3:0] == 4'd9); //enable 3 will be active when we have exhausted ones, tens and hundreds place reaching 999
    
    always@(posedge clk) begin
        if(reset || (q[15:0] == 16'h9999)) q <= 0;  //handeling edge case where if we reach 9999 or reset is hit, we need to roll over and make q = 0;
      
        else if(ena[3]) begin           //handeling case where we reach 999
            q[15:12] <= q[15:12]+1'b1;  
            q[3:0] <= 0;
            q[7:4] <= 0;
            q[11:8] <= 0;
        end
        
        else if(ena[2]) beginc        //handeling case of reaching 99
            q[11:8] <= q[11:8] + 1'b1;
            q[3:0] <= 0;
            q[7:4] <= 0;
        end
        
        else if(ena[1]) begin    //handleing case where we reach 9
            q[3:0] <= 0;  
            q[7:4] <= q[7:4] + 1'b1;
        end
            
        else q[3:0] <= q[3:0]+1'b1;   //if we haven't encountered any of the above cases we are probably in 1st digits and should increment
    end

endmodule
