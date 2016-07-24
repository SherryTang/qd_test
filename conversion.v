module conversion (clk,rst_n,ad_ch_a,ad_ch_b,ad_ch_c,ad_ch_d,done,ad_ch_out,valid);

input clk, rst_n, done;
input [11:0] ad_ch_a, ad_ch_b, ad_ch_c, ad_ch_d;
output [31:0] ad_ch_out;
output valid;

localparam idle = 2'b01;
localparam conv = 2'b10;
reg [1:0]n_state, state,cnt;
reg [11:0] ad_reg[3:0];

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n) begin
		ad_reg[0] <= 12'd0;
		ad_reg[1] <= 12'd0;
		ad_reg[2] <= 12'd0;
		ad_reg[3] <= 12'd0;
	end
	else if (done) begin
		ad_reg[0] <= ad_ch_a;
		ad_reg[1] <= ad_ch_b;
		ad_reg[2] <= ad_ch_c;
		ad_reg[3] <= ad_ch_d;
	end
end

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		state <= 2'b0;
	else 
		state <= n_state;
end

always @(*)
begin
	case (state)
		idle : n_state = (done == 1'b1) ? conv : idle ;
		conv : n_state = (cnt >= 2'd3) ? idle : conv ;
		default : n_state = idle;
	endcase
end

always @(posedge clk or negedge rst_n) 
begin
	if(!rst_n)
		cnt <= 2'd0;
	else if (state == conv)
		cnt <= cnt + 2'd1;
	else
		cnt <= 2'd0;
end

assign valid = (state == conv) ;
assign ad_ch_out = {20'd0, ad_reg[cnt]}; 

endmodule
