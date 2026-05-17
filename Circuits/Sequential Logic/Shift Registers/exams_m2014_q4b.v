module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); 
    /*

    lets first see the Mapping in the question :

    R - SW
    clk = KEY[0]
    E to KEY[1],
    L to KEY[2], and
    w to KEY[3].
    Connect the outputs to the red lights LEDR[3:0].


    */

    //MUXDFF (w,        E,     R,    L,    clk,  output Q);
    MUXDFF d1(KEY[3], KEY[1],SW[3],KEY[2],KEY[0],LEDR[3]);   //first instantiation (gets initial input W(KEY[0]))
    MUXDFF d2(LEDR[3],KEY[1],SW[2],KEY[2],KEY[0],LEDR[2]);   //second instantiation
    MUXDFF d3(LEDR[2],KEY[1],SW[1],KEY[2],KEY[0],LEDR[1]);   //third instantiation
    MUXDFF d4(LEDR[1],KEY[1],SW[0],KEY[2],KEY[0],LEDR[0]);   //fourth instantiation 
    

endmodule

module MUXDFF (input w,E,R,L,clk,output Q);
    always@(posedge clk) begin      //here we declare the module that will be repeated 4 times
        Q <= L?R:(E?w:Q);    //if L is high Q gets R else it gets output of E mux, in E mux if E is high, it produces w else gives out Q again
    end
endmodule
