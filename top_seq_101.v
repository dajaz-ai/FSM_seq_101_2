// top lvel design for sequence 101 

module top_seq_101(clk_led, out, state, in, clk_in, rst_n);
	// ports
	input in;
	input clk_in;
	input rst_n;
	output clk_led;
	output out;
	output [1:0] state;
	
	//nets
	wire clk_w;
	
  //instantiate clk_div
	clk_div  #(.PERIOD_OUT (3)) clk_div_inst(
	.clk_out(clk_w),
	.clk_in(clk_in),	
	.clk_led(clk_led)
	);
	// this convert 50Mhz to 1hz
	
	
  //instatiate seq_101
	seq_101 seq_101_inst(
	.out(out),
	.state(state),
	.in(in),
	.clk_in(clk_w),
	.rst_n(rst_n)
	
	);
	
endmodule
	
	