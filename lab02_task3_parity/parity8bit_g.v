module parity8bit_d(D, chk, even, Y);
    input   [7:0]   D;
    input   [1:0]   chk;
    input           even;
    output  wire    Y;

    wire            odd;
    wire    [1:0]   nchk;
    wire    [7:0]   gate;
    wire    [7:0]   ndout;
    
    not(odd, even);
    not(nchk[0], chk[0]);
    not(nchk[1], chk[1]);

    xor(ndout[0], D[7], D[6], D[5], D[4]);
    not(ndout[1], ndout[0]);
    xor(ndout[2], D[0], D[2], D[4], D[6]);
    not(ndout[3], ndout[2]);
    xor(ndout[4], D[1], D[3], D[5], D[7]);
    not(ndout[5], ndout[4]);
    xor(ndout[6], D[0], D[1], D[2], D[3], D[4], D[5], D[6], D[7]);
    not(ndout[7], ndout[6]);

    and(gate[0], odd, nchk[0], nchk[1], ndout[0]);
    and(gate[2], odd, chk[0], nchk[1], ndout[2]);
    and(gate[4], odd, nchk[0], chk[1], ndout[4]);
    and(gate[6], odd, chk[0], chk[1], ndout[6]);
    and(gate[1], even, nchk[0], nchk[1], ndout[1]);
    and(gate[3], even, chk[0], nchk[1], ndout[3]);
    and(gate[5], even, nchk[0], chk[1], ndout[5]);
    and(gate[7], even, chk[0], chk[1], ndout[7]);
    
    or(Y, gate[0], gate[1], gate[2], gate[3], gate[4], gate[5], gate[6], gate[7]);

endmodule
