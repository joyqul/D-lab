/* multiplexer 8 to 1 */

module mux8to1_b(D, sel, EN, Y);
    input   [7:0]   D;
    input   [2:0]   sel;
    input           EN;
    output  reg     Y;
    
    always@(D or sel or EN) begin
        if (EN == 1'b1) begin
            case (sel)
                3'b000: Y = D[0];
                3'b001: Y = D[1];
                3'b010: Y = D[2];
                3'b011: Y = D[3];
                3'b100: Y = D[4];
                3'b101: Y = D[5];
                3'b110: Y = D[6];
                3'b111: Y = D[7];
            endcase
        end
    end 
endmodule
