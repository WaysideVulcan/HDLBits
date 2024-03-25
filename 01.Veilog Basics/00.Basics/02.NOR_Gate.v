module top_module( 
    input a, 
    input b, 
    output out );
    
    assign out = ~(a|b);
    //second way
    //nor(out,a,b);
endmodule