module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
	parameter A=2'b01, B=2'b10;
    wire[1:0] state, next;
    
    // state transition logic
    always@(*)begin
        case(state)
            A: next = x? B:A;
            B: next = B;
            default: next = 'x;
        endcase
    end
    
    // flip-flop and areset
    always@(posedge clk, posedge areset)begin
        if(areset)
            state <= A;
        else
            state <= next;
    end
    
    // output
    always@(*)begin
        case(state)
            A: z = x;
            B: z = ~x;
        endcase
    end
        
endmodule