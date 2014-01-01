`timescale 1ns / 1ps

module draw_ball(BALL_X, BALL_Y, V_CNT, H_CNT, VISIBLE, R, G, B);

    input   [11:0]  BALL_X, BALL_Y, V_CNT, H_CNT, VISIBLE;
    output  reg     R, G, B;
    
    wire    [31:0]  DIS;
    assign DIS = (BALL_X - V_CNT) * ( BALL_X - V_CNT) + (BALL_Y - H_CNT) * (BALL_Y - H_CNT);
    
    `define RADIUS = 100 * 100;

    always @(*) begin
        R = ( (VISIBLE)? ((DIS < RADIUS)? 1: 0): 0 );
        G = ( (VISIBLE)? ((DIS < RADIUS)? 0: 0): 0 );
        B = ( (VISIBLE)? ((DIS < RADIUS)? 0: 0): 0 );
    end
    
endmodule
