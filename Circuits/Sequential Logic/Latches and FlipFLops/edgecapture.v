module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] prev;
    always@(posedge clk) begin
        out <= reset?0:((~in)&prev | out);   //if reset is encountered, we reset all bits to 0
                                            //else, bits of out are retained and if any new changes occur out is changed
                                            //this is ensured by performing and OR between new changes and out register;
                                            // ((~in)&prev) | out
                                            //     ^           ^
                                            //     |           |
                                            // new changes   preserving old 

        prev <= in;     //keeping track of old in for comparision
    end

endmodule
