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
<<<<<<< Updated upstream
module seq_101(out,state,in,clk,rst_n);
// ports
input            in;
input            clk;
input            rst_n;
output reg       out;
output reg [1:0] state;

=======
module seq_101(out,state,clk_led,in,clk_50,rst_n);
// ports
input            in;
input            clk_50;//50mhz clock
input            rst_n;
output reg       out;
output reg [1:0] state;
output clk_led;// clock led

//1hz 3 sec clock

clk_div  div(
.clk_out(clk),
.clk_in(clk_50),	
.clk_led(clk_led)
);
// this convert 50Mhz to 1hz
>>>>>>> Stashed changes


// state assignment
parameter [1:0] S0 = 2'b00;
parameter [1:0] S1 = 2'b01;
parameter [1:0] S2 = 2'b10;
parameter [1:0] S3 = 2'b11;
reg [1:0] nxt;//next state
reg [1:0] pre;//present state

// input block
always @(in,pre)begin
 case (pre)
   S0: nxt = in? S1:S0;
   S1: nxt = in? S1:S2;
   S2: nxt = in? S3:S0;
   S3: nxt = in? S1:S0;
   default: nxt = S0;
<<<<<<< Updated upstream
	endcase
=======
	endcase//end of case
>>>>>>> Stashed changes
  end
 
 
// sequential block
 always @(posedge clk,negedge rst_n)begin
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
<<<<<<< Updated upstream
	  endcase
=======
	  endcase//end case
>>>>>>> Stashed changes
	end 
endmodule
