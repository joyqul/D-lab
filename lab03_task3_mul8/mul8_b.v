module mul8_b(P, A, B);
    input       [7:0]   A, B;
    output reg  [15:0]  P;

    reg         [14:0]   add0, add1, add2, add3, add4, add5, add6, add7;
    
    /*
    always@(A or B) begin
        P = A * B;
    end
    */
    
    always@(A or B) begin

        add0 = (B[0] == 0)? 0: A;
        add1 = (B[1] == 0)? 0: A << 1;
        add2 = (B[2] == 0)? 0: A << 2;
        add3 = (B[3] == 0)? 0: A << 3;
        add4 = (B[4] == 0)? 0: A << 4;
        add5 = (B[5] == 0)? 0: A << 5;
        add6 = (B[6] == 0)? 0: A << 6;
        add7 = (B[7] == 0)? 0: A << 7;

        P = add0 + add1 + add2 + add3 + add4 + add5 + add6 + add7;
    end

endmodule
