module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack 
  );

  //the previous 4 questions explain everything, this question just combines all 4 circuits

	localparam [3:0] IDLE	= 0,
					 S1		= 1,
					 S11	= 2,
					 S110	= 3,
					 S1101	= 4,	//'S1101' and 'SHIFT0' can be regarded as one state.
					 SE1 = 5,
					 SE2 = 6,
					 SE3 = 7,
					 COUNT  = 8,
					 DONE   = 9; 
	
    reg [3:0] cs, ns;
    reg [9:0] tcount; 

    //state transition logic stays same

	always @(*) begin
        case (cs) 
			IDLE  : ns = (data) ? S1    : IDLE;
			S1    : ns = (data) ? S11   : IDLE;
			S11   : ns = (data) ? S11   : S110;
			S110  : ns = (data) ? S1101 : IDLE;
			S1101 : ns = SE1;
			SE1: ns = SE2;
			SE2: ns = SE3;
			SE3: ns = COUNT;
            COUNT : ns = (count == 0 & tcount == 999) ? DONE : COUNT; //except we stay in count state until we have counted 1000 the specified amount of times
			DONE  : ns = (ack) ? IDLE : DONE;			
		endcase
	end

	//state transition
	always @(posedge clk) begin
        if (reset) cs <= IDLE;    
		else cs <= ns;
	end

	//shift in and then down count.
	always @(posedge clk) begin
        case (cs) 
			S1101 : count[3] <= data;  //first bit to MSB as soon as we find sequence 1101  
			SE1: count[2] <= data;   //second bit to NMSB
			SE2: count[1] <= data;   //third bit to NMSB
			SE3: count[0] <= data;   //4th bit to LSB

			COUNT : begin             //counter logic to stay in COUNT state until we have counted specified amounts of time
				if (count >= 0) begin
                    if (tcount < 999)    //count to 1000
						tcount <= tcount + 1'b1; //increment until reached thousand
					else begin
						count <= count - 1'b1;   //else if we have counted to thousand once, reduce count by 1
						tcount <= 0;  //then set thousand count to 0 and then count again until we've counted 1000 'count' number of times
					end
				end
			end
			default : tcount <= 0;
		endcase
	end

    assign counting = (cs == COUNT);   //counting will be asserted as long as we are in count state
    assign done = (cs == DONE);       //done will be asserted as soon as we are done counting


endmodule