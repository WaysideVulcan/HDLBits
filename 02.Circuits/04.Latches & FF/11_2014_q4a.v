module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    wire O1;
    assign O1 = E ? w : Q;
    always@(posedge clk)
        Q <= L ? R : O1 ;
endmodule