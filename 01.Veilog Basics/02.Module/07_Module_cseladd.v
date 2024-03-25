module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout;
    wire [15:0] sum0,sum1,sum2;
    add16 u1(a[15:0],b[15:0],1'b0,sum0,cout);
    add16 u2(a[31:16],b[31:16],1'b0,sum1);
    add16 u3(a[31:16],b[31:16],1'b1,sum2);
    
    assign sum = cout ? {sum2,sum0} : {sum1,sum0};
endmodule