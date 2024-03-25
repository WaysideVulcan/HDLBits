module top_module( 
    input [254:0] in,
    output [7:0] out );
	int i;
    always@(*)begin
        out = 8'd0;
        for(i = 0; i<= 254; i = i+1)
            out = out + in[i];
    end
    
endmodule