module task2_counter( Din, load, UD, clk, mod, count,  done);
    //in, out port
    input wire load,UD,clk,mod;
    input wire signed [7:0] Din;
    output  reg done;
    output reg [7:0] count;
    reg [7:0] c_in, c_end;
    reg         c_mod, c_UD, hold;

    initial begin
        hold = 0;
    end
    
    //design
    always@(posedge clk) begin
        case(load)
            0: begin
            if (hold == 1) hold = 0;
            else begin
                if(c_UD == 1 && c_mod == 0) begin
                    count = count + 1;
                    if (count == c_end) begin
                        count = c_in;
                        done = 1;
                    end
                    else done = 0;
                end
                else if (c_UD == 1 && c_mod == 1) begin
                    count = count + 1;
                    if (count == c_end) begin
                        count = c_in;
                        done = 1;
                    end
                    else done = 0;
                end
                else if (c_UD == 0 && c_mod == 0) begin
                    count = count - 1;
                    if (count == c_end) begin
                        count = c_in;
                        done = 1;
                    end
                    else done = 0;
                end
                else begin
                    count = count - 1;
                    if (count == c_end) begin
                        count = c_in;
                        done = 1;
                    end
                    else done = 0;
                end
            end
            end
            1: begin
                hold = 1;
                if(UD == 1 && mod == 0) begin
                    c_in = Din;
                    c_end = 8'hff;
                    c_mod = mod;
                    c_UD = UD;
                    count = Din;
                    done = 0;
                end
                else if (UD == 1 && mod == 1) begin
                    c_in = 0;
                    c_end = Din;
                    c_mod = mod;
                    c_UD = UD;
                    count = 0;
                    done = 0;
                end
                else if (UD == 0 && mod == 0) begin
                    c_in = Din;
                    c_end = 0;
                    c_mod = mod;
                    c_UD = UD;
                    count = Din;
                    done = 0;
                end
                else begin
                    c_in = Din;
                    c_end = 0;
                    c_mod = mod;
                    c_UD = UD;
                    count = Din;
                    done = 0;
                end
            end
        endcase
    end
endmodule

