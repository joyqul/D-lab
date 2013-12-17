module FTD( CLK, RESET,  IN_VALID, IN, OUT_VALID, OUT);

    input          CLK, RESET;
    input          IN_VALID;
    input          IN;
    output reg[3:0]   OUT;
    output reg        OUT_VALID;

    reg     [4:0]   STATE, X1, Y1, Z1, X2, Y2, Z2, X3, Y3, Z3, X4, Y4, Z4;
    reg     [1:0]   TABLE, NOW;
    reg     [4:0]   OUTPUTNUM;
    reg             HAVENUM;
    reg     [9:0]   TMP;
    
    always@(posedge CLK) begin
        if (RESET) begin
            OUT = 0;
            OUT_VALID = 0;
            STATE = 0;
            OUTPUTNUM = 0;
            TABLE = 0;
            HAVENUM = 0;
            NOW = 0;
            X1 = 0;
            Y1 = 0;
            Z1 = 0;
            X2 = 0;
            Y2 = 0;
            Z2 = 0;
        end
        else begin
            if (IN_VALID) begin
                HAVENUM = 1;
                if (TABLE == 0) begin
                    TABLE[1] = IN;
                    TABLE[0] = 1;
                end
                else begin
                    OUT_VALID = 0;
                    case (STATE)
                        0: begin
                            if (IN == 0) STATE = 1;
                            else begin //IN == 1
                                if (TABLE == 2'b01) begin
                                    case (OUTPUTNUM)
                                        0: X1 = 0;
                                        1: Y1 = 0;
                                        2: Z1 = 0;
                                        3: X2 = 0;
                                        4: Y2 = 0;
                                        5: Z2 = 0;
                                        6: X3 = 0;
                                        7: Y3 = 0;
                                        8: Z3 = 0;
                                        9: X4 = 0;
                                        10: Y4 = 0;
                                        11: Z4 = 0;
                                    endcase
                                    STATE = 0;
                                    OUTPUTNUM = OUTPUTNUM + 1;
                                end
                                else STATE = 2;
                            end
                        end
                        1: begin
                            if (IN == 0) begin
                                STATE = (TABLE == 2'b01)? 2: 3;
                            end
                            else begin //IN == 1
                                if (TABLE == 2'b01) begin
                                    case (OUTPUTNUM)
                                        0: X1 = 1;
                                        1: Y1 = 1;
                                        2: Z1 = 1;
                                        3: X2 = 1;
                                        4: Y2 = 1;
                                        5: Z2 = 1;
                                        6: X3 = 1;
                                        7: Y3 = 1;
                                        8: Z3 = 1;
                                        9: X4 = 1;
                                        10: Y4 = 1;
                                        11: Z4 = 1;
                                    endcase
                                    STATE = 0;
                                    OUTPUTNUM = OUTPUTNUM + 1;
                                end
                                else begin
                                    case (OUTPUTNUM)
                                        0: X1 = 3;
                                        1: Y1 = 3;
                                        2: Z1 = 3;
                                        3: X2 = 3;
                                        4: Y2 = 3;
                                        5: Z2 = 3;
                                        6: X3 = 3;
                                        7: Y3 = 3;
                                        8: Z3 = 3;
                                        9: X4 = 3;
                                        10: Y4 = 3;
                                        11: Z4 = 3;
                                    endcase
                                    STATE = 0;
                                    OUTPUTNUM = OUTPUTNUM + 1;
                                end
                            end
                        end
                        2: begin
                            if (IN == 0) begin
                                if (TABLE == 2'b01) begin
                                    case (OUTPUTNUM)
                                        0: X1 = 2;
                                        1: Y1 = 2;
                                        2: Z1 = 2;
                                        3: X2 = 2;
                                        4: Y2 = 2;
                                        5: Z2 = 2;
                                        6: X3 = 2;
                                        7: Y3 = 2;
                                        8: Z3 = 2;
                                        9: X4 = 2;
                                        10: Y4 = 2;
                                        11: Z4 = 2;
                                    endcase
                                    STATE = 0;
                                    OUTPUTNUM = OUTPUTNUM + 1;
                                end
                                else STATE = 4;
                            end
                            else begin //IN == 1
                                STATE = (TABLE == 2'b01)? 3: 5;
                            end
                        end
                        3: begin
                            if (IN == 0) begin
                                STATE = (TABLE == 2'b01)? 4: 6;
                            end
                            else begin //IN == 1
                                if (TABLE == 2'b11) begin
                                    case (OUTPUTNUM)
                                        0: X1 = 2;
                                        1: Y1 = 2;
                                        2: Z1 = 2;
                                        3: X2 = 2;
                                        4: Y2 = 2;
                                        5: Z2 = 2;
                                        6: X3 = 2;
                                        7: Y3 = 2;
                                        8: Z3 = 2;
                                        9: X4 = 2;
                                        10: Y4 = 2;
                                        11: Z4 = 2;
                                    endcase
                                    STATE = 0;
                                    OUTPUTNUM = OUTPUTNUM + 1;
                                end
                                else STATE = 5;
                            end
                        end
                        4: begin
                            if (IN == 0) begin
                                if (TABLE == 2'b01) begin
                                    case (OUTPUTNUM)
                                        0: X1 = 3;
                                        1: Y1 = 3;
                                        2: Z1 = 3;
                                        3: X2 = 3;
                                        4: Y2 = 3;
                                        5: Z2 = 3;
                                        6: X3 = 3;
                                        7: Y3 = 3;
                                        8: Z3 = 3;
                                        9: X4 = 3;
                                        10: Y4 = 3;
                                        11: Z4 = 3;
                                    endcase
                                    STATE = 0;
                                    OUTPUTNUM = OUTPUTNUM + 1;
                                end
                                else begin
                                    case (OUTPUTNUM)
                                        0: X1 = 4;
                                        1: Y1 = 4;
                                        2: Z1 = 4;
                                        3: X2 = 4;
                                        4: Y2 = 4;
                                        5: Z2 = 4;
                                        6: X3 = 4;
                                        7: Y3 = 4;
                                        8: Z3 = 4;
                                        9: X4 = 4;
                                        10: Y4 = 4;
                                        11: Z4 = 4;
                                    endcase
                                    STATE = 0;
                                    OUTPUTNUM = OUTPUTNUM + 1;
                                end
                            end
                            else begin //IN == 1
                                if (TABLE == 2'b01) begin
                                    case (OUTPUTNUM)
                                        0: X1 = 4;
                                        1: Y1 = 4;
                                        2: Z1 = 4;
                                        3: X2 = 4;
                                        4: Y2 = 4;
                                        5: Z2 = 4;
                                        6: X3 = 4;
                                        7: Y3 = 4;
                                        8: Z3 = 4;
                                        9: X4 = 4;
                                        10: Y4 = 4;
                                        11: Z4 = 4;
                                    endcase
                                    STATE = 0;
                                    OUTPUTNUM = OUTPUTNUM + 1;
                                end
                                else STATE = 7;
                            end
                        end
                        5: begin
                            if (IN == 0) begin
                                if (TABLE == 2'b01) begin
                                    case (OUTPUTNUM)
                                        0: X1 = 5;
                                        1: Y1 = 5;
                                        2: Z1 = 5;
                                        3: X2 = 5;
                                        4: Y2 = 5;
                                        5: Z2 = 5;
                                        6: X3 = 5;
                                        7: Y3 = 5;
                                        8: Z3 = 5;
                                        9: X4 = 5;
                                        10: Y4 = 5;
                                        11: Z4 = 5;
                                    endcase
                                    STATE = 0;
                                    OUTPUTNUM = OUTPUTNUM + 1;
                                end
                                else begin
                                    case (OUTPUTNUM)
                                        0: X1 = 8;
                                        1: Y1 = 8;
                                        2: Z1 = 8;
                                        3: X2 = 8;
                                        4: Y2 = 8;
                                        5: Z2 = 8;
                                        6: X3 = 8;
                                        7: Y3 = 8;
                                        8: Z3 = 8;
                                        9: X4 = 8;
                                        10: Y4 = 8;
                                        11: Z4 = 8;
                                    endcase
                                    STATE = 0;
                                    OUTPUTNUM = OUTPUTNUM + 1;
                                end
                            end
                            else begin //IN == 1
                                if (TABLE == 2'b11) begin
                                    case (OUTPUTNUM)
                                        0: X1 = 9;
                                        1: Y1 = 9;
                                        2: Z1 = 9;
                                        3: X2 = 9;
                                        4: Y2 = 9;
                                        5: Z2 = 9;
                                        6: X3 = 9;
                                        7: Y3 = 9;
                                        8: Z3 = 9;
                                        9: X4 = 9;
                                        10: Y4 = 9;
                                        11: Z4 = 9;
                                    endcase
                                    STATE = 0;
                                    OUTPUTNUM = OUTPUTNUM + 1;
                                end
                                else STATE = 6;
                            end
                        end
                        6: begin
                            if (IN == 0) begin
                                if (TABLE == 2'b11) begin
                                    case (OUTPUTNUM)
                                        0: X1 = 0;
                                        1: Y1 = 0;
                                        2: Z1 = 0;
                                        3: X2 = 0;
                                        4: Y2 = 0;
                                        5: Z2 = 0;
                                        6: X3 = 0;
                                        7: Y3 = 0;
                                        8: Z3 = 0;
                                        9: X4 = 0;
                                        10: Y4 = 0;
                                        11: Z4 = 0;
                                    endcase
                                    STATE = 0;
                                    OUTPUTNUM = OUTPUTNUM + 1;
                                end
                                else STATE = 7;
                            end
                            else begin //IN == 1
                                if (TABLE == 2'b01) begin
                                    case (OUTPUTNUM)
                                        0: X1 = 9;
                                        1: Y1 = 9;
                                        2: Z1 = 9;
                                        3: X2 = 9;
                                        4: Y2 = 9;
                                        5: Z2 = 9;
                                        6: X3 = 9;
                                        7: Y3 = 9;
                                        8: Z3 = 9;
                                        9: X4 = 9;
                                        10: Y4 = 9;
                                        11: Z4 = 9;
                                    endcase
                                    STATE = 0;
                                    OUTPUTNUM = OUTPUTNUM + 1;
                                end
                                else begin
                                    case (OUTPUTNUM)
                                        0: X1 = 1;
                                        1: Y1 = 1;
                                        2: Z1 = 1;
                                        3: X2 = 1;
                                        4: Y2 = 1;
                                        5: Z2 = 1;
                                        6: X3 = 1;
                                        7: Y3 = 1;
                                        8: Z3 = 1;
                                        9: X4 = 1;
                                        10: Y4 = 1;
                                        11: Z4 = 1;
                                    endcase
                                    STATE = 0;
                                    OUTPUTNUM = OUTPUTNUM + 1;
                                end
                            end
                        end
                        7: begin
                            if (IN == 0) begin
                                if (TABLE == 2'b01) begin
                                    case (OUTPUTNUM)
                                        0: X1 = 6;
                                        1: Y1 = 6;
                                        2: Z1 = 6;
                                        3: X2 = 6;
                                        4: Y2 = 6;
                                        5: Z2 = 6;
                                        6: X3 = 6;
                                        7: Y3 = 6;
                                        8: Z3 = 6;
                                        9: X4 = 6;
                                        10: Y4 = 6;
                                        11: Z4 = 6;
                                    endcase
                                    STATE = 0;
                                    OUTPUTNUM = OUTPUTNUM + 1;
                                end
                                else STATE = 8;
                            end
                            else begin //IN == 1
                                if (TABLE == 2'b01) STATE = 8;
                                else begin
                                    case (OUTPUTNUM)
                                        0: X1 = 7;
                                        1: Y1 = 7;
                                        2: Z1 = 7;
                                        3: X2 = 7;
                                        4: Y2 = 7;
                                        5: Z2 = 7;
                                        6: X3 = 7;
                                        7: Y3 = 7;
                                        8: Z3 = 7;
                                        9: X4 = 7;
                                        10: Y4 = 7;
                                        11: Z4 = 7;
                                    endcase
                                    STATE = 0;
                                    OUTPUTNUM = OUTPUTNUM + 1;
                                end
                            end
                        end
                        8: begin
                            if (IN == 0) begin
                                if (TABLE == 2'b01) begin
                                    case (OUTPUTNUM)
                                        0: X1 = 7;
                                        1: Y1 = 7;
                                        2: Z1 = 7;
                                        3: X2 = 7;
                                        4: Y2 = 7;
                                        5: Z2 = 7;
                                        6: X3 = 7;
                                        7: Y3 = 7;
                                        8: Z3 = 7;
                                        9: X4 = 7;
                                        10: Y4 = 7;
                                        11: Z4 = 7;
                                    endcase
                                    STATE = 0;
                                    OUTPUTNUM = OUTPUTNUM + 1;
                                end
                                else begin
                                    case (OUTPUTNUM)
                                        0: X1 = 5;
                                        1: Y1 = 5;
                                        2: Z1 = 5;
                                        3: X2 = 5;
                                        4: Y2 = 5;
                                        5: Z2 = 5;
                                        6: X3 = 5;
                                        7: Y3 = 5;
                                        8: Z3 = 5;
                                        9: X4 = 5;
                                        10: Y4 = 5;
                                        11: Z4 = 5;
                                    endcase
                                    STATE = 0;
                                    OUTPUTNUM = OUTPUTNUM + 1;
                                end
                            end
                            else begin //IN == 1
                                if (TABLE == 2'b01) begin
                                    case (OUTPUTNUM)
                                        0: X1 = 8;
                                        1: Y1 = 8;
                                        2: Z1 = 8;
                                        3: X2 = 8;
                                        4: Y2 = 8;
                                        5: Z2 = 8;
                                        6: X3 = 8;
                                        7: Y3 = 8;
                                        8: Z3 = 8;
                                        9: X4 = 8;
                                        10: Y4 = 8;
                                        11: Z4 = 8;
                                    endcase
                                    STATE = 0;
                                    OUTPUTNUM = OUTPUTNUM + 1;
                                end
                                else begin
                                    case (OUTPUTNUM)
                                        0: X1 = 6;
                                        1: Y1 = 6;
                                        2: Z1 = 6;
                                        3: X2 = 6;
                                        4: Y2 = 6;
                                        5: Z2 = 6;
                                        6: X3 = 6;
                                        7: Y3 = 6;
                                        8: Z3 = 6;
                                        9: X4 = 6;
                                        10: Y4 = 6;
                                        11: Z4 = 6;
                                    endcase
                                    STATE = 0;
                                    OUTPUTNUM = OUTPUTNUM + 1;
                                end
                            end
                        end
                    endcase
                end
            end
            else if(HAVENUM) begin
                if ((NOW+1)*3 < OUTPUTNUM) begin
                    OUT_VALID = 1;
                    case (NOW)
                        0: TMP = ((X1 - X2) ** 2 + (Y1 - Y2) ** 2 + (Z1 - Z2) **2);
                        1: TMP = ((X3 - X2) ** 2 + (Y3 - Y2) ** 2 + (Z3 - Z2) **2);
                        2: TMP = ((X3 - X4) ** 2 + (Y3 - Y4) ** 2 + (Z3 - Z4) **2);
                    endcase

                    if (TMP < 1) OUT = 0;
                    else if (TMP >= 1 && TMP < 4) OUT = 1;
                    else if (TMP >= 4 && TMP < 9) OUT = 2;
                    else if (TMP >= 9 && TMP < 16) OUT = 3;
                    else if (TMP >= 16 && TMP < 25) OUT = 4;
                    else if (TMP >= 25 && TMP < 36) OUT = 5;
                    else if (TMP >= 36 && TMP < 49) OUT = 6;
                    else if (TMP >= 49 && TMP < 64) OUT = 7;
                    else if (TMP >= 64 && TMP < 81) OUT = 8;
                    else if (TMP >= 81 && TMP < 100) OUT = 9;
                    else if (TMP >= 100 && TMP < 121) OUT = 10;
                    else if (TMP >= 121 && TMP < 144) OUT = 11;
                    else if (TMP >= 144 && TMP < 169) OUT = 12;
                    else if (TMP >= 169 && TMP < 196) OUT = 13;
                    else if (TMP >= 196 && TMP < 225) OUT = 14;
                    else if (TMP >= 225 && TMP < 256) OUT = 15;
                    else OUT = 16;

                    NOW = NOW + 1;
                end
                else begin
                    OUTPUTNUM = 0;
                    HAVENUM = 0;
                    TABLE = 0;
                    NOW = 0;
                    OUT_VALID = 0;
                    OUT = 0;
                end
            end
        end
    end
    
endmodule
