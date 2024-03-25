module top_module (input a, input b, input c, output out);//

    wire n_out;
    andgate inst1(n_out , a , b , c , 1 , 1);

    assign out = ~n_out;
endmodule