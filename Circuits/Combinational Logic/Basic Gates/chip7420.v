module top_module ( 
    input p1a, p1b, p1c, p1d,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    
    assign p1y = ~(p1a & p1b & p1c & p1d); //performing NAND amongst p1a, p1b, p1c, p1d and assiging to p1y
    assign p2y = ~(p2a & p2b & p2c & p2d); //performing NAND amongst p2a, p2b, p2c, p2d and assiging to p2y


endmodule
