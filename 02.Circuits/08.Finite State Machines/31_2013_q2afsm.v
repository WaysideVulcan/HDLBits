module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 

    parameter A=0, B=1, C=2, D=3;
    wire[2:0] state, next;
    
    // state transition logic
    always@(*)begin
        case(state)
            A: next = r[1]? B:(r[2]? C:(r[3]? D:A) );
            B: next = r[1]? B:A;
            C: next = r[2]? C:A;
            D: next = r[3]? D:A;
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
    assign g = {state==D, state==C, state==B};
endmodule