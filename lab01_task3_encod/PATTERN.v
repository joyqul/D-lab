`timescale 1ns/10ps

module PATTERN(/*input*/ D, Y, _IN_ERR);

output  [3:0]   D;
input   [1:0]   Y;
input           _IN_ERR;

reg     [3:0]   D;

initial begin
    $display("============START============");
    D = 4'b1000;   // D = 8

    #5; //5s
    if(Y[1] !== 1'b1 || Y[0] !== 1'b1 || _IN_ERR !== 1'b0) begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         D = %d%d%d%d", D[3], D[2], D[1], D[0]);
        $display("         ---------");
        $display("The correct ans is Y1 = %d Y0 = %d _IN_ERR = %d", 1'b1, 1'b1, 1'b0);
        $display("Your ans is        Y1 = %d Y0 = %d _IN_ERR = %d", Y[1], Y[0], _IN_ERR);
        $finish;
    end

    D = 4'b0000;    // D = 0

    #17;    //22s
    if(_IN_ERR !== 1'b1) begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         D = %d%d%d%d", D[3], D[2], D[1], D[0]);
        $display("         ---------");
        $display("The correct ans is Y1 = x  Y0 = x  _IN_ERR = %d", 1'b1);
        $display("Your ans is        Y1 = %d Y0 = %d _IN_ERR = %d", Y[1], Y[0], _IN_ERR);
        $finish;
    end

    D = 4'b1100;    // D = 12
    
    #13;    //35s
    if(_IN_ERR !== 1'b1) begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         D = %d%d%d%d", D[3], D[2], D[1], D[0]);
        $display("         ---------");
        $display("The correct ans is Y1 = x Y0 = x _IN_ERR = %d", 1'b1);
        $display("Your ans is        Y1 = %d Y0 = %d _IN_ERR = %d", Y[1], Y[0], _IN_ERR);
        $finish;
    end

    D = 4'b0100;   // D = 4

    #40; //75s
    if(Y[1] !== 1'b1 || Y[0] !== 1'b0 || _IN_ERR !== 1'b0) begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         D = %d%d%d%d", D[3], D[2], D[1], D[0]);
        $display("         ---------");
        $display("The correct ans is Y1 = %d Y0 = %d _IN_ERR = %d", 1'b1, 1'b0, 1'b0);
        $display("Your ans is        Y1 = %d Y0 = %d _IN_ERR = %d", Y[1], Y[0], _IN_ERR);
        $finish;
    end

    D = 4'b0011;    // D = 3
    
    #20;    //95s
    if(_IN_ERR !== 1'b1) begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         D = %d%d%d%d", D[3], D[2], D[1], D[0]);
        $display("         ---------");
        $display("The correct ans is Y1 = x Y0 = x _IN_ERR = %d", 1'b1);
        $display("Your ans is        Y1 = %d Y0 = %d _IN_ERR = %d", Y[1], Y[0], _IN_ERR);
        $finish;
    end

    D = 4'b0010;   // D = 2

    #40; //120s
    if(Y[1] !== 1'b0 || Y[0] !== 1'b1 || _IN_ERR !== 1'b0) begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         D = %d%d%d%d", D[3], D[2], D[1], D[0]);
        $display("         ---------");
        $display("The correct ans is Y1 = %d Y0 = %d _IN_ERR = %d", 1'b0, 1'b1, 1'b0);
        $display("Your ans is        Y1 = %d Y0 = %d _IN_ERR = %d", Y[1], Y[0], _IN_ERR);
        $finish;
    end

    D = 4'b0001;   // D = 1

    #10; //130s
    if(Y[1] !== 1'b0 || Y[0] !== 1'b0 || _IN_ERR !== 1'b0) begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         D = %d%d%d%d", D[3], D[2], D[1], D[0]);
        $display("         ---------");
        $display("The correct ans is Y1 = %d Y0 = %d _IN_ERR = %d", 1'b0, 1'b0, 1'b0);
        $display("Your ans is        Y1 = %d Y0 = %d _IN_ERR = %d", Y[1], Y[0], _IN_ERR);
        $finish;
    end

    $display ("\033[01;33m**************************************\033[00m  ");
    $display("\033[01;33mPass Pattern!\033[00m  ");
    $display ("\033[01;33m**************************************\033[00m  ");
    $finish;

end

endmodule
