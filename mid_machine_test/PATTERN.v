//################################################################################           
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++           
//   (C) Copyright Laboratory Over-Come Error And Noises Group           
//   All Right Reserved	                                                                     
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++           
//                                                                                           
//   Design	: DLAB_TA
//                                                      
//   Author	: Tsung-Yeh                       
//                                                                                           
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++           
//    	                                                                                     
//   File Name   : PATTERN.v                                                                     
//   Module Name : PATTERN                                                                       
//   Release version : V1.0 (13/11/16)                                        
//                                                                                           
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++           
//################################################################################ 
`define   DATA_BIT   6
`define   LIFO_BIT   6
`define   ADDR_BIT   5
`define   IN_DLY 0

module PATTERN(       
       // INPUT PORT
       OUT_VALID, 
       OUT,
       
       // OUTPUT PORT
       CLK, 
       RESET, 
       OP_VALID,
       IN_VALID, 
       IN ,

       );

input   [`LIFO_BIT-1:0]   OUT;
input                     OUT_VALID;

output  [`DATA_BIT-1:0]   IN;
output                    CLK, RESET, IN_VALID, OP_VALID;


parameter   STA0 = 2'b00, STA1 = 2'b01, STA2 = 2'b10, STA3 = 2'b11;
reg                       CLK, RESET, IN_VALID, OP_VALID;
reg     [`DATA_BIT-1:0]   IN;
reg	    [`DATA_BIT-1:0]   MEM_IN[0:200];
reg	    [`DATA_BIT-1:0]   MEM_OP[0:200];
reg	    [`LIFO_BIT-1:0]   MEM_OUT[0:200];

reg     [          5:0]   LATENCY;
reg     [          1:0]   CS, NS;
reg                       ERROR;    
reg     [          5:0]   COUNT_IN, COUNT_OUT;

wire    [`LIFO_BIT-1:0]   C_OUT;
wire    [          5:0]   re_latency;

reg                       IN_VALID_dly;
reg     [          9:0]  total_lantency;

reg     [          8:0]i, j, CORRECT_COUNT;
 
//---------------------------------------------------------------------
// CLOCK GENERATION
//---------------------------------------------------------------------

parameter                CYCLE = 20;

initial                  CLK = 0;
always #(CYCLE/2.0)      CLK = ~CLK;

//---------------------------------------------------------------------
// READ FILE
//---------------------------------------------------------------------

initial   $readmemh(       "IN.txt", MEM_IN);
initial   $readmemh( "OP_VALID.txt", MEM_OP);
initial   $readmemh(      "OUT.txt", MEM_OUT);

//---------------------------------------------------------------------
// INDEX 
//---------------------------------------------------------------------


always@(posedge CLK)
begin
	 if(IN_VALID)
     i <= #(0.5*CYCLE) i+1;
end

always@(posedge CLK)
begin
	 if(OUT_VALID)
     j <= j+1;
end

//---------------------------------------------------------------------
// MEM ASSIGNMENT
//---------------------------------------------------------------------

always@(IN_VALID or MEM_IN[i] or MEM_OP[i]) 
begin
	if(IN_VALID)
	begin
    IN       = #`IN_DLY MEM_IN[i]; 
    OP_VALID = #`IN_DLY MEM_OP[i];
  end
  else
  begin
    IN       = #`IN_DLY 0;
    OP_VALID = #`IN_DLY 0;
  end
end

assign  C_OUT = (OUT_VALID) ? MEM_OUT[j]:0;

always@(OUT_VALID or C_OUT or OUT)
begin
	if(OUT_VALID && (C_OUT!==OUT))
    ERROR = 1;
  else
    ERROR = 0;
end

//---------------------------------------------------------------------
// FSM && LATENCY COUNTER
//---------------------------------------------------------------------

always @(posedge CLK or posedge RESET)
//always @(posedge CLK or posedge CLK) maked by tyh
begin
   if(RESET)
      IN_VALID_dly <= 1'b0;
   else
      IN_VALID_dly <= OUT_VALID;
end

always@(posedge CLK or posedge RESET)
begin
	if(RESET)
	    COUNT_IN <= 1'b0;
	else if(IN_VALID)
	    COUNT_IN <= COUNT_IN + 1'b1;    
end

always@(posedge CLK or posedge RESET)
begin
	if(RESET)
	    COUNT_OUT <= 1'b0;
	else if(OUT_VALID)
	    COUNT_OUT <= COUNT_OUT + 1'b1;    
end

always@(posedge CLK or posedge RESET)
begin
	if(RESET)		
	  LATENCY <= 6'b0;
    else if(IN_VALID == 1'b1 && IN_VALID_dly == 1'b0)
    LATENCY <= 6'd0;
	else if(((COUNT_OUT<CORRECT_COUNT)&&!IN_VALID)) //maked by tyh		  //(OP_VALID&&(IN==3'b101))
	//else if(&&!IN_VALID) 
	  LATENCY <= LATENCY + 6'b1;
	  else 
	  LATENCY <= LATENCY ;

end

assign re_latency = LATENCY-CORRECT_COUNT;

//---------------------------------------------------------------------
// TEST PATTERN
//---------------------------------------------------------------------

always@(posedge CLK)
begin
	if(ERROR!=0)
	begin
    $display ("");
    $display ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    $display ("        TEST FAILURE!!  INCORRECT OUTPUT!!      ");
	$display ("  CORRECT OUTPUT is %h!! YOUR OUTPUT is %h!!    ",C_OUT,OUT);
	$display ("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    $display ("");
    $finish;		
	end
  else if((LATENCY>(48+CORRECT_COUNT)))//&&OUT_VALID)
  begin
    $display ("");
    $display ("ERROR!!! Your latency (%2d) is larger than 48 cycles!!", re_latency);
    $display ("");
    $display ("XXXXXXXXXXXXXXXXXXXX");
    $display ("  TEST FAILURE !!!  ");
    $display ("XXXXXXXXXXXXXXXXXXXX");
    $display ("");
    $finish; 	
  end  
end

initial
begin
	
	LATENCY = 0;
	i = 0;
    j = 0;
	RESET = 0;
	IN_VALID = 0;
    ERROR = 0;
    total_lantency = 0;
  $display ("");
  $display ("--------------------------------------------------------------------------------");
  $display ("            DLAB ON-LINE TEST: INFIX TO POSTFIX TRANSFORMATION                  ");
  $display ("--------------------------------------------------------------------------------");
  $display ("");
 
  #(1*CYCLE)              RESET = 1;
  #(0.35*CYCLE)           RESET = 0;
  #(0.15*CYCLE)           CORRECT_COUNT = 6;
  
  #(3.5*CYCLE)    #`IN_DLY  IN_VALID = 1;
  #(13*CYCLE)             IN_VALID = 0;
  
  #(48*CYCLE)             
  
  $display ("");
  $display ("************************************************");
  $display ("  The latency of 1st pattern is %2d cycles!!  ",re_latency);
  $display ("************************************************");
  $display ("");                        
	total_lantency = total_lantency+re_latency;
 
  #(3*CYCLE)              IN_VALID = 1;
                          COUNT_IN = 0;
                          COUNT_OUT = 0;
                          CORRECT_COUNT = 6;
  #(13*CYCLE)             IN_VALID = 0;

  #(48*CYCLE) 

  $display ("");
  $display ("************************************************");
  $display ("  The latency of 2nd pattern is %2d cycles!!  ",re_latency);
  $display ("************************************************");
  $display ("");  
total_lantency = total_lantency+re_latency;

                          

  #(3*CYCLE)              IN_VALID = 1;
                          COUNT_IN = 0;
                          COUNT_OUT = 0;
                          CORRECT_COUNT = 4;
  #(9*CYCLE)             IN_VALID = 0;

  #(48*CYCLE)             

  $display ("");
  $display ("************************************************");
  $display ("  The latency of 3rd pattern is %2d cycles!!  ",re_latency);
  $display ("************************************************");
  $display ("");  
total_lantency = total_lantency+re_latency;
                          


  #(3*CYCLE)              IN_VALID = 1;
                          COUNT_IN = 0;
                          COUNT_OUT = 0;
                          CORRECT_COUNT = 6;
  #(13*CYCLE)             IN_VALID = 0;

  #(48*CYCLE)             

  $display ("");
  $display ("************************************************");
  $display ("  The latency of 4th pattern is %2d cycles!!  ",re_latency);
  $display ("************************************************");
  $display (""); 
total_lantency = total_lantency+re_latency;
  #(3*CYCLE)              IN_VALID = 1;
                          COUNT_IN = 0;
                          COUNT_OUT = 0;   
                          CORRECT_COUNT = 6;   
  #(13*CYCLE)             IN_VALID = 0;

  #(48*CYCLE)             

  $display ("");
  $display ("************************************************");
  $display ("  The latency of 5th pattern is %2d cycles!!  ",re_latency);
  $display ("************************************************");
  $display (""); 
 total_lantency = total_lantency+re_latency;  
  #(3*CYCLE)              IN_VALID = 1;
                          COUNT_IN = 0;
                          COUNT_OUT = 0;   
                          CORRECT_COUNT = 2;   
  #(5*CYCLE)             IN_VALID = 0;

  #(48*CYCLE)             

  $display ("");
  $display ("************************************************");
  $display ("  The latency of 6th pattern is %2d cycles!!  ",re_latency);
  $display ("************************************************");
  $display (""); 
 total_lantency = total_lantency+re_latency; 
   #(3*CYCLE)              IN_VALID = 1;
                          COUNT_IN = 0;
                          COUNT_OUT = 0;
                          CORRECT_COUNT = 2;
  #(5*CYCLE)             IN_VALID = 0;

    #(48*CYCLE)             

  $display ("");
  $display ("************************************************");
  $display ("  The latency of 7th pattern is %2d cycles!!  ",re_latency);
  $display ("************************************************");
  $display (""); 
 total_lantency = total_lantency+re_latency; 
   #(3*CYCLE)              IN_VALID = 1;
                          COUNT_IN = 0;
                          COUNT_OUT = 0;
                          CORRECT_COUNT = 6;
  #(13*CYCLE)             IN_VALID = 0;

  #(48*CYCLE)             

  $display ("");
  $display ("************************************************");
  $display ("  The latency of 8th pattern is %2d cycles!! ",re_latency);
  $display ("************************************************");
  $display (""); 
 total_lantency = total_lantency+re_latency; 
  #(3*CYCLE)              IN_VALID = 1;
                          COUNT_IN = 0;
                          COUNT_OUT = 0;
                          CORRECT_COUNT = 6;
  #(13*CYCLE)             IN_VALID = 0;

  #(48*CYCLE)             

  $display ("");
  $display ("************************************************");
  $display ("  The latency of 9th pattern is %2d cycles!!  ",re_latency);
  $display ("************************************************");
  $display (""); 
 total_lantency = total_lantency+re_latency; 
   #(3*CYCLE)              IN_VALID = 1;
                          COUNT_IN = 0;
                          COUNT_OUT = 0;
                          CORRECT_COUNT = 4;
  #(9*CYCLE)             IN_VALID = 0;

  #(48*CYCLE)             

  $display ("");
  $display ("************************************************");
  $display ("  The latency of 10th pattern is %2d cycles!! ",re_latency);
  $display ("************************************************");
  $display (""); 
 total_lantency = total_lantency+re_latency; 
    #(3*CYCLE)              IN_VALID = 1;
                          COUNT_IN = 0;
                          COUNT_OUT = 0;
                          CORRECT_COUNT = 4;
  #(9*CYCLE)             IN_VALID = 0;

  #(48*CYCLE)             

  $display ("");
  $display ("************************************************");
  $display ("  The latency of 11th pattern is %2d cycles!! ",re_latency);
  $display ("************************************************");
  $display (""); 
  total_lantency = total_lantency+re_latency; 
    #(3*CYCLE)              IN_VALID = 1;
                          COUNT_IN = 0;
                          COUNT_OUT = 0;
                          CORRECT_COUNT = 2;
  #(5*CYCLE)             IN_VALID = 0;

  #(48*CYCLE)             

  $display ("");
  $display ("************************************************");
  $display ("  The latency of 12th pattern is %2d cycles!! ",re_latency);
  $display ("************************************************");
  $display (""); 
  total_lantency = total_lantency+re_latency; 
    #(3*CYCLE)              IN_VALID = 1;
                          COUNT_IN = 0;
                          COUNT_OUT = 0;
                          CORRECT_COUNT = 4;
  #(9*CYCLE)             IN_VALID = 0;

  #(48*CYCLE)             

  $display ("");
  $display ("************************************************");
  $display ("  The latency of 13th pattern is %2d cycles!! ",re_latency);
  $display ("************************************************");
  $display (""); 
   total_lantency = total_lantency+re_latency; 
    #(3*CYCLE)              IN_VALID = 1;
                          COUNT_IN = 0;
                          COUNT_OUT = 0;
                          CORRECT_COUNT = 4;
  #(9*CYCLE)             IN_VALID = 0;

  #(48*CYCLE)             

  $display ("");
  $display ("************************************************");
  $display ("  The latency of 14th pattern is %2d cycles!! ",re_latency);
  $display ("************************************************");
  $display (""); 
  total_lantency = total_lantency+re_latency; 
    #(3*CYCLE)              IN_VALID = 1;
                          COUNT_IN = 0;
                          COUNT_OUT = 0;
                          CORRECT_COUNT = 6;
  #(13*CYCLE)             IN_VALID = 0;

  #(48*CYCLE)             

  $display ("");
  $display ("************************************************");
  $display ("  The latency of 15th pattern is %2d cycles!! ",re_latency);
  $display ("************************************************");
  $display ("");  
  total_lantency = total_lantency+re_latency; 
    #(3*CYCLE)              IN_VALID = 1;
                          COUNT_IN = 0;
                          COUNT_OUT = 0;
                          CORRECT_COUNT = 6;
  #(13*CYCLE)             IN_VALID = 0;

  #(48*CYCLE)             

  $display ("");
  $display ("************************************************");
  $display ("  The latency of 16th pattern is %2d cycles!! ",re_latency);
  $display ("************************************************");
  $display ("");  
 total_lantency = total_lantency+re_latency; 
    #(3*CYCLE)              IN_VALID = 1;
                          COUNT_IN = 0;
                          COUNT_OUT = 0;
                          CORRECT_COUNT = 6;
  #(13*CYCLE)             IN_VALID = 0;

  #(48*CYCLE)             

  $display ("");
  $display ("************************************************");
  $display ("  The latency of 17th pattern is %2d cycles!! ",re_latency);
  $display ("************************************************");
  $display ("");   
  total_lantency = total_lantency+re_latency; 
    #(3*CYCLE)              IN_VALID = 1;
                          COUNT_IN = 0;
                          COUNT_OUT = 0;
                          CORRECT_COUNT = 2;
  #(5*CYCLE)             IN_VALID = 0;

  #(48*CYCLE)             

  $display ("");
  $display ("************************************************");
  $display ("  The latency of 18th pattern is %2d cycles!! ",re_latency);
  $display ("************************************************");
  $display ("");  
   total_lantency = total_lantency+re_latency; 
    #(3*CYCLE)              IN_VALID = 1;
                          COUNT_IN = 0;
                          COUNT_OUT = 0;
                          CORRECT_COUNT = 4;
  #(9*CYCLE)             IN_VALID = 0;

  #(48*CYCLE)             

  $display ("");
  $display ("************************************************");
  $display ("  The latency of 19th pattern is %2d cycles!! ",re_latency);
  $display ("************************************************");
  $display (""); 
   total_lantency = total_lantency+re_latency; 
    #(3*CYCLE)              IN_VALID = 1;
                          COUNT_IN = 0;
                          COUNT_OUT = 0;
                          CORRECT_COUNT = 4;
  #(9*CYCLE)             IN_VALID = 0;

  #(48*CYCLE)             

  $display ("");
  $display ("************************************************");
  $display ("  The latency of 20th pattern is %2d cycles!! ",re_latency);
  $display ("************************************************");
  $display (""); 
     total_lantency = total_lantency+re_latency; 
  
  
  
  #(35*CYCLE)  
  
  $display ("");
  $display ("=================================================");
  $display ("                                                 ");
  $display ("      ^-^     TEST  SUCCESSFUL     ^-^           ");
  $display (" The total latency of on-line test is %2d cycles!",total_lantency);
  $display ("                                                 ");
  $display ("-------------------------------------------------");
  $display ("");
  
  #(20*CYCLE) $finish;
   
end

endmodule
