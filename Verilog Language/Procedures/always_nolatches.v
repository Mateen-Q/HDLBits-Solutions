// synthesis verilog_input_version verilog_2001
module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  ); 
    
    always@(*) begin
        up = 1'b0; down = 1'b0; left = 1'b0; right = 1'b0;  
    
/*setting all values to 0 initially

we do this so we won't have to assign a 0 to all the rest of the values once a scancode for 
one specific direction comes up for ex. if scancode for left comes up, we will need to assign 
left = 1, right = 0, down = 0, up = 0. to avoid writing so much code we simply just initialize 
all to 0, so when scancode for left comes up only left needs to be set to 1 because rest of 
the bits are already 0.

*/


        case(scancode)
            16'he06b:	left = 1'b1;
            16'he072:	down = 1'b1;
            16'he074:	right1 = 1'b1;
            16'he075:	up = 1'b1;
            default: begin
                up = 1'b0; down = 1'b0; left = 1'b0; right = 1'b0;
            end
        endcase   
    end
endmodule
