module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    parameter A=0, B=1, S0=3, S1=4, S2=5, E1=8, E21=9, E22=10, E31=11, E32=12, E33=13;
    wire [3:0] state, next;
    
    // state transition logic
    always@(*)begin
        case(state)
            A: next = resetn? B:A;
            B: next = S0;
            S0: next = x? S1:S0;
            S1: next = x? S1:S2;
            S2: next = x? E1:S0;
            E1: next = y? E22:E21;
            E21: next = y? E32:E31;
            E22: next = E32;
            E31: next = E31;
            E32: next = E32;
        endcase
    end
    
    // flip-flop and reset
    always@(posedge clk)begin
        if(~resetn)
            state <= A;
        else
            state <= next;
    end
    
    // output
    assign f = (state == B);
    assign g = (state == E1 || state == E21 || state == E22 || state == E32);          

endmodule