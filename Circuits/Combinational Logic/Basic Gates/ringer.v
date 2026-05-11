module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);

/*

    - we need the motor to vibrate when the phone rings and the phone is on vibrate mode
      so, motor = ring & vibrate_mode
    - we need the ringer to go on when the phone rings and it is NOT on vibrate_mode
      so, ringer = ring & ~vibrate_mode.

*/
    
    assign motor = ring&vibrate_mode;   //so we assign motor to ring&vibrate_mode
    assign ringer = ring&(~vibrate_mode); //and ringer to ring&(~vibrate_mode)

endmodule
