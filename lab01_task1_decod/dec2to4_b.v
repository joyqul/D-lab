/* behavior level, use always only */
/* output: Y; input: A, B */

module dec2to4_b( Y, A, B);   
    input           A, B;   
    output  [3:0]   Y;
//---------------------------------
// reg and wire declaration
//---------------------------------
    reg    [3:0]   Y;
//---------------------------------
//     DESIGN
//---------------------------------
    always @(A or B) begin
        case ( {A, B} )
            2'b00:  Y = 4'b0001;
            2'b01:  Y = 4'b0010;
            2'b10:  Y = 4'b0100;
            2'b11:  Y = 4'b1000;
        endcase 
    end
endmodule

