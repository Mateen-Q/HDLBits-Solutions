`timescale 1ps/1ps   //defined unit of time and timestep
module top_module ( );
    
    reg clk;   //declared a register clk 
    always #5 clk = ~clk;   // #5 means every 5 units of time clk signal gets flipped(ps in this case, thats defined at the starting of verilog file using `timescale function)
    						//this would give us a clock signal of duty cycle 10 ps (5 on, 5 off)
    
    initial clk = 1'b0;     //initially we set clock to 0(because first transition needs to be from 0 to 1)
    
    dut clk1(clk);     //then we feed the signal into the dut module

endmodule
