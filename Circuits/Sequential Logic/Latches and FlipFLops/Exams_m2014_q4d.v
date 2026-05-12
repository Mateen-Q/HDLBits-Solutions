module top_module (
    input clk,
    input in, 
    output out);
    
    always@(posedge clk) begin
        out <= out^in;          //d flop essentially just assigns whatever goes into d to q
                                //in this case, d receives out^in
                                //so we assign out to out^in;
    end

endmodule
