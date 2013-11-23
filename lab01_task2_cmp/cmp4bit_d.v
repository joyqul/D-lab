/* 4 bits comparator in gate level */
module cmp4bit_d(A, B, _EQL, _GT, _LT);
    input   [3:0]   A, B;
    output          _EQL, _GT, _LT;
    wire            _EQL, _GT, _LT;

    assign _EQL = (A == B);
    assign _GT = (A > B);
    assign _LT = (A < B);
    /*
    wire    [3:0]   abeql, agtb, altb;
    wire    [1:0]   xout, add_gt, add_lt;
    wire    [2:0]   mul_gt, mul_lt;
    */
    /*
    assign abeql[0] = A[0] ^ ~B[0];
    assign abeql[1] = A[1] ^ ~B[1];
    assign abeql[2] = A[2] ^ ~B[2];
    assign abeql[3] = A[3] ^ ~B[3];

    assign agtb[0] = A[0] & ~B[0];
    assign agtb[1] = A[1] & ~B[1];
    assign agtb[2] = A[2] & ~B[2];
    assign agtb[3] = A[3] & ~B[3];

    assign altb[0] = ~A[0] & B[0];
    assign altb[1] = ~A[1] & B[1];
    assign altb[2] = ~A[2] & B[2];
    assign altb[3] = ~A[3] & B[3];
    
    */
    /* (A=B) = x[3]x[2]x[1]x[0] */
    //assign _EQL = ((A[0] ^ ~B[0]) & (A[1] ^ ~B[1]) & (A[2] ^ ~B[2]) & (A[3] ^ ~B[3]));
    
    /* (A>B) = A[3]B[3]' + x[3]A[2]B[2]' + x[3]x[2]A[1]B[1]' + x[3]x[2]x[1]A[0]B[0]' */
    //assign _GT = ((A[3] & ~B[3]) | ((A[3] ^ ~B[3]) & (A[2] & ~B[2])) | ((A[3] ^ ~B[3]) & (A[2] ^ ~B[2]) & (A[1] ^ ~B[1]) & (A[1] & ~B[1])) | ((A[3] ^ ~B[3]) & (A[2] ^ ~B[2]) & (A[1] ^ ~B[1]) & (A[0] & ~B[0])));
    
    /* (A<B) = A[3]'B[3] + x[3]A[2]'B[2] + x[3]x[2]A[1]'B[1] + x[3]x[2]x[1]A[0]'B[0] */
    //assign _LT = ((~A[3] & B[3]) | ((A[3] ^ ~B[3]) & (~A[2] & B[2])) | ((A[3] ^ ~B[3]) & (A[2] ^ ~B[2]) & (A[1] ^ ~B[1]) & (~A[1] & B[1])) | ((A[3] ^ ~B[3]) & (A[2] ^ ~B[2]) & (A[1] ^ ~B[1]) & (~A[0] & B[0])));

endmodule
