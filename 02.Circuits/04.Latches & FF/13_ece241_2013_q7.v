module top_module (
    input clk,
    input j,
    input k,
    output Q); 

    always@(posedge clk)begin        
        Q <= ~k&Q | j&~Q;
    end
endmodule