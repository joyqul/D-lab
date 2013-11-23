`timescale 1ns/10ps

`include "PATTERN.v"

`ifdef BEH
  `include "dec2to4_b.v"
`endif

`ifdef DATA
  `include "dec2to4_d.v"
`endif

`ifdef GATE
  `include "dec2to4_g.v"
`endif

module TESTBENCH();

wire        B,A;    
wire [3:0]  Y;

initial
begin
  `ifdef BEH
    $fsdbDumpfile("dec2to4_b.fsdb");
    $fsdbDumpvars;
  `endif  

  `ifdef DATA
    $fsdbDumpfile("dec2to4_d.fsdb");
    $fsdbDumpvars;
  `endif  
  
  `ifdef GATE
    $fsdbDumpfile("dec2to4_g.fsdb");
    $fsdbDumpvars;
  `endif  
end

PATTERN u_pattern(
    .Y(Y),  
    .A(A),  
    .B(B)   
);

`ifdef BEH
dec2to4_b u_dec2to4_b(
    .Y(Y),  
    .A(A),  
    .B(B)   
);
`endif

`ifdef DATA
dec2to4_d u_dec2to4_d(
    .Y(Y),  
    .A(A),  
    .B(B)   
);
`endif

`ifdef GATE
dec2to4_g u_dec2to4_g(
    .Y(Y),  
    .A(A),  
    .B(B)   
);
`endif

endmodule 

