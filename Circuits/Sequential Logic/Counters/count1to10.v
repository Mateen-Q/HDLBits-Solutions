module top_module (
    input clk,
    input reset,
    output [3:0] q);
    
    always@(posedge clk) begin     //circuit works every possitive edge, so once every clock cycle

        if(reset || q == 4'd10) q<=4'd1;  //instead of counting 0 to 9 this counter counts from 1 to 10,
                                          //i.e. on reset it should go to 1 not 0, so when 10 or reset is hit, we go back to 1



        else q<= q+1;   //else we increment!
    end

endmodule
