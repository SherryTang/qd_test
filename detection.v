module detection (clk,rst_n,ad_in,en_in,rst,gate) ;

input clk,rst_n,en_in,rst;
input [11:0] ad_in;
output reg gate; //en

reg [11:0] max ;
reg [23:0] cnt ,cnt_1;
reg [7:0] count ;
reg [9:0] cnt_a ;
wire [7:0] c_a,c_b ;
reg  [23:0] max_a ;
//reg rst_2;

localparam idle = 6'b00_001 ;
localparam fir = 6'b00_010 ;
localparam sec = 6'b00_100 ;
localparam thi = 6'b01_000 ;
localparam fou = 6'b10_000 ;
localparam fiv = 6'b100_000 ;
//localparam six = 7'b1_000_000 ;

parameter maikuan = 8'd4 ;
parameter zhouqi = 24'd2_499_999 ; 
parameter yanchi = 10'd750 ;

reg [5:0] n_state,state ;
reg en_a ;
wire en_b ; 

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		en_a <= 1'b0 ;
	else
		en_a <= en_in ;
end
assign en_b = (!en_in) && en_a ;  //检测下降沿

always@(posedge clk or negedge rst_n) //第一段
begin
	if(!rst_n )
		state <= idle;
	else if(rst)
//	else if(rst || rst_2)
		state <= idle ;
	else
		state <= n_state;
end

always @(*)
begin
	case (state)
		idle : n_state = (en_b && count >= maikuan) ? fir : idle ; //采第一个脉冲
		fir : n_state = (en_b && count >= maikuan) ? sec : fir  ; //采第二个脉冲
		sec : n_state = thi ; //计算两者间隔
		thi : n_state = (cnt -zhouqi <= 24'd50 || zhouqi-cnt <= 24'd50) ? fou : idle ;//判断两者间隔是不是脉冲周期
		fou : n_state = (cnt_a >= yanchi) ? fiv : fou ; //延迟一段时间
		fiv : n_state = state ; //开始周期循环
		default : n_state = idle ;
	endcase
end

always @(posedge clk or negedge rst_n) //计算脉宽宽度
begin
	if (!rst_n)
		count <= 8'd0 ;
	else if (en_a)
		count <= count + 8'd1 ;
	else
		count <= 8'd0 ;
end

assign c_a = (state == idle && en_b && count >= maikuan) ? count : 8'd0; //第一个脉宽
assign c_b = (state == fir && en_b && count >= maikuan) ? count : 8'd0; //第二个脉宽

always @(posedge clk or negedge rst_n)
begin
	if (!rst_n)
		cnt <= 24'd0 ;
	else if (state == idle || state == fou)
		cnt <= 24'd0 ;
	else if (state == fir)
		cnt <= cnt + 24'd1 ; 
	else if (state == sec)
		cnt <= cnt + c_a - c_b ;  //得到两个脉冲之间的宽度
	else if (state == fiv) begin
		if (cnt >= max_a ) //周期循环
			cnt <= 24'd0 ;
		else 
			cnt <= cnt +24'd1 ;
	end	
end

always @(posedge clk or negedge rst_n) //得到脉冲采集的时间
begin
	if (!rst_n)
		gate <= 1'b0 ;
	else if (state == fiv) begin 
		if (cnt >= (zhouqi - 24'd2000))
			gate <= 1'b1 ;
		else 
			gate <= 1'b0 ;//en
	end
end
/*
reg gate_1;
wire gate_down;
always @(posedge clk or negedge rst_n) 
begin
	if (!rst_n)
		gate_1 <= 1'b0;
	else
		gate_1 <= gate;
end	
assign gate_down = (~gate) && gate_1 ;
*/

always @(posedge clk or negedge rst_n) 
begin
	if (!rst_n)
		cnt_a <= 10'd0;
	else if (n_state == fou) 
		cnt_a <= cnt_a + 10'd1;
	else
		cnt_a <= 10'd0 ;
end

always @(posedge clk or negedge rst_n)
begin
	if (!rst_n) begin
		max_a <= zhouqi ;
	end
	else if (state == fiv && cnt == 24'd1) begin
		if (cnt_1 <= zhouqi - 24'd1000)  //当脉冲峰值向左移时，周期变小
			max_a <= 24'd2499_950;
	//	else if (cnt_1 > 24'd2499_999 - 24'd750 ) 
	//		max_a <= 24'd2499_999  ;
		else if (cnt_1 > zhouqi -24'd1000) //当脉冲峰值向右移时，周期变大
			max_a <= 24'd2500_050 ;
	end	
end

always @(posedge clk or negedge rst_n)
begin
	if (!rst_n) begin
		cnt_1 <= 24'd0 ;
		max <= 12'd0 ;
	end
	else if (state == fiv && cnt==(zhouqi - 24'd2002)) begin //每次要判断时，先清零
		cnt_1 <= 24'd0 ;
		max <= 12'd0 ;
	end
	else if (gate) begin  //判断出最大值和最大值所在位置 en
		if (max < ad_in) begin
			cnt_1 <= cnt ;
			max <= ad_in ;	
		end
	end	
end
/*
always @(posedge clk or negedge rst_n)
begin
	if (!rst_n) 
		rst_2 <= 1'b0;
	else if (gate_down) begin
		if(max < 24'd150)
			rst_2 <= 1'b1;
	end
	else 
		rst_2 <= 1'b0;
end
*/
endmodule
