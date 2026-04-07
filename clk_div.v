/**===============================================
		CLOCK DIVIDER
==================================================

Description:
 This module takes a high-frequency input clock ((clk_in) and divides it down to a 
 lower frequency. By default, it divides a 50MHz input clock down to 1s clock period 
 toggling the outputs every 25,000,000 ticks.

Design Engineer:
  Edward Paul M. Aragon
  Cid Lawrenc C. Regalado

Date:
  18 Feb 2026
================================================*/

module clk_div(clk_out,clk_led,clk_in);

//ports
  input clk_in;
  output reg clk_out = 1'b0;
  output reg clk_led = 1'b0;

//1s clock @50MHz
  parameter integer TICKS_500MS = 75_000_000; //number of ticks per 0.5s
  reg [26:0] tick_cnt = 28'b0; // count 0..75_000_000

  always@(posedge clk_in)begin 
    if(tick_cnt==TICKS_500MS-1)begin
	clk_out   <= ~clk_out;
	clk_led   <= ~clk_led;
        tick_cnt  <= 28'b0;
    end
    else tick_cnt <= tick_cnt + 28'b1; 
    

end








endmodule
