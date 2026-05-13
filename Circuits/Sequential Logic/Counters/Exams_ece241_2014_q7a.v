module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
  );
    
  
    
    assign c_enable = enable;  //c_enable will be the same as enable signal we receive

    assign c_load = (reset | ((Q == 12) & enable));  //c_load will be either when reset or when Q reaches 12 and theres enable
    assign c_d = c_load;  //c_d will be the same as c_load
        
    count4 the_counter (clk, c_enable, c_load, c_d, Q);

endmodule