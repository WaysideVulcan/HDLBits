module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
 
    // assign s = ...
    // assign overflow = ...
	assign s = a + b;
    assign overflow = (a[7]==b[7])? s[7]^a[7]:1'b0 ; 
    //Determine if the sign bits are the same
    //if they are, determine if the sign of the sum is the same as the sign of the addition

endmodule