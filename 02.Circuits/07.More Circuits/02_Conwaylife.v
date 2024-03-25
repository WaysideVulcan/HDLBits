module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 

    reg [3:0] sum;
    integer i;
    
    always@(posedge clk)begin
        if(load)
            q <= data;
        else begin
            for(i=0;i<256;i=i+1)begin
                if(i==0)
                    sum = q[255]+q[240]+q[241]+q[15]+q[1]+q[31]+q[16]+q[17];
                else if(i==15)
                    sum = q[254]+q[255]+q[240]+q[14]+q[0]+q[30]+q[31]+q[16];
                else if(i==240)
                    sum = q[239]+q[224]+q[225]+q[255]+q[241]+q[15]+q[0]+q[1];
                else if(i==255)
                    sum = q[238]+q[239]+q[224]+q[254]+q[240]+q[14]+q[15]+q[0];
                else if(i>0 && i<15)
                    sum = q[i+239]+q[i+240]+q[i+241]+q[i-1]+q[i+1]+q[i+15]+q[i+16]+q[i+17];
                else if(i>240 && i<255)
                    sum = q[i-17]+q[i-16]+q[i-15]+q[i-1]+q[i+1]+q[i-241]+q[i-240]+q[i-239];
                else if((i+1)%16==0)
                    sum = q[i-17]+q[i-16]+q[i-31]+q[i-1]+q[i-15]+q[i+15]+q[i+16]+q[i+1];
                else if(i%16==0)
                    sum = q[i-1]+q[i-16]+q[i-15]+q[i+15]+q[i+1]+q[i+31]+q[i+16]+q[i+17];
                else
                    sum = q[i-17]+q[i-16]+q[i-15]+q[i-1]+q[i+1]+q[i+15]+q[i+16]+q[i+17];
                
                case(sum)
                    4'd2: q[i]<=q[i];
                    4'd3: q[i]<=1'b1;
                    default:q[i]<=1'b0;
                endcase
            end
        end
    end
            
endmodule