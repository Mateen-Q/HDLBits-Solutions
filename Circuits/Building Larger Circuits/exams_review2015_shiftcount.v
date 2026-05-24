module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output reg [3:0] q);   //define q as a reg because when in counter state we want it to hold values
    
    always@(posedge clk) begin
        if(shift_ena && count_ena)begin    //its given that when both shift_ena and count_ena are high it doesn't matter what circuit does, so we will keep q as it is when that is the case
            q <= q;
        end  
        else if(shift_ena) q <= {q[2:0],data}; begin //when shift_ena is high, we shift q with 'data'
            q <= q-1'b1;            //if count is enabled we will decrement so we can down-count
        end
    end

endmodule
