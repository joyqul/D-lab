module enc4to2_g(D, Y, _IN_ERR);
    input   [3:0]   D;
    output  [1:0]   Y;
    output          _IN_ERR;
    
    wire    [1:0]   Y;
    wire            _IN_ERR;
    
    wire            nd0, nd1, nd2, nd3;
    wire            w0, w1, w2, w3;
    
    not(nd0, D[0]);
    not(nd1, D[1]);
    not(nd2, D[2]);
    not(nd3, D[3]);

    or(Y[1], D[3], D[2]);
    or(Y[0], D[3], D[1]);
    
    or(w0, nd3, D[2], D[1], D[0]);
    or(w1, D[3], nd2, D[1], D[0]);
    or(w2, D[3], D[2], nd1, D[0]);
    or(w3, D[3], D[2], D[1], nd0);
    
    and(_IN_ERR, w0, w1, w2, w3);

endmodule
