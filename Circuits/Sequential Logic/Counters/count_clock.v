module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    

    //we will solve this problem just like the previous 4 digit counter problem
    
    wire ena_h1,ena_h2, ena_m1,ena_m2, ena_s1;  
    //lets declare 1 bit wires that will declare whether each hour,min and second bit of clock should increment


    assign ena_s1 = (ss[3:0] == 4'd9);   //second digit of seconds only increments when 1st digit reaches 9
    assign ena_m1 = ({ss[7:4],ss[3:0]} == {4'd5,4'd9}); //first digit of min increments when ss hits 59
    assign ena_m2 = ({mm[3:0],ss[7:4],ss[3:0]} == {4'd9,4'd5,4'd9}); //second digit of min increments only when previous digit hits 9 and seconds hit 59
    assign ena_h1 = ({mm[7:4],mm[3:0],ss[7:4],ss[3:0]} == {4'd5,4'd9,4'd5,4'd9}); //first digit of hour increments only when previous minutes and seconds both hit 59:59
    assign ena_h2 = ({hh[3:0],mm[7:4],mm[3:0],ss[7:4],ss[3:0]} == {4'd9,4'd5,4'd9,4'd5,4'd9}); //second digit of hour increments only when first digit of hours hit 9 and minutes and seconds hit 59:59
                                                                                                //i.e. at 9:59:59
    
    
    always@(posedge clk) begin
        
          
        if(reset) begin                       //when reset is hit clock is set to 12:00:00
            {hh[7:4],hh[3:0]} <= {4'd1,4'd2};   //hh = 12
            {mm[7:4],mm[3:0]} <= {4'd0,4'd0};   //mm = 00
            {ss[7:4],ss[3:0]} <= {4'd0,4'd0};   //ss = 00
            pm = 0;                             //pm = 0 (pm =0 means AM and pm = 1 means PM)
        end
        
         
        else if({hh[7:4],hh[3:0]} == {4'd1,4'd2} &&       
                {mm[7:4],mm[3:0]} == {4'd5,4'd9} &&
                {ss[7:4],ss[3:0]} == {4'd5,4'd9}) begin   //next we consider this edge case where clock hits 12:59:59
                                                        //then it should go to 12:00:00, if we did not consider this edge case
                                                        //clock would go on to 13:00:00 but we only made a 12-hr clock not a 24 hr one
            
            {hh[7:4],hh[3:0]} <= {4'd0,4'd1};    // hh = 01
            {mm[7:4],mm[3:0]} <= {4'd0,4'd0};    // mm = 00
            {ss[7:4],ss[3:0]} <= {4'd0,4'd0};    // ss = 00
        end
        
        else if(ena_h2) begin               //if ena_h2 is high then it means we can increment 2nd digit of h 
            hh[7:4] <= hh[7:4] + 1'b1;     //incrementing 2nd digit 
            hh[3:0] <= 0;                   //setting previous digit to 0
            {mm[7:4],mm[3:0]} <= {4'd0,4'd0};  //setting minutes to 0
            {ss[7:4],ss[3:0]} <= {4'd0,4'd0};  //setting seconds to 0
        end
        
        else if(ena_h1) begin   //if ena_h1 is high then it means we can increment 1st digit of h
            

            //again we have an edge case where we need to consider what happens when clock hits 11:59:59
            //by ena_h1 it will go on to 12:00:00, but at these cases we also need to toggle the 'pm' bit
            //so we specify this special case within ena_h1
            if( {hh[7:4],hh[3:0]} == {4'd1,4'd1} &&       
                {mm[7:4],mm[3:0]} <= {4'd5,4'd9} &&      
                {ss[7:4],ss[3:0]} <= {4'd5,4'd9}) begin
                
                {hh[7:4],hh[3:0]} <= {4'd1,4'd2};
                {mm[7:4],mm[3:0]} <= {4'd0,4'd0};
                {ss[7:4],ss[3:0]} <= {4'd0,4'd0};
            	pm = ~pm;
            end

            //if normal cases are encountered,
            
            else begin
            hh[3:0] <= hh[3:0] + 1'b1;   //1st digit of hh will be incremented
            {mm[7:4],mm[3:0]} <= {4'd0,4'd0};  //the minutes will be set to 00
            {ss[7:4],ss[3:0]} <= {4'd0,4'd0};  //the hours will be set to 00
            end
        end
        
        else if(ena_m2) begin    //if ena_m2 is high that means we can increment second digit of mm
            mm[7:4] <= mm[7:4] + 1'b1;  //1st digit of mm is incremented
            mm[3:0] <= 0;               //2nd digit set to 0 again
            {ss[7:4],ss[3:0]} <= {4'd0,4'd0};  //seconds set to 00
        end
        
        else if(ena_m1) begin   //if ena_m1 is high that means we can increment first digit of mm
            mm[3:0] <= mm[3:0] + 1'b1;  //1st digit of mm is incremented
            {ss[7:4],ss[3:0]} <= {4'd0,4'd0};  //seconds are set to ss = 00;
        end
        
        else if(ena_s1 && ena) begin    //if ena_s1 is high that means we can increment second digit of ss, but seconds can only
                                        //be incremented when enable is also active! so we check that too

            ss[7:4] <= ss[7:4] + 1'b1;  //incrementing the second digit of seconds
            ss[3:0] <= 0;               //first digit is set to 0;
        end
        
        else if(ena) ss[3:0] <= ss[3:0] + 1'b1;     //if none of the above if conditions have satisfied that means we can
                                                    //still increment first digit of seconds, so enable is checked and if
                                                    //enable is high then seconds are incremented.
    end

endmodule
