module top_module (
	input clk,
	input [7:0] d,
	input [1:0] sel,
	output reg [7:0] q
);

	wire [7:0] o1, o2, o3;		// output of each my_dff8
	
	// Instantiate three my_dff8s
	my_dff8 d1 ( clk, d, o1 );
	my_dff8 d2 ( clk, o1, o2 );
	my_dff8 d3 ( clk, o2, o3 );

	// This is one way to make a 4-to-1 multiplexer
	always @(*)		// Combinational always block
		case(sel)
			0: q = d;
			1: q = o1;
			2: q = o2;
			3: q = o3;
		endcase

endmodule