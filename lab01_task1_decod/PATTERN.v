`timescale 1ns/10ps

module PATTERN(/*input*/ B, A, Y);

output          A,B;
input   [3:0]   Y;
reg             A,B;

initial begin
    $display("============START============");
    B=0;
    A=0;

    #5;
    if(Y[3]!==1'b0 || Y[2]!==1'b0 || Y[1]!==1'b0 || Y[0]!==1'b1)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d",A ,B);
        $display("         ---------");
        $display("The correct ans is Y3=%d Y2=%d Y1=%d Y0=%d", 1'b0,1'b0,1'b0,1'b1);
        $display("Your ans is        Y3=%d Y2=%d Y1=%d Y0=%d", Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end
    B=0;
    A=1;

    #10;
    if(Y[3]!==1'b0 || Y[2]!==1'b1 || Y[1]!==1'b0 || Y[0]!==1'b0)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d",A ,B);
        $display("         ---------");
        $display("The correct ans is Y3=%d Y2=%d Y1=%d Y0=%d", 1'b0,1'b1,1'b0,1'b0);
        $display("Your ans is        Y3=%d Y2=%d Y1=%d Y0=%d", Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end
    B=1;
    A=1;

    #7;
    if(Y[3]!==1'b1 || Y[2]!==1'b0 || Y[1]!==1'b0 || Y[0]!==1'b0)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d",A ,B);
        $display("         ---------");
        $display("The correct ans is Y3=%d Y2=%d Y1=%d Y0=%d", 1'b1,1'b0,1'b0,1'b0);
        $display("Your ans is        Y3=%d Y2=%d Y1=%d Y0=%d", Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end
    B=1;
    A=0;

    #13;
    if(Y[3]!==1'b0 || Y[2]!==1'b0 || Y[1]!==1'b1 || Y[0]!==1'b0)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d",A ,B);
        $display("         ---------");
        $display("The correct ans is Y3=%d Y2=%d Y1=%d Y0=%d", 1'b0,1'b0,1'b1,1'b0);
        $display("Your ans is        Y3=%d Y2=%d Y1=%d Y0=%d", Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end
    B=1;
    A=1;

    #15;
    if(Y[3]!==1'b1 || Y[2]!==1'b0 || Y[1]!==1'b0 || Y[0]!==1'b0)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d",A ,B);
        $display("         ---------");
        $display("The correct ans is Y3=%d Y2=%d Y1=%d Y0=%d", 1'b1,1'b0,1'b0,1'b0);
        $display("Your ans is        Y3=%d Y2=%d Y1=%d Y0=%d", Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end
    B=0;
    A=1;

    #20;
    if(Y[3]!==1'b0 || Y[2]!==1'b1 || Y[1]!==1'b0 || Y[0]!==1'b0)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d",A ,B);
        $display("         ---------");
        $display("The correct ans is Y3=%d Y2=%d Y1=%d Y0=%d", 1'b0,1'b1,1'b0,1'b0);
        $display("Your ans is        Y3=%d Y2=%d Y1=%d Y0=%d", Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end
    B=1;
    A=1;

    #5;
    if(Y[3]!==1'b1 || Y[2]!==1'b0 || Y[1]!==1'b0 || Y[0]!==1'b0)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d",A ,B);
        $display("         ---------");
        $display("The correct ans is Y3=%d Y2=%d Y1=%d Y0=%d", 1'b1,1'b0,1'b0,1'b0);
        $display("Your ans is        Y3=%d Y2=%d Y1=%d Y0=%d", Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end
    B=1;
    A=0;

    #20;
    if(Y[3]!==1'b0 || Y[2]!==1'b0 || Y[1]!==1'b1 || Y[0]!==1'b0)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d",A ,B);
        $display("         ---------");
        $display("The correct ans is Y3=%d Y2=%d Y1=%d Y0=%d", 1'b0,1'b0,1'b0,1'b1);
        $display("Your ans is        Y3=%d Y2=%d Y1=%d Y0=%d", Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end
    B=1;
    A=1;

    #20;
    if(Y[3]!==1'b1 || Y[2]!==1'b0 || Y[1]!==1'b0 || Y[0]!==1'b0)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d",A ,B);
        $display("         ---------");
        $display("The correct ans is Y3=%d Y2=%d Y1=%d Y0=%d", 1'b1,1'b0,1'b0,1'b0);
        $display("Your ans is        Y3=%d Y2=%d Y1=%d Y0=%d", Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end
    B=0;
    A=1;

    #5;
    if(Y[3]!==1'b0 || Y[2]!==1'b1 || Y[1]!==1'b0 || Y[0]!==1'b0)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d",A ,B);
        $display("         ---------");
        $display("The correct ans is Y3=%d Y2=%d Y1=%d Y0=%d", 1'b0,1'b1,1'b0,1'b0);
        $display("Your ans is        Y3=%d Y2=%d Y1=%d Y0=%d", Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end
    B=0;
    A=0;

    #10;
    if(Y[3]!==1'b0 || Y[2]!==1'b0 || Y[1]!==1'b0 || Y[0]!==1'b1)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d",A ,B);
        $display("         ---------");
        $display("The correct ans is Y3=%d Y2=%d Y1=%d Y0=%d", 1'b0,1'b0,1'b0,1'b1);
        $display("Your ans is        Y3=%d Y2=%d Y1=%d Y0=%d", Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end
    B=0;
    A=0;

    if(Y[3]!==1'b0 || Y[2]!==1'b0 || Y[1]!==1'b0 || Y[0]!==1'b1)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d",A ,B);
        $display("         ---------");
        $display("The correct ans is Y3=%d Y2=%d Y1=%d Y0=%d", 1'b0,1'b0,1'b0,1'b1);
        $display("Your ans is        Y3=%d Y2=%d Y1=%d Y0=%d", Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end

    $display ("\033[01;33m**************************************\033[00m  ");
    $display("\033[01;33mYou Pass TA's Pattern!\033[00m  ");
    $display ("\033[01;33m**************************************\033[00m  ");
    $finish;

end

endmodule
