module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);

    parameter A = 0,B = 1,C = 2,D = 3;
    reg [1:0] count;
    reg [2:0] state,next_state;
   always @ (*)
        case (state)
            A: next_state = s?B:A;
            B: next_state = C;
            C: next_state = D;
            D: next_state = B;
            default next_state = A;
        endcase
    always @ (posedge clk)
        if (reset)
            state <= A;
    	else state <= next_state;
    always @ (posedge clk)
        case (state)
            B:count <= w ;
            C:count <= w ? count+1:count;
            D:count <= w ? count+1:count;  
            default count <= 0;
        endcase
    assign z = ((state==B) && (count == 2) );   
endmodule
