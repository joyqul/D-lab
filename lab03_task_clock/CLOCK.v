module CLOCK( HOUR, MINUTE, SECOND, err, RESET,  SET_MODE, SET_DATA, CLK);      
    
    // INPUT & OUTPUT DECL
    output reg [7:0]   HOUR, MINUTE, SECOND; 
    output reg         err;    
    input           CLK, RESET;
    input   [1:0]   SET_MODE;
    input   [3:0]   SET_DATA;
    
    // VARAIABLE DECL
    reg     [2:0]   last_mode, now_CLK;
    reg     [3:0]   last_data, dig_tmp;
    reg     [7:0]   tmp, change_hr, change_min;
    
    
    // DESIGN
    always@(CLK) begin
    if(CLK == 1) begin

        if(RESET == 1) begin
            HOUR = 0;
            MINUTE = 0;
            SECOND = 0;
            err = 0;
            last_mode = 0;
            now_CLK = 0;
        end
        else begin
            tmp = SECOND;
            SECOND = tmp + 1;
            // second
            if (SECOND[3:0] > 9) begin
                SECOND[3:0] = 0;
                dig_tmp = SECOND[7:4];
                SECOND[7:4] = dig_tmp + 1;
            end
            if (SECOND[7:4] > 5) begin
                SECOND = 0;
                dig_tmp = MINUTE[3:0];
                MINUTE[3:0] = dig_tmp + 1;
            end

            // minute
            if (MINUTE[3:0] > 9) begin
                MINUTE[3:0] = 0;
                dig_tmp = MINUTE[7:4];
                MINUTE[7:4] = dig_tmp + 1;
            end
            if (MINUTE[7:4] > 5) begin
                MINUTE = 0;
                dig_tmp = HOUR[3:0];
                HOUR[3:0] = dig_tmp + 1;
            end

            //hour
            if (HOUR[3:0] > 9) begin
                dig_tmp = HOUR[7:4];
                HOUR[7:4] = dig_tmp + 1;
                HOUR[3:0] = 0;
            end
            if ((HOUR[7:4] == 2) && (HOUR[3:0] > 3)) begin
                HOUR = 0;
            end

            // Change min
            if ((last_mode == 2'b01) && (now_CLK == 2)) begin
                last_mode = 0;
                now_CLK = 0;

                if (change_min[7:4] > 5) begin
                    change_min[7:4] = 5;
                    change_min[3:0] = 9;
                    err = 1;
                end
                MINUTE = change_min;
            end

            // Change hour
            if ((last_mode == 2'b10) && (now_CLK == 2)) begin
                last_mode = 0;
                now_CLK = 0;
                if((change_hr[7:4] > 2) || ((change_hr[7:4] == 2) && (change_hr[3:0] > 3))) begin
                    change_hr[7:4] = 2;
                    change_hr[3:0] = 3;
                    err = 1;
                end
                HOUR = change_hr;
            end

            // Change hr & min
            if ((last_mode == 2'b11) && (now_CLK == 4)) begin
                last_mode = 0;
                now_CLK = 0;
                if((change_hr[7:4] > 2) || ((change_hr[7:4] == 2) && (change_hr[3:0] > 3))) begin
                    change_hr[7:4] = 2;
                    change_hr[3:0] = 3;
                    err = 1;
                end
                HOUR = change_hr;
                if (change_min[7:4] > 5) begin
                    change_min[7:4] = 5;
                    change_min[3:0] = 9;
                    err = 1;
                end
                MINUTE = change_min;
            end

            // set mode change
            case(SET_MODE)
                2'b00:  err = 0;

                2'b01:  
                begin
                    if (last_mode != 1'b01) begin
                        last_mode = 2'b01;
                        now_CLK = 1;
                        change_min[7:4] = SET_DATA;
                    end
                    else if (now_CLK == 1) begin
                        now_CLK = 2;
                        change_min[3:0] = SET_DATA;
                    end
                end    

                2'b10:
                begin
                    if (last_mode != 2'b10) begin
                        last_mode = 2'b10;
                        now_CLK = 1;
                        change_hr[7:4] = SET_DATA;
                    end
                    else if (now_CLK == 1) begin
                        now_CLK = 2;
                        change_hr[3:0] = SET_DATA;
                    end
                end

                2'b11:
                begin
                    if (last_mode != 2'b11) begin
                        last_mode = 2'b11;
                        now_CLK = 1;
                        change_hr[7:4] = SET_DATA;
                    end
                    else if (now_CLK == 1) begin
                        now_CLK = 2;
                        change_hr[3:0] = SET_DATA;
                    end
                    else if (now_CLK == 2) begin
                        now_CLK = 3;
                        change_min[7:4] = SET_DATA;
                    end
                    else if (now_CLK == 3) begin
                        now_CLK = 4;
                        change_min[3:0] = SET_DATA;
                    end
                end
            endcase
        end
    end
    end
    
endmodule

