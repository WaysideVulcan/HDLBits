module top_module (input x, input y, output z);
    
	wire z1,z2,z3,z4;
    A_module IA1(x,y,z1);
    B_module IB1(x,y,z2);
    A_module IA2(x,y,z3);
    B_module IB2(x,y,z4);
    assign z = (z1 | z2) ^ (z3&z4);
    
endmodule

module A_module (input x, input y, output z); 
    assign z = (x^y) & x ;
endmodule

module B_module (input x, input y, output z);
    assign z = ~(x^y);
endmodule