module task1_shift( Din, load, LR, clk, I_shift, Dout, Oshift  );
    //in, out port
    input wire                  load,LR,clk,I_shift;
    input wire signed   [7:0]   Din;
    output reg                  Oshift; 
    output reg          [7:0]   Dout;
    reg                 [7:0]   tmp_out;
    
    //design
    always@(posedge clk) begin
        if (load == 0) begin
            if (LR == 1) begin
                tmp_out = Dout;
                Oshift = Dout[7];
                Dout[7:1] = tmp_out[6:0];
                Dout[0] = I_shift;
            end
            else begin
                tmp_out = Dout;
                Oshift = Dout[0];
                Dout[6:0] = tmp_out[7:1];
                Dout[7] = I_shift;
            end
        end
        else Dout = Din;
    end
    
endmodule
