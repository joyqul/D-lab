/* data flow level */

module mux8to1_d(D, sel, EN, Y);
    input   [7:0]   D;
    input   [2:0]   sel;
    input           EN;
    output  wire    Y;

    assign  Y = EN & ((D[0] & ~sel[2] & ~sel[1] & ~sel[0]) |
                 (D[1] & ~sel[2] & ~sel[1] & sel[0]) |
                 (D[2] & ~sel[2] & sel[1] & ~sel[0]) |
                 (D[3] & ~sel[2] & sel[1] & sel[0]) |
                 (D[4] & sel[2] & ~sel[1] & ~sel[0]) |
                 (D[5] & sel[2] & ~sel[1] & sel[0]) |
                 (D[6] & sel[2] & sel[1] & ~sel[0]) |
                 (D[7] & sel[2] & sel[1] & sel[0]))
endmodule
