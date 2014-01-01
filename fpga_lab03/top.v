`timescale 1ns / 1ps
`define RADIUS  100
`define SCR_Y 621
`define BALL_X 504

module top(CLK, RESET, HSYNC, VSYNC, R, G, B);
	 
    input           CLK, RESET;
    output  wire    HSYNC, VSYNC, R, G, B;

    reg     [11:0]  V_CNT, V_INC, H_CNT, BALL_Y;
    wire            VISIBLE;
    wire    [31:0]  DIS;

    reg             DROP, STOP, TOUCH_T, TOUCH_G;
    reg     [11:0]  END_Y;
    
    assign HSYNC = ~( (V_CNT >= 919) & (V_CNT < 1039) );
    assign VSYNC = ~( (H_CNT >= 659) & (H_CNT < 665) );
    assign VISIBLE = ( (V_CNT > 104) & (V_CNT < 904) & (H_CNT > 23) & (H_CNT < 623) );
    assign DIS = (V_CNT - `BALL_X) * (V_CNT - `BALL_X) + (H_CNT - BALL_Y) * (H_CNT - BALL_Y);

    // color
    assign R = ( (VISIBLE)? ((DIS < (`RADIUS * `RADIUS))? 1: 0): 0 );
    assign G = ( (VISIBLE)? ((DIS < (`RADIUS * `RADIUS))? 0: 0): 0 );
    assign B = ( (VISIBLE)? ((DIS < (`RADIUS * `RADIUS))? 0: 0): 0 );
    
    // V_CNT
    always@(posedge CLK) begin
        if (RESET) V_CNT <= 0;
        else if (V_CNT == 1039) V_CNT <=0;
        else V_CNT <= V_CNT + 1;
    end

    // V_INC
    always@(posedge CLK) begin
        if (RESET) V_INC <= 0;
        else if (V_CNT == 1039) V_INC <= 1;
        else V_INC <= 0;
    end
    
    // H_CNT
    always@(posedge CLK) begin
        if (RESET) H_CNT <=0;
        else if (H_CNT == 665) H_CNT <=0;
        else if (V_INC) H_CNT <= H_CNT + 1;
        else H_CNT <= H_CNT;
    end

    //DROP
    always@(posedge CLK) begin
        if (RESET) DROP <= 1;
        else if (DROP & TOUCH_G) DROP <= 0;
        else if (!DROP & TOUCH_T) DROP <= 1;
        else DROP <= DROP;
    end

    //STOP
    always@(posedge CLK) begin
        if (RESET) STOP <= 0;
        else if (END_Y >= `SCR_Y - `RADIUS) STOP <= 1;
        else STOP <= 0;
    end
    
    // BALL_Y
    always@(posedge CLK) begin
        if (RESET) begin
            BALL_Y <= 11'd0;
        end
        else if (!STOP && H_CNT == 0 && V_CNT == 0) begin
            if (DROP) begin
                BALL_Y <= BALL_Y + 1;
            end
            else begin
                BALL_Y <= BALL_Y - 1;
            end
        end
        else begin
            BALL_Y <= BALL_Y;
        end
    end

    // TOUCH_T
    always@(posedge CLK) begin
        if (RESET) TOUCH_T <= 1;
        else if (!DROP & (BALL_Y == END_Y)) TOUCH_T <= 1;
        else TOUCH_T <= 0;
    end

    // TOUCH_G
    always@(posedge CLK) begin
        if (RESET) TOUCH_G <= 0;
        else if (DROP & (BALL_Y == `SCR_Y - `RADIUS)) TOUCH_G <= 1;
        else TOUCH_G <= 0;
    end

    // END_Y
    always@(posedge CLK) begin
        if (RESET) begin 
            END_Y <= 11'd0;
        end
        else if (!STOP & DROP & TOUCH_G) begin
            END_Y <= `SCR_Y - (`SCR_Y - END_Y) / 2;
        end
        else begin
            END_Y <= END_Y;
        end
    end
    
endmodule
