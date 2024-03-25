module top_module( 
    input a, 
    input b, 
    output out );
    assign out = ~(a ^ b);
    //second way
    //xnor(out,a,b);
endmodule