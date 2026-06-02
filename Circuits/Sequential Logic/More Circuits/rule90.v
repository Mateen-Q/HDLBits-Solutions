module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 

    /*
    to understand whats happening here lets take a simple 4 bit example
    lets sat we had a 4 bit vector Q[3:0]

    what rule 90 essentially does is every bit's next state is the xor of the 2 bits around it

    for edge bits like Q[3] and Q[0] which don't have any bits on their left and right we just assume its 0

    so what rule 90 does is,
    Q[3] becomes 0^Q[2]
    Q[2] becomes Q[3]^Q[1]
    Q[1] becomes Q[2]^Q[0]
    Q[0] becomes Q[1]^0

    so      Q[3]     Q[2]      Q[1]     Q[0]

            0        Q[3]      Q[2]     Q[1]
            XOR      XOR       XOR      XOR
            Q[2]     Q[1]      Q[0]      0

    so Q basically go assigned a XOR between a left shifted Q by 1 bit and a right shifted Q by 1 bit
    left shifted Q = {Q[2:0],1'b0}
    right shifted Q = {1'b0,Q[3:1]}

    */
    
    always@(posedge clk) begin
        if(load) q <= data;
        else q <= {1'b0,q[511:1]} ^ {q[510:0],1'b0};   //here we assign q to xor amongst a left shifted q and a right shifted q

    end

endmodule
