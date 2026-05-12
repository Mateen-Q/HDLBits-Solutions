module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    
    wire [2:0] interCarry; //declaring a 3 bit wire to transfer intermediate carries between modules
    
    bcd_fadd f1(a[3:0],b[3:0],cin,interCarry[0],sum[3:0]); //instantiated adder 1 that adds the
    
    //lowest 4 bits (3:0), takes the provided carryIn and stores sum in lowest 4 bits of sum(3:0)
    //and gives the CarryOUT into the interCarry intermediate wire that will take the carryOUT from
    //this added and provide it as carry in to the next

    bcd_fadd f2(a[7:4],b[7:4],interCarry[0],interCarry[1],sum[7:4]); 

    //adder 2 takes the CarryOUT of adder1 that came from interCarry[0] as carryIN and performs
    //the sum of lowerMID 4 bits of a and b(bits 7:4) then it gives a carryOUT to the intermediate
    //wire between adder2 and adder3(interCarry[1]). and stores the sum in lowerMID bits of 
    //sum (7:4)



    bcd_fadd f3(a[11:8],b[11:8],interCarry[1],interCarry[2],sum[11:8]); //same process as the previous 2 happens
    bcd_fadd f4(a[15:12],b[15:12],interCarry[2],cout,sum[15:12]);//finally the carryOUT of this adder
    //is given as actual cout out of the entire 16 bit adder.

endmodule
