`default_nettype none    //this line makes sure implicit net declarations do not go unnoticed
module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  ); 

    /*
    - a vector is essentially grouping multiple bits together, we might need it when bits are
      related to each other for example to group 4 bits of in input in a 4 bit ALU
    - an n bit vector can be declared as :  ' wire [x:y] vectorName ' **Note: (x-y)+1 = n; 
    - x and y can be any numbers their difference must be n
    - vectorName[x] will be the MSB and vectorName[y] will be the LSB
    - in this problem we are already given a vector input and we need to connect it to a 
      vector output and inidividual bit outputs
    
    - outv will be vec as it is
    - o2 will be connected to 2nd bit of vec
    - o1 will be connected to 1st bit of vec
    - o0 will be connected to 0th bit of vec

    */

    
    assign outv = vec;   //here we assign outv direclty to vec
    assign o2 = vec[2];  //here we assign o2 to 2nd bit of vec accessed as : 'vec[2]'
    assign o1 = vec[1];  //here we assign o1 to 1st bit of vec accessed as : 'vec[1]'
    assign o0 = vec[0];  //here we assign o0 to 0th bit of vec accessed as : 'vec[0]'


    /*
    
    We can also perform the entire assignment at once as 

    assign {o2,o1,o0} = vec;   //remember, vec was declared as vec[2:0] so 2nd index is MSB
                               // this is why we wrote {o2,o1,o0} not {o0,o1,o2}
    
    */

endmodule
