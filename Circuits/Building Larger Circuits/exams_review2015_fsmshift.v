module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    
    reg [2:0] count;  //defined a register to keep count of cycles to keep shift_ena high
    
    always@(posedge clk)begin
        if(reset) begin 
            shift_ena <= 1'b1;    //shift_ena is set to high every reset
            count = 2'b00;        //initial value of count is set to 0 
        end
        else if(count < 2'b11)begin  //after shift_ena is disabled, we still need to keep shift_ena high for 3 more cycles(1 cycle was already done when set shift_ena = 1)
            shift_ena = 1'b1;        //so we set shift_ena to 1 as long as we are under 3 cycle count(0-2)
            count = count + 1'b1;    //and we incrment count every cycle
        end 
        else shift_ena = 1'b0;    //else shift_ena is set to 0 after 4 cycles are exhausted
    end

endmodule
