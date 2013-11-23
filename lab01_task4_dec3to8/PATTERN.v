`timescale 1ns/10ps

module PATTERN(/*input*/ C, B, A, Y, EN);

output          A, B, C, EN;
input   [7:0]   Y;
reg             A, B, C, EN;

initial begin
    $display("============START============");
    A = 0;
    B = 0;
    C = 0;
    EN = 0;

    #5;
    if(Y[7]!=1'b1 || Y[6]!=1'b1 || Y[5]!=1'b1 || Y[4]!=1'b1 || Y[3]!==1'b1 || Y[2]!==1'b1 || Y[1]!==1'b1 || Y[0]!==1'b0)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d C=%d",A ,B, C);
        $display("         ---------");
        $display("The correct ans is Y=%d%d%d%d%d%d%d%d",1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0);
        $display("Your ans is        Y=%d%d%d%d%d%d%d%d",Y[7],Y[6],Y[5],Y[4],Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end

    A = 0;
    B = 0;
    C = 1;
    EN = 0;

    #5;
    if(Y[7]!=1'b1 || Y[6]!=1'b1 || Y[5]!=1'b1 || Y[4]!=1'b1 || Y[3]!==1'b1 || Y[2]!==1'b1 || Y[1]!==1'b0 || Y[0]!==1'b1)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d C=%d",A ,B, C);
        $display("         ---------");
        $display("The correct ans is Y=%d%d%d%d%d%d%d%d",1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b1);
        $display("Your ans is        Y=%d%d%d%d%d%d%d%d",Y[7],Y[6],Y[5],Y[4],Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end

    A = 0;
    B = 1;
    C = 0;
    EN = 0;

    #5;
    if(Y[7]!=1'b1 || Y[6]!=1'b1 || Y[5]!=1'b1 || Y[4]!=1'b1 || Y[3]!==1'b1 || Y[2]!==1'b0 || Y[1]!==1'b1 || Y[0]!==1'b1)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d C=%d",A ,B, C);
        $display("         ---------");
        $display("The correct ans is Y=%d%d%d%d%d%d%d%d",1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b1,1'b1);
        $display("Your ans is        Y=%d%d%d%d%d%d%d%d",Y[7],Y[6],Y[5],Y[4],Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end

    A = 0;
    B = 1;
    C = 1;
    EN = 0;

    #5;
    if(Y[7]!=1'b1 || Y[6]!=1'b1 || Y[5]!=1'b1 || Y[4]!=1'b1 || Y[3]!==1'b0 || Y[2]!==1'b1 || Y[1]!==1'b1 || Y[0]!==1'b1)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d C=%d",A ,B, C);
        $display("         ---------");
        $display("The correct ans is Y=%d%d%d%d%d%d%d%d",1'b1,1'b1,1'b1,1'b1,1'b0,1'b1,1'b1,1'b1);
        $display("Your ans is        Y=%d%d%d%d%d%d%d%d",Y[7],Y[6],Y[5],Y[4],Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end

    A = 1;
    B = 0;
    C = 0;
    EN = 0;

    #5;
    if(Y[7]!=1'b1 || Y[6]!=1'b1 || Y[5]!=1'b1 || Y[4]!=1'b0 || Y[3]!==1'b1 || Y[2]!==1'b1 || Y[1]!==1'b1 || Y[0]!==1'b1)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d C=%d",A ,B, C);
        $display("         ---------");
        $display("The correct ans is Y=%d%d%d%d%d%d%d%d",1'b1,1'b1,1'b1,1'b0,1'b1,1'b1,1'b1,1'b1);
        $display("Your ans is        Y=%d%d%d%d%d%d%d%d",Y[7],Y[6],Y[5],Y[4],Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end

    A = 1;
    B = 0;
    C = 1;
    EN = 0;

    #5;
    if(Y[7]!=1'b1 || Y[6]!=1'b1 || Y[5]!=1'b0 || Y[4]!=1'b1 || Y[3]!==1'b1 || Y[2]!==1'b1 || Y[1]!==1'b1 || Y[0]!==1'b1)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d C=%d",A ,B, C);
        $display("         ---------");
        $display("The correct ans is Y=%d%d%d%d%d%d%d%d",1'b1,1'b1,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1);
        $display("Your ans is        Y=%d%d%d%d%d%d%d%d",Y[7],Y[6],Y[5],Y[4],Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end

    A = 1;
    B = 1;
    C = 0;
    EN = 0;

    #5;
    if(Y[7]!=1'b1 || Y[6]!=1'b0 || Y[5]!=1'b1 || Y[4]!=1'b1 || Y[3]!==1'b1 || Y[2]!==1'b1 || Y[1]!==1'b1 || Y[0]!==1'b1)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d C=%d",A ,B, C);
        $display("         ---------");
        $display("The correct ans is Y=%d%d%d%d%d%d%d%d",1'b1,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1);
        $display("Your ans is        Y=%d%d%d%d%d%d%d%d",Y[7],Y[6],Y[5],Y[4],Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end

    A = 1;
    B = 1;
    C = 1;
    EN = 0;

    #5;
    if(Y[7]!=1'b0 || Y[6]!=1'b1 || Y[5]!=1'b1 || Y[4]!=1'b1 || Y[3]!==1'b1 || Y[2]!==1'b1 || Y[1]!==1'b1 || Y[0]!==1'b1)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d C=%d",A ,B, C);
        $display("         ---------");
        $display("The correct ans is Y=%d%d%d%d%d%d%d%d",1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1);
        $display("Your ans is        Y=%d%d%d%d%d%d%d%d",Y[7],Y[6],Y[5],Y[4],Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end

    A = 0;
    B = 0;
    C = 0;
    EN = 1;

    #5;
    if(Y[7]!=1'b1 || Y[6]!=1'b1 || Y[5]!=1'b1 || Y[4]!=1'b1 || Y[3]!==1'b1 || Y[2]!==1'b1 || Y[1]!==1'b1 || Y[0]!==1'b1)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d C=%d",A ,B, C);
        $display("         ---------");
        $display("The correct ans is Y=%d%d%d%d%d%d%d%d",1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1);
        $display("Your ans is        Y=%d%d%d%d%d%d%d%d",Y[7],Y[6],Y[5],Y[4],Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end

    A = 0;
    B = 0;
    C = 1;
    EN = 1;

    #5;
    if(Y[7]!=1'b1 || Y[6]!=1'b1 || Y[5]!=1'b1 || Y[4]!=1'b1 || Y[3]!==1'b1 || Y[2]!==1'b1 || Y[1]!==1'b1 || Y[0]!==1'b1)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d C=%d",A ,B, C);
        $display("         ---------");
        $display("The correct ans is Y=%d%d%d%d%d%d%d%d",1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1);
        $display("Your ans is        Y=%d%d%d%d%d%d%d%d",Y[7],Y[6],Y[5],Y[4],Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end

    A = 0;
    B = 1;
    C = 0;
    EN = 1;

    #5;
    if(Y[7]!=1'b1 || Y[6]!=1'b1 || Y[5]!=1'b1 || Y[4]!=1'b1 || Y[3]!==1'b1 || Y[2]!==1'b1 || Y[1]!==1'b1 || Y[0]!==1'b1)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d C=%d",A ,B, C);
        $display("         ---------");
        $display("The correct ans is Y=%d%d%d%d%d%d%d%d",1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1);
        $display("Your ans is        Y=%d%d%d%d%d%d%d%d",Y[7],Y[6],Y[5],Y[4],Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end

    A = 0;
    B = 1;
    C = 1;
    EN = 1;

    #5;
    if(Y[7]!=1'b1 || Y[6]!=1'b1 || Y[5]!=1'b1 || Y[4]!=1'b1 || Y[3]!==1'b1 || Y[2]!==1'b1 || Y[1]!==1'b1 || Y[0]!==1'b1)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d C=%d",A ,B, C);
        $display("         ---------");
        $display("The correct ans is Y=%d%d%d%d%d%d%d%d",1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1);
        $display("Your ans is        Y=%d%d%d%d%d%d%d%d",Y[7],Y[6],Y[5],Y[4],Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end

    A = 1;
    B = 0;
    C = 0;
    EN = 1;

    #5;
    if(Y[7]!=1'b1 || Y[6]!=1'b1 || Y[5]!=1'b1 || Y[4]!=1'b1 || Y[3]!==1'b1 || Y[2]!==1'b1 || Y[1]!==1'b1 || Y[0]!==1'b1)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d C=%d",A ,B, C);
        $display("         ---------");
        $display("The correct ans is Y=%d%d%d%d%d%d%d%d",1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1);
        $display("Your ans is        Y=%d%d%d%d%d%d%d%d",Y[7],Y[6],Y[5],Y[4],Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end

    A = 1;
    B = 0;
    C = 1;
    EN = 1;

    #5;
    if(Y[7]!=1'b1 || Y[6]!=1'b1 || Y[5]!=1'b1 || Y[4]!=1'b1 || Y[3]!==1'b1 || Y[2]!==1'b1 || Y[1]!==1'b1 || Y[0]!==1'b1)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d C=%d",A ,B, C);
        $display("         ---------");
        $display("The correct ans is Y=%d%d%d%d%d%d%d%d",1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1);
        $display("Your ans is        Y=%d%d%d%d%d%d%d%d",Y[7],Y[6],Y[5],Y[4],Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end

    A = 1;
    B = 1;
    C = 0;
    EN = 1;

    #5;
    if(Y[7]!=1'b1 || Y[6]!=1'b1 || Y[5]!=1'b1 || Y[4]!=1'b1 || Y[3]!==1'b1 || Y[2]!==1'b1 || Y[1]!==1'b1 || Y[0]!==1'b1)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d C=%d",A ,B, C);
        $display("         ---------");
        $display("The correct ans is Y=%d%d%d%d%d%d%d%d",1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1);
        $display("Your ans is        Y=%d%d%d%d%d%d%d%d",Y[7],Y[6],Y[5],Y[4],Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end

    A = 1;
    B = 1;
    C = 1;
    EN = 1;

    #5;
    if(Y[7]!=1'b1 || Y[6]!=1'b1 || Y[5]!=1'b1 || Y[4]!=1'b1 || Y[3]!==1'b1 || Y[2]!==1'b1 || Y[1]!==1'b1 || Y[0]!==1'b1)
    begin
        $display("============FAIL============");
        $display("         --INPUT--");
        $display("         A=%d B=%d C=%d",A ,B, C);
        $display("         ---------");
        $display("The correct ans is Y=%d%d%d%d%d%d%d%d",1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1);
        $display("Your ans is        Y=%d%d%d%d%d%d%d%d",Y[7],Y[6],Y[5],Y[4],Y[3],Y[2],Y[1],Y[0]);
        $finish;
    end

    $display ("\033[01;33m**************************************\033[00m  ");
    $display("\033[01;33mPass Pattern!\033[00m  ");
    $display ("\033[01;33m**************************************\033[00m  ");
    $finish;

end

endmodule
