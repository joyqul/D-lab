module add8_b(A, B, Ci, SUM, Co);
    input       [7:0]   A, B;
    input               Ci;
    output reg  [7:0]   SUM;
    output reg          Co;

    /*
    reg         [8:0]   tmp;
    
    always@(A or B or Ci) begin
        tmp = A + B;
        SUM = tmp[7:0];
        Co = tmp[8];
    end
    */

    reg         [6:0]   tmp;
    
    always@(A or B or Ci) begin
        SUM[0] = A[0] ^ B[0] ^ Ci;
        tmp[0] = (A[0] & B[0]) | ((A[0] ^ B[0]) & Ci);
        SUM[1] = A[1] ^ B[1] ^ tmp[0];
        tmp[1] = (A[1] & B[1]) | ((A[1] ^ B[1]) & tmp[0]);
        SUM[2] = A[2] ^ B[2] ^ tmp[1];
        tmp[2] = (A[2] & B[2]) | ((A[2] ^ B[2]) & tmp[1]);
        SUM[3] = A[3] ^ B[3] ^ tmp[2];
        tmp[3] = (A[3] & B[3]) | ((A[3] ^ B[3]) & tmp[2]);
        SUM[4] = A[4] ^ B[4] ^ tmp[3];
        tmp[4] = (A[4] & B[4]) | ((A[4] ^ B[4]) & tmp[3]);
        SUM[5] = A[5] ^ B[5] ^ tmp[4];
        tmp[5] = (A[5] & B[5]) | ((A[5] ^ B[5]) & tmp[4]);
        SUM[6] = A[6] ^ B[6] ^ tmp[5];
        tmp[6] = (A[6] & B[6]) | ((A[6] ^ B[6]) & tmp[5]);
        SUM[7] = A[7] ^ B[7] ^ tmp[6];
        Co = (A[7] & B[7]) | ((A[7] ^ B[7]) & tmp[6]);
    end

endmodule
