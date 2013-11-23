module demux1to8_d(D, sel, EN, Y);
    input               D, EN;
    input       [2:0]   sel;
    output wire [7:0]   Y;

    assign Y[0] = EN & ~sel[0] & ~sel[1] & ~sel[2] & D;
    assign Y[1] = EN & ~sel[0] & ~sel[1] & sel[2] & D;
    assign Y[2] = EN & ~sel[0] & sel[1] & ~sel[2] & D;
    assign Y[3] = EN & ~sel[0] & sel[1] & sel[2] & D;
    assign Y[4] = EN & sel[0] & ~sel[1] & ~sel[2] & D;
    assign Y[5] = EN & sel[0] & ~sel[1] & sel[2] & D;
    assign Y[6] = EN & sel[0] & sel[1] & ~sel[2] & D;
    assign Y[7] = EN & sel[0] & sel[1] & sel[2] & D;
endmodule
