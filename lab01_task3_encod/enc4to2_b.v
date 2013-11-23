/* 4 to 2 encoder in behavior level */
module enc4to2_b(D, Y, _IN_ERR);
    input   [3:0]   D;
    output  [1:0]   Y;
    output          _IN_ERR;
    
    reg     [1:0]   Y;
    reg             _IN_ERR;

    always@(D) begin
        _IN_ERR = 1'b0;
        case (D) 
            4'b0001: Y = 2'b00;
            4'b0010: Y = 2'b01;
            4'b0100: Y = 2'b10;
            4'b1000: Y = 2'b11;
            default: _IN_ERR = 1'b1;
        endcase
    end
endmodule
