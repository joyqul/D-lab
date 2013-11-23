/* data flow, use assign only */
module dec2to4_d(Y, A, B);
    input           A, B;   
    output  [3:0]   Y;
//---------------------------------
// reg and wire declaration
//---------------------------------
    wire     [3:0]   Y;
//---------------------------------
//     DESIGN
//---------------------------------
    assign  Y[0] = ~A & ~B;
    assign  Y[1] = ~A & B; 
    assign  Y[2] = A & ~B; 
    assign  Y[3] = A & B;
endmodule

