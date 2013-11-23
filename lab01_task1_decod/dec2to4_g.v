/* gate level, use gate only */

module dec2to4_g(Y, A, B);
    input           A,B;    
    output  [3:0]   Y;
//---------------------------------
// reg and wire declaration
//---------------------------------
    wire     [3:0]   Y;
    wire    na, nb; 
//---------------------------------
//     DESIGN
//---------------------------------
    not(na, A);
    not(nb, B);
    and(Y[0], na, nb);
    and(Y[1], na, B); 
    and(Y[2], A, nb); 
    and(Y[3], A, B);
endmodule

