module top_module (
	input [3:0] in,
	output reg [1:0] pos
);

	always @(*) begin			// Combinational always block
		case (in)
			4'd0: pos = 2'd0;	   //compare with 4'd0 = 0000, no 1 is found so we output 0
			4'd1: pos = 2'd0;      //comapre with 4'd1 = 0001, 1 is found at index 0, so we output 0 as 2'd0
			4'd2: pos = 2'd1;      //comapre with 4'd2 = 0010, 1 is found at index 1, so we output 1 as 2'd1
			4'd3: pos = 2'd0;      //similarly for all cases we see what index holds the first 1 and output the index
			4'd4: pos = 2'd2;
			4'd5: pos = 2'd0;
			4'd6: pos = 2'd1;
			4'd7: pos = 2'd0;
			4'd8: pos = 2'd3;
			4'd9: pos = 2'd0;
			4'd10: pos = 2'd1;
			4'd11: pos = 2'd0;
			4'd12: pos = 2'd2;
			4'd13: pos = 2'd0;
			4'd14: pos = 2'd1;
			4'd15: pos = 2'd0;
			default: pos = 2'b0;	

//we're using decimal notations because those are easier to write
//writing 4'd5 is easier compared to writing 4'b0101

		endcase
	end
	
endmodule