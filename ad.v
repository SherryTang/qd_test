module ad (clk,rst_n,ad_in,en,ad_out);

input clk,rst_n;
input [11:0] ad_in;
output reg  en;
output reg [11:0] ad_out ;

always @(posedge clk or negedge rst_n)
begin
	if (!rst_n)
		ad_out <= 12'd0;
//	else if (ad_in <= 12'd2047)
//		ad_out <= ad_in;
	else 
		ad_out <= ad_in ;
end

always @(posedge clk or negedge rst_n)
begin
	if (!rst_n)
		en <= 1'b0;
	else if (ad_in >=12'd300 && ad_in <= 12'd2047)
		en <= 1'b1;
	else
		en <= 1'b0;
end

endmodule
