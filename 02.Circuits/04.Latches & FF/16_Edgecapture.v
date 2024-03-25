module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] d_last;	

    always@(posedge clk)begin
				d_last <= in;
        if(reset)
            out <= 0 ;
        else begin		
					out <= ~in & d_last | out;
        end    
    end
endmodule