module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

    wire w1 = (p1a & p1b & p1c);
    wire w2 = (p1d & p1e & p1f);
    wire w3 = (p2a & p2b);
    wire w4 = (p2c & p2d);
    
    assign p1y = w1 | w2;
    assign p2y = w3 | w4;
	//second way
    //assign p1y = (p1a & p1b & p1c)|(p1d & p1e & p1f);
    //assign p2y = (p2a & p2b)|(p2c & p2d);
endmodule