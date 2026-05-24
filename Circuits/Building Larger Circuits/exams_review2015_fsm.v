
module top_module (
    input clk,
    input reset,
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack
);

    parameter IDLE  = 3'd0,  //defined IDLE state where machine will be incase it does not find anything
              S1    = 3'd1,  //defined S1 state where machine will be one finding 1
              S11   = 3'd2,  //S11 is where machine will be on finding 11
              S110  = 3'd3,  //S110 is where machine will be on finding 110
              S1101 = 3'd4,  //S1101 is where machine will be on finding 1101
              SE    = 3'd5,  //Shift Enable state is where machine will have Shift enabled for 3 more cycles
              COUNT = 3'd6,  //COUNT is the state where machine will be in when counter is working and will exit only when done_counting is received
              DONE  = 3'd7;  //DONE is the state where counter will be after done_counting signal is received until user acknowledges

    reg [2:0] cs, ns;  //defined 2 registers to hold current state and next state
    reg [1:0] count;   //defined a count register to count 3 cycles in SE state(1 cycle is already covered when Shift_ena goes high in state 1101)


    always @(*) begin
        case(cs)

            IDLE:  ns = data ? S1 : IDLE;   //machine leaves IDLE state only when it finds data=1(the first 1) and goes to S1, else stays in IDLE

            S1:    ns = data ? S11 : IDLE; //when in S1,if machine finds data =0, it goes back to IDLE, if it finds data =1, it goes to S11

            S11:   ns = data ? S11 : S110; //when in S11, if machine finds data=0, it goes to state S110, if data=1 it stays in S11

            S110:  ns = data ? S1101 : IDLE; //when in S110 if machine finds data = 1, it goes to state S1101, else if data =0, it goes back to IDLE and starts again

            S1101: ns = SE; //when in S1101, next state is definately SE(or the Shift enabled state)

            SE: begin   //when in SE, we need to be there for 3 cycles, so 1 cycle of S1101 and 3 cycles of SE, we complete 4 cycles of SE being high
                if(count == 2'd2)  //if we hit count = 2(counting from 0->2) we go to next state COUNT
                    ns = COUNT;
                else
                    ns = SE;  //else we stay in SE (incrementing logic of count is implemented outside in a clocked always block because increment logics are never implemented inside a combinational always block)
            end

            COUNT:
                ns = done_counting ? DONE : COUNT; //once in COUNT, we stay in COUNT until we receive the done_counting signal from the counter, in that case we go to DONE

            DONE: 
                ns = ack ? IDLE : DONE;  //once in DONE state, we stay there until we receive an ACK signal from the user, and when we do, we go back to IDLE and start from scratch again

            default:
                ns = IDLE;

        endcase
    end

  
    always @(posedge clk) begin

        if(reset) begin   //when reset, we set the state to IDLE and count to 0
            cs <= IDLE;
            count <= 2'd0;
        end
        else begin

            cs <= ns;  //else we move to next state

            if(cs == SE)  //and if we are in cs == SE then we also increment the count from here
                count <= count + 1'b1;
            else
                count <= 2'd0;  //otherwise if we are in any other state we set count to 0.

        end
    end

    //========================================
    // Outputs
    //========================================
    assign shift_ena = (cs == SE) || (cs == S1101);  //shift ena is high when we are in S1101(1 cycle) and in SE(for 3 cycles) so total 4 cycles
    assign counting  = (cs == COUNT);  //counting is high when we are in COUNT state
    assign done      = (cs == DONE);  //DONE is high when we are in DONE state

endmodule

/*

ALTERNATIVE SOLUTION USING MULTIPLE SHIFTENABLE STATES INSTEAD OF A COUNTER

module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    
    parameter IDLE = 4'd0,
    S1 = 4'd1,
    S11 = 4'd2,
    S110 = 4'd3,
    S1101 = 4'd4,
    SE1 = 4'd5,
    SE2 = 4'd6,
    SE3 = 4'd7,
    COUNT = 4'd8,
    DONE = 4'd9;
    
    
    reg [3:0] cs, ns;
      
    always@(*)begin
        case(cs)
            IDLE: ns = data?S1:IDLE;
            S1: ns = data?S11:IDLE;
            S11: ns = data?S11:S110;
            S110: ns = data?S1101:IDLE;
            S1101: ns = SE1;
            SE1: ns = SE2;
            SE2: ns = SE3;
            SE3: ns = COUNT;
            COUNT: ns = done_counting?DONE:COUNT;
            DONE: ns = ack?IDLE:DONE;
            default: ns = IDLE;
        endcase
    end
    
    always@(posedge clk) begin
        if(reset) begin
            cs <= IDLE;
         end
        else cs <= ns;
    end
    
    
    assign shift_ena = (cs == S1101) || (cs==SE1)|| (cs==SE2)|| (cs==SE3);
    assign counting = (cs==COUNT);
    assign done = (cs==DONE);
    
    

endmodule

*/