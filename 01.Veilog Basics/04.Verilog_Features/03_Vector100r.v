module top_module( 
    input [99:0] in,
    output [99:0] out
);
	generate
    	genvar i;
        for( i = 0; i <= 99 ; i = i+1)begin:reverse
        	assign out[i] = in[99-i];
        end
	endgenerate
endmodule