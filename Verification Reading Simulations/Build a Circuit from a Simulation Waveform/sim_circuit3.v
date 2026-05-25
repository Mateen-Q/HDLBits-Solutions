module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );


    /*
    
    - lets observe and plot the given waveform output against a,b,c,d

       ,a,b,c,d     q

    0   0,0,0,0,    0
    1   0,0,0,1,    0 
    2   0,0,1,0,    0
    3   0,0,1,1,    0
    4   0,1,0,0,    0
    5   0,1,0,1,    1
    6   0,1,1,0,    1
    7   0,1,1,1,    1
    8   1,0,0,0,    0
    9   1,0,0,1,    1
    10  1,0,1,0,    1
    11  1,0,1,1,    1
    12  1,1,0,0,    0
    13  1,1,0,1,    1
    14  1,1,1,0,    1
    15  1,1,1,1,    1   


    if we solved this using a kmap (signal high at 5,6,7,9,10,11,13,14,15)
    we will get an expression (a|b)&(d|c)


    
    
    
    */

    assign q = (a|b)&(c|d); 

endmodule
