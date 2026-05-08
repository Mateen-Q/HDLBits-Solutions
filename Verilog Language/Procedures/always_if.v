// synthesis verilog_input_version verilog_2001
module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   ); 
    
    assign out_assign = sel_b1?(sel_b2?b:a):a;  //using the assign statement and ternary operator
                                                //incase sel_b1 is 1 and sel_b2 is 1 it will output b
                                                //else all cases out will be assigned to a;
    
    always@(*) begin      //if else condition can only be inside procedural blocks
        
        if(sel_b1 == 1'b1 && sel_b2 == 1'b1) begin out_always = b; end   //if condition to check whether both 
                                                                         //sel_b1 and sel_b2 are 1 then output b

        else begin out_always = a; end   //in all else cases output is set to a
 
    end

endmodule
