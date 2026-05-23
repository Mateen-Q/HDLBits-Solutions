module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    
    parameter CONN=2'b00, CON1=2'b01, CONF=2'b10;
    reg [1:0] state, state_next;
    
    always @(posedge clk or posedge areset)
        begin
            if (areset)
            state <= CONN;
    		else
            state <= state_next;
    	end
    
    always @(*)
        begin
            case (state)
                CONN: begin
                    if (x) state_next <= CON1;
                    else   state_next <= CONN;
                end
                B: begin
                    if (x) state_next <= CONF;
                    else   state_next <= CONN1;
                end
                C: begin
                    if (x) state_next <= CONF;
                    else   state_next <= CON1;
                end
                default:   state_next <= CONN;
            endcase
        end
    
    assign z = (state == B);
        
endmodule