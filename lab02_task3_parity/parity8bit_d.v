module parity8bit_d(D, chk, even, Y);
    input   [7:0]   D;
    input   [1:0]   chk;
    input           even;
    output  wire    Y;

    assign Y = (~even & ~chk[0] & ~chk[1] & (D[7] ^ D[6] ^ D[5] ^ D[4])) | 
               (even & ~chk[0] & ~chk[1] & ~(D[7] ^ D[6] ^ D[5] ^ D[4])) |
               (~even & chk[0] & ~chk[1] & (D[0] ^ D[6] ^ D[2] ^ D[4])) |
               (even & chk[0] & ~chk[1] & ~(D[0] ^ D[6] ^ D[2] ^ D[4])) |
               (~even & ~chk[0] & chk[1] & (D[1] ^ D[3] ^ D[5] ^ D[7])) |
               (even & ~chk[0] & chk[1] & ~(D[1] ^ D[3] ^ D[5] ^ D[7])) |
               (~even & chk[0] & chk[1] & (D[0] ^ D[1] ^ D[2] ^ D[3] ^ D[4] ^ D[5] ^ D[6] ^ D[7])) |
               (even & chk[0] & chk[1] & ~(D[0] ^ D[1] ^ D[2] ^ D[3] ^ D[4] ^ D[5] ^ D[6] ^ D[7]))
endmodule
