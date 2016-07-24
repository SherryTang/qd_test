module max (clk,rst_n,data_1,data_2,data_3,data_4,en,out_1,out_2,out_3,out_4,done);
input clk,rst_n,en;
input [11:0] data_1,data_2,data_3,data_4 ;
output [11:0] out_1,out_2,out_3,out_4;
output done;

localparam idle = 3'b001 ;
localparam start = 3'b010 ;
localparam wait_a = 3'b100 ; 

reg [2:0] state,n_state;

always@(posedge clk or negedge rst_n) //第一段
begin
	if(!rst_n)
		state <= idle;
	else
		state <= n_state;
end

reg [3:0] cnt ;

always @(*)
begin
	case(state)
		idle : n_state = (en) ? start : idle ;
		start : n_state = (!en) ? wait_a : start ;
		wait_a : n_state = (cnt>= 4'd8) ? idle : wait_a ;
		default : n_state = idle ;
	endcase
end

reg 	[11:0] out_reg_1,out_reg_2,out_reg_3,out_reg_4;
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		out_reg_1<= 12'd0 ;
	else if(n_state == start)begin
		if(out_reg_1 < data_1) begin
			out_reg_1 <= data_1;
		end
	end
	else if(n_state == idle)
		out_reg_1 <= 12'd0;
end

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		out_reg_2<= 12'd0 ;
	else if(n_state == start)begin
		if(out_reg_2 < data_2) begin
			out_reg_2 <= data_2;
		end
	end
	else if(n_state == idle)
		out_reg_2 <= 12'd0;
end

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		out_reg_3<= 12'd0 ;
	else if(n_state == start)begin
		if(out_reg_3 < data_3) begin
			out_reg_3 <= data_3;
		end
	end
	else if(n_state == idle)
		out_reg_3 <= 12'd0;
end

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		out_reg_4<= 12'd0 ;
	else if(n_state == start)begin
		if(out_reg_4 < data_4) begin
			out_reg_4 <= data_4;
		end
	end
	else if(n_state == idle)
		out_reg_4 <= 12'd0;
end

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		cnt <= 4'd0;
	else if(n_state == wait_a)
		cnt <= cnt + 4'd1;
	else 
		cnt <= 4'd0;
end

assign done = (n_state == wait_a) && (cnt == 4'd5) ;
assign out_1 = out_reg_1 ;
assign out_2 = out_reg_2 ;
assign out_3 = out_reg_3 ;
assign out_4 = out_reg_4 ;

endmodule

