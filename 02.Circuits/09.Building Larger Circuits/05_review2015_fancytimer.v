module top_module(
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack);

    wire shift_ena, done_counting, count_ena;
    
    ComFSM instance1(clk, reset, data, shift_ena, counting, done_counting, done, ack);
    Shift_Reg instance2(clk, shift_ena, count_ena, data, count);
    Counter instance3(clk, reset, count, counting, done_counting, count_ena);
    
endmodule

module ComFSM (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack);

    parameter S=0, S1=1, S11=2, S110=3, B0=4, B1=5, B2=6, B3=7, Count=8, Wait=9;
    reg [3:0] state, next;
    
    // state transition logic
    always@(*)begin
        case(state)
            S: next = data? S1:S;
            S1: next = data? S11:S;
            S11: next = data? S11:S110;
            S110: next = data? B0:S;
            B0: next = B1;
            B1: next = B2;
            B2: next = B3;
            B3: next = Count;
            Count: next = done_counting? (ack? S:Wait):Count;
            Wait: next = ack? S:Wait;
        endcase
    end
    
    // flip-flop and reset
    always@(posedge clk)begin
        if(reset)
            state <= S;
        else
            state <= next;
    end
    
    // output
    assign shift_ena = (state==B0 || state==B1 || state==B2 || state==B3);
    assign counting = (state == Count) && (next != Wait) && (next != S);
    assign done = (state == Wait) || (state == Count)&(next == Wait) || (state == Count)&(next == S);
    
endmodule

module Shift_Reg (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);

    always@(posedge clk)begin
        if(shift_ena) // shift in
            q <= {q[2:0],data};
        else if(count_ena)
            q <= q - 1; // count
        else
            q <= q;
    end

endmodule

module Counter(
	input clk,
    input reset,
    input [3:0] count,
    input counting,
    output reg done_counting,
    output count_ena);
    
    wire [9:0] q;
    
    Counter1000 instance1(clk, reset, counting, q, count_ena);
    
    always@(posedge clk)begin
        if(count==0 && count_ena==1)
            done_counting <= 1;
        else
            done_counting <= 0;
    end
            
endmodule
    

module Counter1000 (
    input clk,
    input reset,
    input counting,
    output reg [9:0] q,
	output count);
    
    always@(posedge clk)begin
        if(reset | ~counting)
            q <= 0;
        else if(q == 999)
            q <= 0;
        else
            q <= q + 1;
    end
    
    assign count = (q == 999)? 1:0;
    
endmodule