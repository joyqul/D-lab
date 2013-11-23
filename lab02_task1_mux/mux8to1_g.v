module mux8to1_g(D, sel, EN, Y);
    input   [7:0]   D;
    input   [2:0]   sel;
    input           EN;
    output  wire    Y;

    wire    [2:0]   nsel;
    wire    [7:0]   gate;
    wire            nen;

    not(nsel[0], sel[0]);
    not(nsel[1], sel[1]);
    not(nsel[2], sel[2]);

    and(gate[0], nsel[0], nsel[1], nsel[2], D[0]);
    and(gate[1], sel[0], nsel[1], nsel[2], D[1]);
    and(gate[2], nsel[0], sel[1], nsel[2], D[2]);
    and(gate[3], sel[0], sel[1], nsel[2], D[3]);
    and(gate[4], nsel[0], nsel[1], sel[2], D[4]);
    and(gate[5], sel[0], nsel[1], sel[2], D[5]);
    and(gate[6], nsel[0], sel[1], sel[2], D[6]);
    and(gate[7], sel[0], sel[1], sel[2], D[7]);

    or(nen, gate[0], gate[1], gate[2], gate[3], gate[4], gate[5], gate[6], gate[7]);
    and(Y, nen, EN);

endmodule
