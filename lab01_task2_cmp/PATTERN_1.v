`timescale 1ns/10ps

module PATTERN(A, B, _EQL, _GT, _LT);
    output  A, B;
    input   _EQL, _GT, _LT;
    reg     A, B;

    initial begin
        $display("========== START ==========");

        A = 1'b0;    
        B = 1'b0;

        #5;
        if(_EQL !== 1'b1 || _GT !== 1'b0 || _LT !== 1'b0) begin
            $display("============FAIL============");
            $display("         --INPUT--");
            $display("         A = %d B = %d", 1'b0, 1'b0);
            $display("         ---------");
            $display("The correct ans is _EQL = %d _GT = %d _LT = %d", 1'b1, 1'b0, 1'b0);
            $display("Your ans is        _EQL = %d _GT = %d _LT = %d", _EQL, _GT, _LT);
            $finish;
        end

        A = 1'b0;
        B = 1'b1;

        #10;    //15s
        if(_EQL !== 1'b0 || _GT !== 1'b0 || _LT !== 1'b1) begin
            $display("============FAIL============");
            $display("         --INPUT--");
            $display("         A = %d B = %d", 1'b0, 1'b1);
            $display("         ---------");
            $display("The correct ans is _EQL = %d _GT = %d _LT = %d", 1'b0, 1'b0, 1'b1);
            $display("Your ans is        _EQL = %d _GT = %d _LT = %d", _EQL, _GT, _LT);
            $finish;
        end

        A = 1'b1;
        B = 1'b0;

        #7;     //22s
        if(_EQL !== 1'b0 || _GT !== 1'b1 || _LT !== 1'b0) begin
            $display("============FAIL============");
            $display("         --INPUT--");
            $display("         A = %d B = %d", 1'b1, 1'b0);
            $display("         ---------");
            $display("The correct ans is _EQL = %d _GT = %d _LT = %d", 1'b0, 1'b1, 1'b0);
            $display("Your ans is        _EQL = %d _GT = %d _LT = %d", _EQL, _GT, _LT);
            $finish;
        end

        A = 1'b1;
        B = 1'b1;

        #13;    //35s
        if(_EQL !== 1'b0 || _GT !== 1'b0 || _LT !== 1'b0) begin
            $display("============FAIL============");
            $display("         --INPUT--");
            $display("         A = %d B = %d", 1'b1, 1'b1);
            $display("         ---------");
            $display("The correct ans is _EQL = %d _GT = %d _LT = %d", 1'b1, 1'b0, 1'b0);
            $display("Your ans is        _EQL = %d _GT = %d _LT = %d", _EQL, _GT, _LT);
            $finish;
        end

        $display ("\033[01;33m**************************************\033[00m  ");
        $display("\033[01;33mPass Pattern!\033[00m  ");
        $display ("\033[01;33m**************************************\033[00m  ");
        $finish;

end

endmodule
