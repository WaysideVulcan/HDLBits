module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);

    reg[1:0] count;
    always@(posedge clk)begin
        if(reset)begin
            count <= 0;
        	shift_ena <= 1;
        end
        else if(count == 3)
            shift_ena <= 0;
        else
            count <= count + 1;
    end
endmodule