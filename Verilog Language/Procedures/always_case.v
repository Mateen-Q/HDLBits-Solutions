// synthesis verilog_input_version verilog_2001
module top_module ( 
    input [2:0] sel, 
    input [3:0] data0,
    input [3:0] data1,
    input [3:0] data2,
    input [3:0] data3,
    input [3:0] data4,
    input [3:0] data5,
    output reg [3:0] out   );//

    always@(*) begin  // This is a combinational circuit
        case(sel)         //the variable for case will be sel because based on sel we will assign diff outputs to out
            3'd0: out = data0;    //if sel = decimal value 0, then out will get data0
            3'd1: out = data1;    //if sel = decimal value 1, then out will get data1
            3'd2: out = data2;    //if sel = decimal value 2, then out will get data2
            3'd3: out = data3;    //if sel = decimal value 3, then out will get data3
            3'd4: out = data4;    //if sel = decimal value 4, then out will get data4
            3'd5: out = data5;    //if sel = decimal value 5, then out will get data5

//NOTE: 3'd0 -> 3 implies that minimum of 3 bits are required in binary to represent the decimal value thats about to follow
//              d implies that the value thats about to follow d is a decimal
//              0 implies the value
//              we chose 3 here because max value we needed to compare was 5 and in binary thats 101 (requiring 3 bits)
            
            default: out = 4'b0;   // a defaul value for ouput will be 0000 incase no case matches the value of sel

        endcase      //endcase is required to mark the ending of a case statment
    end

endmodule
