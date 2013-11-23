 /* 3to8 decoder with an additional input EN and low-active output. */

module dec3to8_g(A, B, C, Y, EN);
    input           A, B, C, EN;
    output  [7:0]   Y;
 
    wire    [7:0]   Y;
    
    wire            na, nb, nc;
    
    not(na, A);
    not(nb, B);
    not(nc, C);

    or(Y[0], A, B, C, EN);
    or(Y[1], A, B, nc, EN);
    or(Y[2], A, nb, C, EN);
    or(Y[3], A, nb, nc, EN);
    or(Y[4], na, B, C, EN);
    or(Y[5], na, B, nc, EN);
    or(Y[6], na, nb, C, EN);
    or(Y[7], na, nb, nc, EN);
endmodule
