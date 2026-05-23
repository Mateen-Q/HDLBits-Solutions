module top_module (
    input clk,
    input reset,
    input s,
    input w,
    output reg z
);

    parameter A    = 4'd0,    //initial state

              B0 = 4'd1,      //state when s = 1
              S1_0 = 4'd2,    //state 0
              S1_1 = 4'd3,    //state 1
              S2_0 = 4'd4,    //state 00 -> always goes to BAD no matter the next w
              S2_1 = 4'd5,    //state 10 or 01
              S2_2 = 4'd6,    //state 11

              GOOD = 4'd7,    //reached when exactly 2 1's are found
              BAD  = 4'd8;    //reached when less than or more than 2 1's are found

    reg [3:0] cs, ns;

    always @(*) begin
        case(cs)

            A: begin         //state A is when we are dependent on s
                if(s)
                    ns = B0;   //if s = 1 we go to state B0
                else
                    ns = A;    //else we stay on state A
            end

            // first sample
            B0: begin
                if(w)
                    ns = S1_1;   //if we encounter a 1 we go to S1_1;
                else
                    ns = S1_0;   //if we encounter a 0 we go to s1_0;
            end

            S1_0: begin
                if(w)
                    ns = S2_1;  //if we encounter a 1 again after S1_0(i.e. 0 already encountered) we go to S2_1(i.e. state 01 or 10)
                else
                    ns = S2_0;  //if we encounter a 0 after S1_0(i.e. 0 already encountered) so we have 2 00, we definately know this will lead to BAD even if we get a 1 in the next Iteration
            end

            S1_1: begin
                if(w)
                    ns = S2_2; //if we encounter a 1 after S1_1(i.e. 1 already encountered) we go to S2_2(i.e. state 11)
                else
                    ns = S2_1; //if we encounter a 0 after S1_1(i.e. 1 already encountered) we go to S2_1(i.e. state 10 or 01)
            end

            S2_0: begin
                    ns = BAD;     //after S2_0(i.e. 00, we know next state is BAD whether input w = 1 or 0)
            end

            S2_1: begin
                if(w)
                    ns = GOOD;    //if we are in state S2_1(i.e. 10 or 01, then if w = 1 we go to GOOD)
                else
                    ns = BAD;     //else we go to BAD if we get 0;
            end

            S2_2: begin
                if(w)
                    ns = BAD;     //after S2_2(i.e. 11) then we go to BAD if we get 1 because we want exactly 2 1's, else we go to GOOD(110)
                else
                    ns = GOOD;    //after S2_2(i.e. 11) then we go to GOOD if we get 0 because (110) gets 0
            end

            GOOD: begin
                if(w)
                    ns = S1_1;   //after GOOD if we get 1 again we go to S1_1
                else
                    ns = S1_0;  //else if we get 0 we go to S1_0
            end

            BAD: begin
                if(w)
                    ns = S1_1; //after BAD if we get 1 again we go to S1_1
                else
                    ns = S1_0; //else if we get 0 we go to S1_0
            end

            default: ns = A;

        endcase
    end

    //================================================
    // State register
    //================================================
    always @(posedge clk) begin
        if(reset)
            cs <= A;
        else
            cs <= ns;
    end

    //================================================
    // Moore output logic
    //================================================
    always @(*) begin
        case(cs)
            GOOD: z = 1;     //if we are on a GOOD state i.e. 2 1's were detected we output z =1;
            default: z = 0;  //if we are on a BAD or ANY other state i.e. 2 1's were not detected we output z = 0;
        endcase
    end

endmodule