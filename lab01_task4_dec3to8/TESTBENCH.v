`timescale 1ns/10ps

`include "PATTERN.v"

`ifdef GATE
  `include "dec3to8_g.v"
`endif

module TESTBENCH();

wire        A,B,C,EN;
wire [7:0]  Y;

initial
begin
  `ifdef GATE
    $fsdbDumpfile("dec3to8_g.fsdb");
    $fsdbDumpvars;
  `endif  
end

PATTERN u_pattern(
    .Y(Y),  
    .A(A),  
    .B(B),
    .C(C),
    .EN(EN)
);

`ifdef BEH
dec3to8_b u_dec3to8_b(
    .Y(Y),  
    .A(A),  
    .B(B),
    .C(C),
    .EN(EN)
);
`endif

`ifdef DATA
dec3to8_d u_dec3to8_d(
    .Y(Y),  
    .A(A),  
    .B(B),
    .C(C),
    .EN(EN)
);
`endif

`ifdef GATE
dec3to8_g u_dec3to8_g(
    .Y(Y),  
    .A(A),  
    .B(B),
    .C(C),
    .EN(EN)
);
`endif

endmodule 

