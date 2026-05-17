module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);

    //lets solve this one by creating a dflop module and then instantiating it!
    
    wire [2:0] q;
    dflop d1(in,clk,resetn,q[0]);    //instance 1
    dflop d2(q[0],clk,resetn,q[1]);  //instance 2
    dflop d3(q[1],clk,resetn,q[2]);  //instance 3
    dflop d4(q[2],clk,resetn,out);  //instance 4
    

endmodule

module dflop(input d,input clk, input r, output q);  //here we create a dflop 
    always@(posedge clk) begin
        if(~r) q <=0;   //on reset low, dfop is reset
        else q <= d;   //else q gets value of d
    end
endmodule
