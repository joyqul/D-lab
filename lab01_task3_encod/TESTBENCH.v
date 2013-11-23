`timescale 1ns/10ps

`include "PATTERN.v"

`ifdef BEH
  `include "enc4to2_b.v"
`endif

`ifdef DATA
  `include "enc4to2_d.v"
`endif

`ifdef GATE
  `include "enc4to2_g.v"
`endif

module TESTBENCH();

wire    [3:0]   D;    
wire    [1:0]   Y;
wire            _IN_ERR;

initial
begin
  `ifdef BEH
    $fsdbDumpfile("enc4to2_b.fsdb");
    $fsdbDumpvars;
  `endif  

  `ifdef DATA
    $fsdbDumpfile("enc4to2_d.fsdb");
    $fsdbDumpvars;
  `endif  
  
  `ifdef GATE
    $fsdbDumpfile("enc4to2_g.fsdb");
    $fsdbDumpvars;
  `endif  
end

PATTERN u_pattern(
    .D(D),  
    .Y(Y),
    ._IN_ERR(_IN_ERR)
);

`ifdef BEH
enc4to2_b u_enc4to2_b(
    .D(D),  
    .Y(Y),
    ._IN_ERR(_IN_ERR)
);
`endif

`ifdef DATA
enc4to2_d u_enc4to2_d(
    .D(D),  
    .Y(Y),
    ._IN_ERR(_IN_ERR)
);
`endif

`ifdef GATE
enc4to2_g u_enc4to2_g(
    .D(D),  
    .Y(Y),
    ._IN_ERR(_IN_ERR)
);
`endif

endmodule 

