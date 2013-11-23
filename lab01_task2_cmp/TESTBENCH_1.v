`timescale 1ns/10ps

`include "PATTERN_1.v"

`ifdef BEH
  `include "cmp1bit_b.v"
`endif

`ifdef DATA
  `include "cmp1bit_d.v"
`endif

`ifdef GATE
  `include "cmp1bit_g.v"
`endif

module TESTBENCH();

wire    A, B;    
wire    _EQL, _GT, _LT;

initial
begin
  `ifdef BEH
    $fsdbDumpfile("cmp1bit_b.fsdb");
    $fsdbDumpvars;
  `endif  

  `ifdef DATA
    $fsdbDumpfile("cmp1bit_d.fsdb");
    $fsdbDumpvars;
  `endif  
  
  `ifdef GATE
    $fsdbDumpfile("cmp1bit_g.fsdb");
    $fsdbDumpvars;
  `endif  
end

PATTERN u_pattern(
    ._EQL(_EQL),  
    ._GT(_GT),  
    ._LT(_LT),
    .A(A),  
    .B(B)   
);

`ifdef BEH
cmp1bit_b u_cmp1bit_b(
    ._EQL(_EQL),  
    ._GT(_GT),  
    ._LT(_LT),
    .A(A),  
    .B(B)   
);
`endif

`ifdef DATA
cmp1bit_d u_cmp1bit_d(
    ._EQL(_EQL),  
    ._GT(_GT),  
    ._LT(_LT),
    .A(A),  
    .B(B)   
);
`endif

`ifdef GATE
cmp1bit_g u_cmp1bit_g(
    ._EQL(_EQL),  
    ._GT(_GT),  
    ._LT(_LT),
    .A(A),  
    .B(B)   
);
`endif

endmodule 
