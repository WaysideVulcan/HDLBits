module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
	
    reg [2:0] q;
    always@(posedge clk)begin
        if(~resetn)
        {q[2:0],out} <= 0;
        else
        {q[2:0],out} <= {in , q[2:0]};
    end
endmodule