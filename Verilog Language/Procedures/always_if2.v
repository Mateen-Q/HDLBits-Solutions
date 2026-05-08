// synthesis verilog_input_version verilog_2001
module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); //

    always @(*) begin
        if (cpu_overheated)
           shut_off_computer = 1;
        else                            //add an else condition to make shut_computer_off flag =0
                                        //incase the cpu is not overheated or else it will shutoff once
                                        //and never turn on again even if cpu cools down
           shut_off_computer = 0;
    end

    always @(*) begin
        if (~arrived && ~gas_tank_empty)  //added a condition that keep_driving can only happen if gas tank is not empty
           keep_driving = ~gas_tank_empty;
        else                              //add an else condition to ensure in all other cases we stop driving such as:
                                          // 1) arrived and gas tank is not empty (arrived && ~gas_tank_empty)
                                          // 2) not arrived and gas tank is empty (~arrived && gas_tank_empty)
                                          // 3) arrived and gas tank is empty    (arrived && gas_tank_empty)
            keep_driving = 0;
    end

endmodule
