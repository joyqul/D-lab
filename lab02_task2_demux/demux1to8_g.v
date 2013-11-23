module demux1to8_g(D, sel, EN, Y);
    input               D, EN;
    input       [2:0]   sel;
    output wire [7:0]   Y;
    
    wire        [2:0]   nsel;
    
    not(nsel[0], sel[0]);
    not(nsel[1], sel[1]);
    not(nsel[2], sel[2]);

    and(Y[0], EN, nsel[0], nsel[1], nsel[2], D);
    and(Y[1], EN, sel[0], nsel[1], nsel[2], D);
    and(Y[2], EN, nsel[0], sel[1], nsel[2], D);
    and(Y[3], EN, sel[0], sel[1], nsel[2], D);
    and(Y[4], EN, nsel[0], nsel[1], sel[2], D);
    and(Y[5], EN, sel[0], nsel[1], sel[2], D);
    and(Y[6], EN, nsel[0], sel[1], sel[2], D);
    and(Y[7], EN, sel[0], sel[1], sel[2], D);
endmodule
