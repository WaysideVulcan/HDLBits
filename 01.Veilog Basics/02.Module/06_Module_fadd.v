module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] low16,high16;
    wire cout1,cout2;

    add16 add16_1 (a[15:0],b[15:0],1'b0,low16,cout1);
    add16 add16_2 (a[31:16],b[31:16],cout1,high16,cout2);

    assign sum = {high16,low16};

endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

    assign {cout,sum} = a + b + cin;
// Full adder module here

endmodule