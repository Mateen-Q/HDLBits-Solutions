module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q


    always@(posedge KEY[0]) begin
        LEDR <= {  KEY[1]?SW[2]:LEDR[1]^LEDR[2]  , KEY[1]?SW[1]:LEDR[0] , KEY[1] ? SW[0]:LEDR[2]  };

        /*
        
        first of all let me tell you the mapping,
        Q is LEDR
        clk is KEY[0]
        L is KEY[1]
        R0 is SW[0]
        R1 is SW[1]
        R2 is SW[2]


        so, essentially what we are doing here is,

        Q[2] gets R2 if L is high else it gets Q[1]^Q[2]
        so we implement a mux : 
                    KEY[1] ? SW[2] : LEDR[1]^LEDR[2] ;   //according to mapping we replace Q by LEDR, L by KEY[1] and so on

        Q[1] gets R1 if L is high else it gets Q0
        so we implement a mux : 
                    KEY[1] ? SW[1] : LEDR[0] ;

        Q[0] gets R0 if L is high else it gets Q2
        so we implement a mux : 
                    KEY[1] ? SW[0] : LEDR[2] ;


        instead of individually writing : 
        LEDR[2] = KEY[1] ? SW[2] : LEDR[1]^LEDR[2]
        LEDR[1] = KEY[1] ? SW[1] : LEDR[0]
        LEDR[2] = KEY[1] ? SW[0] : LEDR[2]

        we just use the concatenation operator : 

        LEDR <= {  KEY[1]?SW[2]:LEDR[1]^LEDR[2]  , KEY[1]?SW[1]:LEDR[0] , KEY[1] ? SW[0]:LEDR[2]  };

        so we can write the solution in a single line

        
        */
    end
endmodule
