module top_module();
    
    reg clk, in;
    reg [2:0] s;
    wire out;

    //in verilog all initial blocks run paralelly so we decided to declare seperate blocks for, clk , in and s
    //to keep code understandable and maintable
    
    initial begin    //declared one initial block to assign the initial value of clk
        clk = 0;
    end
    
    initial begin   //declared on initial block for in
        in = 0;     //initially in=0
        #20         //in stays 0 for 20 time units(TU)
        in = 1;     //then in = 1
        #10         //in stays 1 for 10 time units(TU)
        in = 0;     //then in = 0
        #10         //in stays 0 for 10 time units(TU)
        in = 1;     //then in = 1
        #30         //in stays 1 for 30 time units(TU)
        in = 0;     //then in = 0
        #5;         //in stays 0 for 5 time units(TU)
    end
    
    initial begin
        s = 3'd2;   //just like in, we obsereved s and kept it at specific values for specific time durations
        #10
        s = 3'd6;
        #10
        s = 3'd2;
        #10 
        s = 3'd7;
        #10
        s = 3'd0;
        #35;
    end
    
    always #5 clk = ~clk;   //clock signals flip every 5 seconds as we can observe from the waveform
    
    q7 inst(clk,in,s,out);  //insantiated q7 and passed all our declared variables to it in order
    
        

endmodule
