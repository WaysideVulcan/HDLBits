module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //

    MUXDFF M0( KEY[0] , KEY[1] , KEY[2] , KEY[3] ,  SW[3] , LEDR[3]);
    MUXDFF M1( KEY[0] , KEY[1] , KEY[2] , LEDR[3] , SW[2] , LEDR[2]);
    MUXDFF M2( KEY[0] , KEY[1] , KEY[2] , LEDR[2] , SW[1] , LEDR[1]);
    MUXDFF M3( KEY[0] , KEY[1] , KEY[2] , LEDR[1] , SW[0] , LEDR[0]);
endmodule

module MUXDFF (
    input clk,
    input E,L,w,R,
    output Q);
	
    wire Di,D;
    assign Di = E ? w : Q;
    assign D = L ? R : Di;
    
    always@(posedge clk)
        Q <= D;
endmodule