module top_module( input in, output out );
	assign out = ~in;
    // another way
    // not(out,in);
endmodule