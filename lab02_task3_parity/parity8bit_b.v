module parity8bit_b(D, chk, even, Y);
    input   [7:0]   D;
    input   [1:0]   chk;
    input           even;
    output  reg     Y;
    
    always@(D or chk or even) begin
        case ({chk, even})
            3'b000: Y = D[7] ^ D[6] ^ D[5] ^ D[4];
            3'b001: Y = ~(D[7] ^ D[6] ^ D[5] ^ D[4]);
            3'b010: Y = D[0] ^ D[2] ^ D[4] ^ D[6];
            3'b011: Y = ~(D[0] ^ D[2] ^ D[4] ^ D[6]);
            3'b100: Y = D[1] ^ D[3] ^ D[5] ^ D[7];
            3'b101: Y = ~(D[1] ^ D[3] ^ D[5] ^ D[7]);
            3'b110: Y = D[7] ^ D[6] ^ D[5] ^ D[4] ^ D[3] ^ D[2] ^ D[1] ^ D[0];
            3'b111: Y = ~(D[7] ^ D[6] ^ D[5] ^ D[4] ^ D[3] ^ D[2] ^ D[1] ^ D[0]);
        endcase
    end
endmodule
            
