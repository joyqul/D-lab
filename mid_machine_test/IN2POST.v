module IN2POST(RESET,CLK,IN,IN_VALID,OP_VALID,OUT,OUT_VALID);

    input RESET, CLK;
    input [5:0]IN;
    input IN_VALID,OP_VALID;
    output [5:0]OUT;
    output OUT_VALID;
    
    reg [5:0]OUT;
    reg OUT_VALID;

    reg [95:0]  input_data, output_data;
    reg [4:0]   nowstp, output_len, blank;
    reg         state, finish;
    
    always@(posedge CLK or RESET) begin
        if (RESET == 1) begin
            OUT_VALID = 0;
            OUT = 0;
            nowstp = 0;
            input_data = 0;
            output_data = 0;
            output_len = 0;
            state = 0;
            finish = 0;
        end
        else begin
            if (IN_VALID && OP_VALID) begin
                state = 1;
                if (IN == 6'h29) begin
                    OUT_VALID = 0;
                    output_len = output_len + 1;
                    output_data = output_data >>6;
                    output_data[95:90] = input_data[5:0];
                    input_data = input_data >>12;
                    if (input_data == 0) begin
                        blank = 16 - output_len;
                        output_data = output_data >> (blank * 6);
                        nowstp = 1;
                        OUT = output_data[5:0];
                        OUT_VALID = 1;
                        output_data = output_data >>6;
                    end
                end
                else begin
                    OUT_VALID = 0;
                    input_data = input_data <<6;
                    input_data[5:0] = IN;
                end
            end
            else if (IN_VALID && !OP_VALID) begin
                state = 1;
                output_len = output_len + 1;
                output_data = output_data >>6;
                output_data[95:90] = IN;
                OUT_VALID = 0;
            end
            else if (!IN_VALID) begin
                if (state == 1) begin
                    OUT_VALID = 1;

                    nowstp = nowstp + 1;
                    if (nowstp != 0 && nowstp < output_len + 1) begin
                        OUT = output_data[5:0];
                        output_data = output_data >>6;
                    end

                    if (nowstp == output_len + 1) begin
                        OUT_VALID = 0;
                        nowstp = 0;
                        input_data = 0;
                        output_data = 0;
                        output_len = 0;
                        state = 0;
                    end
                end
            end
        end
    end
    
endmodule
