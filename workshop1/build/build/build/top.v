//--------------------------------------------------------------------------------
// Auto-generated by Migen (--------) & LiteX (--------) on 2020-09-30 23:29:26
//--------------------------------------------------------------------------------
module top(
	output wire user_led0,
	output wire user_led1,
	output wire user_led2,
	output wire user_led3,
	output wire user_led4,
	output wire user_led5,
	output wire user_led6,
	output wire user_led7,
	input wire clk25
);

reg [27:0] top_counter = 28'd0;
wire sys_clk;
wire sys_rst;
wire por_clk;
reg b_int_rst = 1'd1;

assign user_led0 = top_counter[27];
assign user_led1 = top_counter[26];
assign user_led2 = top_counter[25];
assign user_led3 = top_counter[24];
assign user_led4 = top_counter[23];
assign user_led5 = top_counter[22];
assign user_led6 = top_counter[21];
assign user_led7 = top_counter[20];
assign sys_clk = clk25;
assign por_clk = clk25;
assign sys_rst = b_int_rst;

always @(posedge por_clk) begin
	b_int_rst <= 1'd0;
end

always @(posedge sys_clk) begin
	top_counter <= (top_counter + 1'd1);
	if (sys_rst) begin
		top_counter <= 28'd0;
	end
end

endmodule
