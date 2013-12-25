`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:45:35 20/12/2013 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: Button,Knob,Keyboard
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`define MAX 25000000
`define KEY_MAX 11
module top(CLK, RESET, KDAT, KCLK, SW, BTN_1, BTN_2, BTN_3, ROT_A, ROT_B, ROT_CENTER, LED);

    input               CLK, RESET, KDAT, KCLK, BTN_1, BTN_2, BTN_3, ROT_A, ROT_B, ROT_CENTER;
    input       [3:0]   SW;
    output reg  [7:0]   LED;

    reg         [25:0]  COUNTER;
    reg         [3:0]       KEY_COUNTER;
    reg         [1:0]       BTN_MODE;
    reg                     pre_rotary_q1;
    reg                     rotary_q1, rotary_q2, rotary_a_in, rotary_b_in, rotary_valid, rotary_direction;
    reg         [7:0]       DATA;
    reg                     c_state, n_state;
    reg         [21:0]  KEY_REG;
    
    // rotary_a_in, rotary_b_in
    always@(posedge CLK) begin
        if (RESET) begin
            rotary_a_in <= 0;
            rotary_b_in <= 0;
        end
        else begin
            rotary_a_in <= ROT_A;
            rotary_b_in <= ROT_B;
        end
    end
    
    // rotary_q1, rotary_q2
    always@(posedge CLK) begin
        if (RESET) begin
            rotary_q1 <= 0;
            rotary_q2 <= 0;
        end
        else begin
            case({rotary_b_in, rotary_a_in})
                2'b00: begin
                    rotary_q1 <= 0;
                    rotary_q2 <= rotary_q2;
                end
                2'b01: begin
                    rotary_q1 <= rotary_q1;
                    rotary_q2 <= 0;
                end
                2'b10: begin
                    rotary_q1 <= rotary_q1;
                    rotary_q2 <= 1;
                end
                2'b11: begin
                    rotary_q1 <= 1;
                    rotary_q2 <= rotary_q2;
                end
                default: begin
                    rotary_q1 <= rotary_q1;
                    rotary_q2 <= rotary_q2;
                end
            endcase
        end
    end
    
    // pre_rotary_q1
    always@(posedge CLK) begin
        if (RESET) pre_rotary_q1 = 0;
        else pre_rotary_q1 = rotary_q1;
    end
    
    // rotary_valid, rotary_direction
    always@(posedge CLK) begin
        if (RESET) begin
            rotary_valid <= 0;
            rotary_direction <= 0;
        end
        else if (pre_rotary_q1 == 0 && rotary_q1 == 1) begin
            rotary_valid <= 1;
            rotary_direction <= rotary_q2;
        end
        else begin
            rotary_valid <= 0;
            rotary_direction <= rotary_direction;
        end
    end
    
    // COUNTER
    always@(posedge CLK) begin
        if (RESET) COUNTER = 0;
        else if (COUNTER == `MAX) COUNTER = 0;
        else COUNTER = COUNTER + 1;
    end
    
    //KEY_COUNTER
    always@(posedge CLK) begin
        if (RESET) KEY_COUNTER = 0;
        else if (KEY_COUNTER == `KEY_MAX) KEY_COUNTER = 0;
        else KEY_COUNTER = KEY_COUNTER + 1;
    end
    
    // c_state, n_state
    always@(posedge CLK) begin
        if (RESET) begin
            c_state <= 0;
            n_state <= 0;
        end
        else begin
            c_state <= n_state;
            n_state <= KCLK;
        end
    end
    
    // KEY_REG
    always@(posedge CLK) begin
        if (RESET)  KEY_REG = 22'b11_00000000_0_11_00000000_0;
        else begin
            case({c_state, n_state})
                2'b10: KEY_REG = {KDAT, KEY_REG[21:1]};
                default: KEY_REG = KEY_REG;
            endcase
        end
    end 
    
    // check
    wire check = KEY_REG[1]^KEY_REG[2]^KEY_REG[3]^KEY_REG[4]^KEY_REG[5]^KEY_REG[6]^KEY_REG[7]^KEY_REG[8]^KEY_REG[9];
    
    //DATA
    always@(posedge CLK) begin
        if (RESET) DATA = 0;
        else if (KEY_COUNTER == 0 && check == 1) begin
            if (KEY_REG[19:12] == 8'hf0) begin
                case(KEY_REG[8:1]) // 1 ~ 9, 0
                    8'h16: DATA = 1;
                    8'h1E: DATA = 2;
                    8'h26: DATA = 3;
                    8'h25: DATA = 4;
                    8'h2E: DATA = 5;
                    8'h36: DATA = 6;
                    8'h3D: DATA = 7;
                    8'h3E: DATA = 8;
                    8'h46: DATA = 9;
                    8'h45: DATA = 8'b11111111;
                    default: DATA = DATA;
                endcase
            end
        end
    end

    
    // BTN_MODE
    always@(posedge CLK) begin
        if (RESET) BTN_MODE = 0;
        else if (BTN_1) BTN_MODE = 1;
        else if (BTN_2) BTN_MODE = 2;
        else if (BTN_3) BTN_MODE = 3;
        else BTN_MODE = BTN_MODE;
    end 
    
    // LED
    always@(posedge CLK) begin
        case(SW)
        0: begin
            if (RESET) LED = 0;
            else if (BTN_MODE == 1) LED = 8'b00001111;
            else if (BTN_MODE == 2) LED = 8'b11110000;
            else if (BTN_MODE == 3 && COUNTER == `MAX) LED = ~LED;
            else LED = LED;
        end
        1: begin
            if (RESET) LED = 0;
            else if (ROT_CENTER) LED = 8'b11111111;
            else if (rotary_valid == 1 && rotary_direction == 0) begin //turn right
                case(LED)
                    8'b00000000: LED = 8'b00000001;
                    8'b00000001: LED = 8'b00000011;
                    8'b00000011: LED = 8'b00000111;
                    8'b00000111: LED = 8'b00001111;
                    8'b00001111: LED = 8'b00011111;
                    8'b00011111: LED = 8'b00111111;
                    8'b00111111: LED = 8'b01111111;
                    8'b01111111: LED = 8'b11111111;
                    8'b11111111: LED = 8'b00000001;
                    default: LED = 8'b00000001;
                endcase
            end
            else if (rotary_valid == 1 && rotary_direction == 1) begin // turn left         
                case(LED)
                    8'b00000000: LED = 8'b10000000;
                    8'b10000000: LED = 8'b11000000;
                    8'b11000000: LED = 8'b11100000;
                    8'b11100000: LED = 8'b11110000;
                    8'b11110000: LED = 8'b11111000;
                    8'b11111000: LED = 8'b11111100;
                    8'b11111100: LED = 8'b11111110;
                    8'b11111110: LED = 8'b11111111;
                    8'b11111111: LED = 8'b10000000;
                    default: LED = 8'b10000000;
                endcase
            end
            else LED = LED;
        end
        2: begin
            if (RESET) LED = 0;
            else LED = DATA;
        end
        default: LED = 0;
        endcase
    end
    
endmodule
