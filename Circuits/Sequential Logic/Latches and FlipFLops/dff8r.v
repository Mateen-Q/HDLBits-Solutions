module top_module (
    input clk,
    input reset,            // Synchronous reset(i.e. reset will also be only checked at +ve edge of clock)
    input [7:0] d,
    output [7:0] q
);
    always@(posedge clk) begin   //clocked always block
        q <= reset?8'b0:d;      //ternary operator to mimic reset behaviour, if reset = 1, q is set to 0 else to d
    end

endmodule


//some altenrative solutions I thought of : 


/*

solution 1: 

module top_module (
    input clk,
    input reset,           
    input [7:0] d,
    output [7:0] q
);
    always@(posedge clk) begin   //clocked always block
        q <= d&{8{~reset}};     //if reset is 1, everybit of d will AND with 0 and result in 0
                                //therefore resetting the output

                                //if reset = 0, everybit of d will be AND with 1, and we know x&1 = x
                                //so nothing will change and q will receive whatever d is
    end

endmodule


solution 2(using if else instead of ternary operator)

module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);
    always@(posedge clk) begin
        if(reset) q<= 8'b0;
        else q<=d;
    end

endmodule



*/
