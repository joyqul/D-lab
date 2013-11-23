/* 1 bit comparator in dataflow level */
module cmp1bit_d(A, B, _EQL, _GT, _LT);

    input   A, B;
    output  _EQL, _GT, _LT;
    wire    _EQL, _GT, _LT;
    
    assign  _EQL = A ^ ~B;
    assign  _GT = A & ~B;
    assign  _LT = ~A & B;

endmodule
    
