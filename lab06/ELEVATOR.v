module ELEVATOR(FLOOR, OPEN, CLK, RESET, PEOPLE, GOTO);

    input               CLK, RESET, PEOPLE; 
    input       [2:0]    GOTO;
    output reg          OPEN;   
    output reg  [2:0]    FLOOR;

    reg         [2:0]   NEXT1, NEXT2;
    reg         [1:0]   STATE;

    always@(posedge CLK) begin
        // init
        if (RESET) begin
            OPEN = 0;
            FLOOR = 1;
            NEXT1 = 0;
            NEXT2 = 0;
            STATE = 0;
        end

        else begin
            case (STATE)
                //hlt
                0: begin
                    if (PEOPLE) begin
                        if (NEXT1) NEXT2 = GOTO;
                        else NEXT1 = GOTO;
                    end
                    else if (NEXT1) begin
                        if (FLOOR < NEXT1) begin
                            STATE = 1;
                            FLOOR = FLOOR + 1;
                        end
                        else begin
                            STATE = 2;
                            FLOOR = FLOOR - 1;
                        end
                        if (FLOOR == NEXT1) begin
                            OPEN = 1;
                            NEXT1 = NEXT2;
                            NEXT2 = 0;
                            if (NEXT1 > 0) begin
                                if (FLOOR < NEXT1) STATE = 1;
                                else STATE = 2;
                            end
                            else STATE = 0;
                        end
                    end
                    else begin
                        STATE = 0;
                        OPEN = 0;
                    end
                end
                //up
                1: begin
                    FLOOR = FLOOR + 1;
                    if (FLOOR == NEXT1) begin
                        OPEN = 1;
                        NEXT1 = NEXT2;
                        NEXT2 = 0;
                        if (NEXT1 > 0) begin
                            if (FLOOR < NEXT1) STATE = 1;
                            else STATE = 2;
                        end
                        else STATE = 0;
                    end
                    else begin
                        OPEN = 0;
                    end
                end
                //down
                2: begin
                    FLOOR = FLOOR - 1;
                    if (FLOOR == NEXT1) begin
                        OPEN = 1;
                        NEXT1 = NEXT2;
                        NEXT2 = 0;
                        if (NEXT1 > 0) begin
                            if (FLOOR < NEXT1) STATE = 1;
                            else STATE = 2;
                        end
                        else STATE = 0;
                    end
                    else begin
                        OPEN = 0;
                    end
                end
            endcase
        end
    end

endmodule
