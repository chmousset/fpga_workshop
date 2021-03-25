/* Machine-generated using Migen */
module top(
	output reg [7:0] counter,
	input sys_clk,
	input sys_rst
);



always @(posedge sys_clk) begin
	counter <= (counter + 1'd1);
	if (sys_rst) begin
		counter <= 8'd0;
	end
end

endmodule

