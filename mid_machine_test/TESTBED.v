//################################################################################                
//                                                                                           
//   Design	: DLAB_TA
//  
//   Author	: Tsung-Yeh                               
//                                                                                           
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++           
//    	                                                                                     
//   File Name   : TESTBED.v                                                                     
//   Module Name : TESTBED                                                                       
//   Release version : V1.0 (13/11/16)                                        
//                                                                                           
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++           
//################################################################################ 

`define   DATA_BIT   6
`define   LIFO_BIT   6
`define   ADDR_BIT   5
`define IN_DLY 0


`timescale 1ns/10ps
`include "IN2POST.v"
`include "PATTERN.v"

module TESTBED;

//---------------------------------------------------------------------
// DUMP WAVEFORM
//---------------------------------------------------------------------

initial begin
   $fsdbDumpfile("IN2POST.fsdb");
   $fsdbDumpvars;
end

//---------------------------------------------------------------------
// SIGNAL DECLARATION
//---------------------------------------------------------------------

wire                     CLK, RESET, IN_VALID, OUT_VALID, OP_VALID;
wire  [`DATA_BIT-1:0]    IN;
wire  [`LIFO_BIT-1:0]    OUT;

//---------------------------------------------------------------------
// MODULE INSTANTIATION
//---------------------------------------------------------------------


PATTERN I_PATTERN
(
   .CLK( CLK ),
   .RESET( RESET ),
   .IN( IN ), 
   .IN_VALID( IN_VALID ), 
   .OP_VALID( OP_VALID ),  
   .OUT( OUT ), 
   .OUT_VALID( OUT_VALID )

);

IN2POST I_IN2POST
(
   .CLK( CLK ),
   .RESET( RESET ),
   .IN( IN ), 
   .IN_VALID( IN_VALID ), 
   .OP_VALID( OP_VALID ),       
   .OUT( OUT ), 
   .OUT_VALID( OUT_VALID )
);


       
endmodule
