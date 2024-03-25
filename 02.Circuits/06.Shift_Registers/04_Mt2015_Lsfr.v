module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q

    ff u0(KEY[0] , KEY[1] , SW[0] , LEDR[2] , LEDR[0]);
    ff u1(KEY[0] , KEY[1] , SW[1] , LEDR[0] , LEDR[1]);
    ff u2(KEY[0] , KEY[1] , SW[2] , LEDR[1]^LEDR[2] , LEDR[2]);

endmodule

module ff (
    input clk,
	input L,
    input r,in,
    output reg q);
    
    always@(posedge clk)
        q <= L ? r : in;
    
endmodule