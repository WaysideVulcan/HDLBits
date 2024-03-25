module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

    always@(posedge clk)begin
        if(reset)
            ss <= 0;
        else if(ena)begin
            if(ss == 8'h59)
                ss <= 0;
            else begin
                ss[3:0] <= (ss[3:0]<4'h9) ? ss[3:0]+1 : 0;
                ss[7:4] <= (ss[3:0]<4'h9) ? ss[7:4] : ss[7:4]+1;
            end
        end
    end
    
    always@(posedge clk)begin
        if(reset)
            mm <= 0;
        else if(ena)begin
            if(ss == 8'h59)
                if(ss == 8'h59 && mm == 8'h59)
                mm <= 0;
            else begin
                mm[3:0] <= (mm[3:0]<4'h9) ? mm[3:0]+1 : 0;
                mm[7:4] <= (mm[3:0]<4'h9) ? mm[7:4] : mm[7:4]+1;
            end
        end
    end
    
    always@(posedge clk)begin
        if(reset)
            hh <= 8'h12;
        else if(ena)begin
            if(ss == 8'h59 && mm==8'h59)
                if(hh == 8'h12)
                	hh <= 1;
            else begin
                hh[3:0] <= (hh[3:0]<4'h9) ? hh[3:0]+1 : 0;
                hh[7:4] <= (hh[3:0]<4'h9) ? hh[7:4] : 1;
            end
        end
    end
    
    always@(posedge clk)begin
        if(reset) 
            pm <=0;
        else if(ss == 8'h59 && mm == 8'h59 && hh == 8'h11)
            pm = ~pm;
    end
endmodule