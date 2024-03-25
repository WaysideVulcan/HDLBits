module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);

    parameter s0=3'b000, s1=3'b001, s2=3'b010, s3=3'b011, s4=3'b100;
    wire [2:0] state, Y;
    
    // state transition logic
    always@(*)begin
        case(y[2:0])
            s0: Y = x? s1:s0;
            s1: Y = x? s4:s1;
            s2: Y = x? s1:s2;
            s3: Y = x? s2:s1;
            s4: Y = x? s4:s3;
        endcase
    end
    
    // output
    always@(*)begin
        case(y[2:0])
            s0: z = 0;
            s1: z = 0;
            s2: z = 0;
            s3: z = 1;
            s4: z = 1;
        endcase
    end
    
    assign Y0 = Y[0];
    
endmodule