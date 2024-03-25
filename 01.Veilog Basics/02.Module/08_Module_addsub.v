module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire cout;
    wire [31:0] sub_b;
    assign sub_b = b^{32{sub}};
    add16 adder1(a[15:0],sub_b[15:0],sub,sum[15:0],cout);
    add16 adder2(a[31:16],sub_b[31:16],cout,sum[31:16]);
    
endmodule