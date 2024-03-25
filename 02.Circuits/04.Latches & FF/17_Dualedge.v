module top_module (
    input clk,
    input d,
    output q
);
    wire qp , qn;
    
    always@(posedge clk )begin
    	qp <= d;
    end
    
    always@(negedge clk )begin
    	qn <= d;
    end
    
    assign q = clk ? qp : qn;
endmodule