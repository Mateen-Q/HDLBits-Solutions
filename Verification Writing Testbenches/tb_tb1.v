module top_module ( output reg A, output reg B );//

    initial begin
        A = 1'b0; B =1'b0;  //initially values are 0 0
        #10                 //those values are held for 10 time units(0-10)
        A = 1'b1; B = 1'b0; //then values become 1 0
        #5                  //1 0 is held for 5 time units(10-15)
        A = 1'b1; B = 1'b1; //then value become 1 1
        #5                  //1 1 is held for another 5 time units(15-20)
        A = 1'b0; B = 1'b1; //then values become 0 1
        #20                 //0 1 is held for another 20 time units(20-40)
        A = 1'b0; B = 1'b0; //then values become 0 0
        #10;                //0 0 is held for another 10 time units(40-50)
    end

endmodule
