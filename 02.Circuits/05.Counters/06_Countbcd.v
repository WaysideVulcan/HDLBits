module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    wire ena0;
    always@(posedge clk)begin
        if(reset)
            ena0 = 1;
    end
    assign ena[1] = (q[3:0]  == 4'h9);
    assign ena[2] = (q[7:0]  == 8'h99);
    assign ena[3] = (q[11:0] == 12'h999);
    
    count_10 u0 (clk , reset , ena0 , q[3:0]);
    count_10 u1 (clk , reset , ena[1] , q[7:4]);
    count_10 u2 (clk , reset , ena[2] , q[11:8]);
    count_10 u3 (clk , reset , ena[3] , q[15:12]);
endmodule

module count_10(
	input clk,
    input reset,
    input count_ena,
    output [3:0] q
);
    
    always@(posedge clk)begin
        if(reset)
            q<=0;
        else if(count_ena && q==9)
            q <= 0;
        else
            q <= (count_ena) ? q+1 : q;
    end
    
endmodule