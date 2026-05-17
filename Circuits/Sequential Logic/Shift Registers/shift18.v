module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
    
    always@(posedge clk) begin
        if(load) q <= data;     //if load is active then q just gets whatever is in data
        else if(ena) begin      //if ena is active then only we do the shifting
            case(amount)        //amount will tell us what type and how much to shift by
                2'b00: q <= {q[62:0],1'b0}; //amount = 00 implies a left shift by 1 bit, so we remove the MSB(q[63]) and add a 0 bit next to LSB 
                2'b01: q <= {q[55:0],8'b0}; //amount = 01 implies a left shift by 8 bit, so we remove MS 8 bits(q[63-56]) and add 8 0's next to LSB
                2'b10: q <= {q[63],q[63:1]}; //amount = 10 implies right shift by 1 bit, but because we need to preserve sign, we add a copy of MSB(q[63]) next to current MSB and remove th LSB(q[0])
                2'b11: q <= {{8{q[63]}},q[63:8]}; //amount = 11 implies right shift by 8 bit, we need to preserve sign so we add 8 copies of MSB(q[63]) up front and remove 8 least significant bits(q[7:0])
            endcase
        end
        else q<=q;  //incase neither load nor ena is high, q stays as it is
    end

endmodule
