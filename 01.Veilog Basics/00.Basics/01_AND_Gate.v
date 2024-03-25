module top_module( 
    input a, 
    input b, 
    output out );
    
    assign out = a & b;
    // second way
    // and(out,a,b);
endmodule