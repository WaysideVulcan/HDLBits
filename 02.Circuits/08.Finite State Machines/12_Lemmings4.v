module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 

	parameter LEFT = 0 , RIGHT = 1 , FALLING_L = 2 , FALLING_R = 3 , DIG_L = 4 , DIG_R = 5 , SP = 6;
    reg  [2:0] state, next_state;
    wire [4:0] count;
    wire die;
    always @(*) begin
        // State transition logic
        case(state)
            LEFT :next_state = ground ? (dig ? DIG_L :(bump_left  ? RIGHT : LEFT )) : FALLING_L ;
            RIGHT:next_state = ground ? (dig ? DIG_R :(bump_right ? LEFT  : RIGHT)) : FALLING_R ; 
            FALLING_L : next_state = die ? (ground ? SP : FALLING_L) : (ground ? LEFT : FALLING_L ) ;
            FALLING_R : next_state = die ? (ground ? SP : FALLING_R) : (ground ? RIGHT: FALLING_R ) ;
            DIG_L : next_state = ground ? DIG_L : FALLING_L;
            DIG_R : next_state = ground ? DIG_R : FALLING_R;
            SP : next_state = SP;
        endcase
    end

    always @(posedge clk or posedge areset) begin
        // State flip-flops with asynchronous reset
		if(areset)
        	state <= LEFT;
        else 
            state <= next_state;
    end

    always@(posedge clk or posedge areset) begin
        if(areset)
            count <= 0;
        else if(state == FALLING_L || state == FALLING_R )
            if(count == 19)
                die <= 1;
        	else
                count <= count + 1;
        else begin
            die <= 0;
            count <= 0;
        end
    end
    
    assign walk_left  = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah       = (state == FALLING_L || state == FALLING_R);
    assign digging    = (state == DIG_L || state == DIG_R);
endmodule