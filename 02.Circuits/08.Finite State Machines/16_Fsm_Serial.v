module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    parameter s0=0, s1=1,s2=2, s3=3, s4=4, s5=5, s6=6, s7=7, s8=8, s9=9, s10=10, s11=11;
    wire [3:0] state, next;
    
    // state transition logic
    always@(*)begin
        case(state)
            s0: next = in? s0:s1;
            s1: next = s2;
            s2: next = s3;
            s3: next = s4;
            s4: next = s5;
            s5: next = s6;
            s6: next = s7;
            s7: next = s8;
            s8: next = s9;
            s9: next = in? s10:s11;
            s10: next = in? s0:s1;
            s11: next = in? s0:s11;
        endcase
    end
    
    // flip-flop and reset
    always@(posedge clk)begin
        if(reset)
            state <= s0;
        else
            state <= next;
    end
    
    //output
    assign done = (state == s10);
    
endmodule