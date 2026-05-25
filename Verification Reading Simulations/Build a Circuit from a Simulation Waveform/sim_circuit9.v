module top_module (
    input clk,
    input a,
    output reg [3:0] q );   //declare q as a reg as a safe practice because we will be incrementing it


    /*
    
    on observing the given waveform we can infer the following: 
            1) whenever there is a +ve edge of clock and a is high, q outputs 4
            2) else, if theres is a +ve edge of clock and a is low, q's output is that of a counter
            3) q increments till 6 and then resets to 0, so this counter only counts till 6
    
    */
    
    always@(posedge clk) begin
        if(~a) begin              //if a is low, q will exhibit 0-6 counter behaviour
            if(q == 4'd6) q <= 0;  //if q reaches 6, it resets back to 0
            else q <= q+1'b1;     //else q increments 
        end
        
        else begin
            q <= 4'd4;   //if a is high and we hit a posedge, then output will be 4 regardless of current count
        end
    end


    //essentialy 'a' high resets the counter to 4 at every posedge

endmodule
