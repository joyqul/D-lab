`timescale 1ns/10ps

module PATTERN(A, B, _EQL, _GT, _LT);
    output  [3:0]   A, B;
    input           _EQL, _GT, _LT;
    reg     [3:0]   A, B;

    initial begin
        $display("========== START ==========");

        A = 4'b1000;    // A = 8, B = 2
        B = 4'b0010;

        #5;
        if(_EQL !== 1'b0 || _GT !== 1'b1 || _LT !== 1'b0) begin
            $display("============FAIL============");
            $display("         --INPUT--");
            $display("         A = %d%d%d%d B = %d%d%d%d", 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0);
            $display("         ---------");
            $display("The correct ans is _EQL = %d _GT = %d _LT = %d", 1'b0, 1'b1, 1'b0);
            $display("Your ans is        _EQL = %d _GT = %d _LT = %d", _EQL, _GT, _LT);
            $finish;
        end

        A = 4'b0000;    // A = 0, B = 2

        #10;    //15s
        if(_EQL !== 1'b0 || _GT !== 1'b0 || _LT !== 1'b1) begin
            $display("============FAIL============");
            $display("         --INPUT--");
            $display("         A = %d%d%d%d B = %d%d%d%d", 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0);
            $display("         ---------");
            $display("The correct ans is _EQL = %d _GT = %d _LT = %d", 1'b0, 1'b0, 1'b1);
            $display("Your ans is        _EQL = %d _GT = %d _LT = %d", _EQL, _GT, _LT);
            $finish;
        end

        B = 4'b1011;    // A = 0, B = 11

        #7;     //22s
        if(_EQL !== 1'b0 || _GT !== 1'b0 || _LT !== 1'b1) begin
            $display("============FAIL============");
            $display("         --INPUT--");
            $display("         A = %d%d%d%d B = %d%d%d%d", 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b1, 1'b1);
            $display("         ---------");
            $display("The correct ans is _EQL = %d _GT = %d _LT = %d", 1'b0, 1'b0, 1'b1);
            $display("Your ans is        _EQL = %d _GT = %d _LT = %d", _EQL, _GT, _LT);
            $finish;
        end

        A = 4'b1100;    // A = 12, B = 11

        #13;    //35s
        if(_EQL !== 1'b0 || _GT !== 1'b1 || _LT !== 1'b0) begin
            $display("============FAIL============");
            $display("         --INPUT--");
            $display("         A = %d%d%d%d B = %d%d%d%d", 1'b1, 1'b1, 1'b0, 1'b0, 1'b1, 1'b0, 1'b1, 1'b1);
            $display("         ---------");
            $display("The correct ans is _EQL = %d _GT = %d _LT = %d", 1'b0, 1'b1, 1'b0);
            $display("Your ans is        _EQL = %d _GT = %d _LT = %d", _EQL, _GT, _LT);
            $finish;
        end

        A = 4'b1101;    // A = 13, B = 11

        #15;    //50s
        if(_EQL !== 1'b0 || _GT !== 1'b1 || _LT !== 1'b0) begin
            $display("============FAIL============");
            $display("         --INPUT--");
            $display("         A = %d%d%d%d B = %d%d%d%d", 1'b1, 1'b1, 1'b0, 1'b1, 1'b1, 1'b0, 1'b1, 1'b1);
            $display("         ---------");
            $display("The correct ans is _EQL = %d _GT = %d _LT = %d", 1'b0, 1'b1, 1'b0);
            $display("Your ans is        _EQL = %d _GT = %d _LT = %d", _EQL, _GT, _LT);
            $finish;
        end

        B = 4'b1111;    // A = 13, B = 15

        #20;    //70s
        if(_EQL !== 1'b0 || _GT !== 1'b0 || _LT !== 1'b1) begin
            $display("============FAIL============");
            $display("         --INPUT--");
            $display("         A = %d%d%d%d B = %d%d%d%d", 1'b1, 1'b1, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1);
            $display("         ---------");
            $display("The correct ans is _EQL = %d _GT = %d _LT = %d", 1'b0, 1'b0, 1'b1);
            $display("Your ans is        _EQL = %d _GT = %d _LT = %d", _EQL, _GT, _LT);
            $finish;
        end

        B = 4'b1000;    // A = 13, B = 8

        #5;    //75s
        if(_EQL !== 1'b0 || _GT !== 1'b1 || _LT !== 1'b0) begin
            $display("============FAIL============");
            $display("         --INPUT--");
            $display("         A = %d%d%d%d B = %d%d%d%d", 1'b1, 1'b1, 1'b0, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0);
            $display("         ---------");
            $display("The correct ans is _EQL = %d _GT = %d _LT = %d", 1'b0, 1'b1, 1'b0);
            $display("Your ans is        _EQL = %d _GT = %d _LT = %d", _EQL, _GT, _LT);
            $finish;
        end

        A = 4'b0111;    // A = 7, B = 8

        #20;    //95s
        if(_EQL !== 1'b0 || _GT !== 1'b0 || _LT !== 1'b1) begin
            $display("============FAIL============");
            $display("         --INPUT--");
            $display("         A = %d%d%d%d B = %d%d%d%d", 1'b0, 1'b1, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0);
            $display("         ---------");
            $display("The correct ans is _EQL = %d _GT = %d _LT = %d", 1'b0, 1'b0, 1'b1);
            $display("Your ans is        _EQL = %d _GT = %d _LT = %d", _EQL, _GT, _LT);
            $finish;
        end

        A = 4'b1001;    // A = 9, B = 8

        #20;    //115s
        if(_EQL !== 1'b0 || _GT !== 1'b1 || _LT !== 1'b0) begin
            $display("============FAIL============");
            $display("         --INPUT--");
            $display("         A = %d%d%d%d B = %d%d%d%d", 1'b1, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0);
            $display("         ---------");
            $display("The correct ans is _EQL = %d _GT = %d _LT = %d", 1'b0, 1'b1, 1'b0);
            $display("Your ans is        _EQL = %d _GT = %d _LT = %d", _EQL, _GT, _LT);
            $finish;
        end

        B = 4'b0111;    // A = 9, B = 7

        #20;    //120s
        if(_EQL !== 1'b0 || _GT !== 1'b1 || _LT !== 1'b0) begin
            $display("============FAIL============");
            $display("         --INPUT--");
            $display("         A = %d%d%d%d B = %d%d%d%d", 1'b1, 1'b0, 1'b0, 1'b1, 1'b0, 1'b1, 1'b1, 1'b1);
            $display("         ---------");
            $display("The correct ans is _EQL = %d _GT = %d _LT = %d", 1'b0, 1'b1, 1'b0);
            $display("Your ans is        _EQL = %d _GT = %d _LT = %d", _EQL, _GT, _LT);
            $finish;
        end

        A = 4'b0101;    // A = 5, B = 7

        #10;    //130s
        if(_EQL !== 1'b0 || _GT !== 1'b0 || _LT !== 1'b1) begin
            $display("============FAIL============");
            $display("         --INPUT--");
            $display("         A = %d%d%d%d B = %d%d%d%d", 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b1, 1'b1);
            $display("         ---------");
            $display("The correct ans is _EQL = %d _GT = %d _LT = %d", 1'b0, 1'b0, 1'b1);
            $display("Your ans is        _EQL = %d _GT = %d _LT = %d", _EQL, _GT, _LT);
            $finish;
        end


        $display ("\033[01;33m**************************************\033[00m  ");
        $display("\033[01;33mPass Pattern!\033[00m  ");
        $display ("\033[01;33m**************************************\033[00m  ");
        $finish;

end

endmodule
