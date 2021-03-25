/* Machine-generated using Migen */
module top(
	output user_led0,
	output user_led1,
	output user_led2,
	output user_led3,
	output user_led4,
	output user_led5,
	output user_led6,
	output user_led7,
	input sys_clk,
	input sys_rst
);

reg [27:0] counter = 28'd0;

// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on

assign user_led0 = counter[27];
assign user_led1 = counter[26];
assign user_led2 = counter[25];
assign user_led3 = counter[24];
assign user_led4 = counter[23];
assign user_led5 = counter[22];
assign user_led6 = counter[21];
assign user_led7 = counter[20];

always @(posedge sys_clk) begin
	counter <= (counter + 1'd1);
	if (sys_rst) begin
		counter <= 28'd0;
	end
end

endmodule

