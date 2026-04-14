/*==================================
       SEQUENCE 101
====================================
Description:
This Moore FSM detects the non-overlapping
sequence 101, assuming the input stream
arrives LSB-first.

Design Engineer:

Regalado, Cid Lawrenc C.

Date:
March 31 2026
----------------------------------*/
module seq_101_2(out,state,in,clk_in,rst_n);
// ports
input            in;
input            clk_in;//50mhz clock
input            rst_n;
output reg       out;
output reg [1:0] state;


// state assignment
localparam [1:0] S0 = 2'b00;
localparam [1:0] S1 = 2'b01;
localparam [1:0] S2 = 2'b10;
localparam [1:0] S3 = 2'b11;

reg [1:0] nxt;//next state
reg [1:0] pre;//present state

// input block
always @(in,pre)begin
 case (pre)
   S0: nxt = in? S1:S0;
   S1: nxt = in? S1:S2;
   S2: nxt = in? S3:S0;
   S3: nxt = in? S1:S2;
   default: nxt = S0;
	endcase//end of case
  end
 
 
// sequential block
 always @(posedge clk_in,negedge rst_n)begin
   if(!rst_n) pre <= S0;
   else       pre <= nxt;
 end

// output block
always @(pre)begin
  case(pre)
     S0: begin 
             out = 0;
             state = S0;
          end
     S1: begin 
	          out = 0;
             state = S1;
          end
     S2: begin
               out = 0;
               state = S2;
          end
     S3: begin 
               out = 1;
               state = S3;
          end
	  default: begin 
               out = 0;
               state = S0;
          end
	  endcase//end case
	end 
endmodule
