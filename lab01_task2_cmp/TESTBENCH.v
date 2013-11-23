`timescale 1ns/10ps

`include "PATTERN.v"

`ifdef BEH
  `include "cmp4bit_b.v"
`endif

`ifdef DATA
  `include "cmp4bit_d.v"
`endif

`ifdef GATE
  `include "cmp4bit_g.v"
`endif

module TESTBENCH();

wire    [3:0]   A, B;    
wire            _EQL, _GT, _LT;

initial
begin
  `ifdef BEH
    $fsdbDumpfile("cmp4bit_b.fsdb");
    $fsdbDumpvars;
  `endif  

  `ifdef DATA
    $fsdbDumpfile("cmp4bit_d.fsdb");
    $fsdbDumpvars;
  `endif  
  
  `ifdef GATE
    $fsdbDumpfile("cmp4bit_g.fsdb");
    $fsdbDumpvars;
  `endif  
end

PATTERN u_pattern(
    .A(A),  
    .B(B),
    ._EQL(_EQL),  
    ._GT(_GT),  
    ._LT(_LT)
);

`ifdef BEH
cmp4bit_b u_cmp4bit_b(
    .A(A),  
    .B(B), 
    ._EQL(_EQL),  
    ._GT(_GT),  
    ._LT(_LT)
);
`endif

`ifdef DATA
cmp4bit_d u_cmp4bit_d(
    .A(A),  
    .B(B), 
    ._EQL(_EQL),  
    ._GT(_GT),  
    ._LT(_LT)
);
`endif

`ifdef GATE
cmp4bit_g u_cmp4bit_g(
    .A(A),  
    .B(B),
    ._EQL(_EQL),  
    ._GT(_GT),  
    ._LT(_LT)
);
`endif

endmodule 
