module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
	
    wire [99:0] c_out;
    generate
        genvar i;
        for(i=0;i<=99;i=i+1)begin:adder
            if(i==0)begin
                bcd_fadd u1(
                    .a(a[3:0]),
                    .b(b[3:0]),
                    .cin(cin),
                    .cout(c_out[0]),
                    .sum(sum[3:0])
                );
            end
            else begin
                bcd_fadd u2(
                    .a(a[4*i+3:4*i]),
                    .b(b[4*i+3:4*i]),
                    .cin(c_out[i-1]),
                    .cout(c_out[i]),
                    .sum(sum[4*i+3:4*i]));
            end
            assign cout = c_out[99];
        end
    endgenerate
endmodule