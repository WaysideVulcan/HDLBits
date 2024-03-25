module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);

    parameter s0=0, s1=1, s2=2, s3=3, s4=4, s5=5, s6=6, se=7, sd=8, sf=9;
    wire[3:0] state, next;
    
    // state transition logic
    always@(*)begin
        case(state)
            s0: next = in? s1:s0;
            s1: next = in? s2:s0;
            s2: next = in? s3:s0;
            s3: next = in? s4:s0;
            s4: next = in? s5:s0;
            s5: next = in? s6:sd;
            s6: next = in? se:sf;
            se: next = in? se:s0;
            sd: next = in? s1:s0;
            sf: next = in? s1:s0;
        endcase
    end
    
    // flip-flop and reset
    always@(posedge clk)begin
        if(reset)
            state <= s0;
        else
            state <= next;
    end
    
    // output
    assign disc = (state == sd);
    assign flag = (state == sf);
    assign err = (state == se);
            
endmodule