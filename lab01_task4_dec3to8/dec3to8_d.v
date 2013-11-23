/* data-flow */
module dec3to8_d(A, B, C, Y, EN);
    input           A, B, C, EN;
    output  [7:0]   Y;

    wire    [7:0]   Y;
    
    assign Y[0] = A | B | C | EN;
    assign Y[1] = A | B | ~C | EN;
    assign Y[2] = A | ~B | C | EN;
    assign Y[3] = A | ~B | ~C | EN;
    assign Y[4] = ~A | B | C | EN;
    assign Y[5] = ~A | B | ~C | EN;
    assign Y[6] = ~A | ~B | C | EN;
    assign Y[7] = ~A | ~B | ~C | EN;
    
endmodule
