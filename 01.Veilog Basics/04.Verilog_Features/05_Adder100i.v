module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
generate
    genvar i;
    for(i = 0 ; i <100 ; i=i+1)begin:adder
        if(i==0)begin
            assign {cout[i],sum[i]} = a[i]+b[i]+cin;
        end 
        else begin
            assign {cout[i],sum[i]} = a[i]+b[i]+cout[i-1];
        end
    end
endgenerate

endmodule