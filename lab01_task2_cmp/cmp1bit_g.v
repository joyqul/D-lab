/* 1 bit comparator in gate level */

module cmp1bit_g(A, B, _EQL, _GT, _LT);

    input   A, B;
    output  _EQL, _GT, _LT;
    wire    abxor, na, nb;
    wire    _EQL, _GT, _LT;
    
    not(na, A);
    not(nb, B);
    xor(abxor, A, B);
    not(_EQL, abxor);
    and(_GT, A, nb);
    and(_LT, na, B);

endmodule
