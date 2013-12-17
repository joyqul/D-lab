`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:54:22 12/17/2013 
// Design Name: 
// Module Name:    hellofpga 
// Project Name: 
// Target Devices: 
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
`define MAX 50000000
module hellofpga(RESET, CLK, LED, SW);
    input                   CLK, RESET;
    input               [3:0]   SW;
    output  reg [7:0] LED;
    
    reg     [25:0]      COUNTER;
    
    
    // COUNTER
    always@(posedge CLK)begin
        if (SW == 0) COUNTER = 0;
        else if (COUNTER == `MAX) COUNTER = 0;
        else COUNTER = COUNTER + 1;
    end

    // LED  
    always@(posedge CLK) begin

        case(SW)
            1: LED = 8'b00000001;
            2: begin
                if (COUNTER == `MAX && LED != 8'b10000000 && LED != 0) LED = LED <<1;
                else if (COUNTER == `MAX) LED = 1;
                else LED = LED;
            end
            4: begin
                if (COUNTER == `MAX && LED != 1 && LED != 0) LED = LED >>1;
                else if (COUNTER == `MAX && LED == 1) LED = 8'b10000000;
                else if (COUNTER == `MAX) LED = 8'b10000000;
                else LED = LED;
            end
            8: begin
                if (COUNTER == `MAX && LED == 8'b10101010) LED = 8'b01010101;
                else if (COUNTER == `MAX) LED = 8'b10101010;
                else LED = LED;
            end
            default: LED = 0;
        endcase

    end
    
endmodule
