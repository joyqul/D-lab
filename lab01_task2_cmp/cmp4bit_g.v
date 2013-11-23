/* 1 bit comparator in gate level */
`include "cmp1bit_g.v"

/* 4 bits comparator in gate level */
module cmp4bit_g(A, B, _EQL, _GT, _LT);
    input   [3:0]   A, B;
    output          _EQL, _GT, _LT;
    wire            _EQL, _GT, _LT;
    wire    [3:0]   abeql, agtb, altb;
    wire    [1:0]   xout, add_gt, add_lt;
    wire    [2:0]   mul_gt, mul_lt;
    
    cmp1bit_g cmp1_1(A[0], B[0], abeql[0], agtb[0], altb[0]);
    cmp1bit_g cmp1_2(A[1], B[1], abeql[1], agtb[1], altb[1]);
    cmp1bit_g cmp1_3(A[2], B[2], abeql[2], agtb[2], altb[2]);
    cmp1bit_g cmp1_4(A[3], B[3], abeql[3], agtb[3], altb[3]);
    
    /* (A=B) = x[3]x[2]x[1]x[0] */
    and(xout[0], abeql[3], abeql[2]);       //xout[0] = x[3]x[2]
    and(xout[1], xout[0], abeql[1]);    //xout[1] = x[3]x[2]x[1]
    and(_EQL, xout[1], abeql[0]);
    
    /* (A>B) = A[3]B[3]' + x[3]A[2]B[2]' + x[3]x[2]A[1]B[1]' + x[3]x[2]x[1]A[0]B[0]' */
    and(mul_gt[0], xout[1], agtb[0]);
    and(mul_gt[1], xout[0], agtb[1]);
    and(mul_gt[2], abeql[3], agtb[2]);
    or(add_gt[0], mul_gt[0], mul_gt[1]);
    or(add_gt[1], add_gt[0], mul_gt[2]);
    or(_GT, agtb[3], add_gt[1]);
    
    /* (A<B) = A[3]'B[3] + x[3]A[2]'B[2] + x[3]x[2]A[1]'B[1] + x[3]x[2]x[1]A[0]'B[0] */
    and(mul_lt[0], xout[1], altb[0]);
    and(mul_lt[1], xout[0], altb[1]);
    and(mul_lt[2], abeql[3], altb[2]);
    or(add_lt[0], mul_lt[0], mul_lt[1]);
    or(add_lt[1], add_lt[0], mul_lt[2]);
    or(_LT, altb[3], add_lt[1]);
    
endmodule
