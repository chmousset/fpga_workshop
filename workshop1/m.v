/* Machine-generated using Migen */
module top(
	input sys_clk,
	input sys_rst
);

reg [27:0] counter = 28'd0;
wire user_led0;
wire user_led1;
wire user_led2;
wire user_led3;
wire user_led4;
wire user_led5;
wire user_led6;
wire user_led7;

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

