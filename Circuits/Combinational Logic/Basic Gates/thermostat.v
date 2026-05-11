module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    
    assign heater = mode & too_cold;  //heater should only be turned on when thermostat is in
                                      //heating mode(mode=1) and its too cold(too_cold = 1)
                                      //hence heater = mode&too_cold


    assign fan = fan_on | aircon | heater;  //Fan should be on when either heater or aircon is on
                                            //or if both are ON or if the fan is requested to do so
    assign aircon = (~mode) & too_hot; //aircon should only be turned on when thermostat is in
                                       //cooling mode(mode=0) and its too hot(too_hot = 1)
                                       //hence heater = (~mode)&too_hot

endmodule
