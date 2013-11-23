module demux1to8_b(D, sel, EN, Y);
    input               D, EN;
    input   [2:0]       sel;
    output  reg [7:0]   Y;

    always@(D or sel or EN) begin
        if(EN == 1'b1) begin
            case (sel)
                3'b000: Y[0] = D;
                3'b001: Y[1] = D;
                3'b010: Y[2] = D;
                3'b011: Y[3] = D;
                3'b100: Y[4] = D;
                3'b101: Y[5] = D;
                3'b110: Y[6] = D;
                3'b111: Y[7] = D;
            endcase
        end
    end
endmodule
