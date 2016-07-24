module adjust (clk,rst_n,data_a,data_b,data_c,data_d,done,out_1,out_2,out_3,out_4,out_5,out_6,out_7,out_a,out_b,out);
input 	clk,rst_n,done ;
input 	[11:0] data_a,data_b,data_c,data_d ;
output 	out_1,out_2,out_3,out_4,out_5,out_6,out_7,out_a,out_b ;
output   reg out ;
//output 	[3:0] dang ;

wire	[11:0] x,y,z;
wire  done_1,done_2;
reg 	[11:0] data,data_1,data_2,data_3,data_4,data_5;
//reg   done;


assign x = (data_a > data_b) ?  data_a : data_b ;
assign y = (data_c > data_d) ?  data_c : data_d ;
assign z = (x > y) ? x : y ;

assign done_1 = (data_1==12'h7ff)&&(data_2==12'h7ff)&&(data_3==12'h7ff)&&(data_4==12'h7ff)&&(data_5==12'h7ff);
//assign done_1 = (data_1>=12'h7f0)&&(data_2>=12'h7f0);
assign done_2 = (data_1<=12'd300)&&(data_2<=12'd300)&&(data_3<=12'd300)&&(data_4<=12'd300)&&(data_5<=12'd300);
//assign done_2 = (data_1<=12'd500)&&(data_2<=12'd5

//always @(posedge clk or negedge rst_n)
//begin
//	if(!rst_n)
//		done <= 1'b0;
//	else
//		done <= done_a;
//end

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n) begin
		data_1 <= 12'd0;
		data_2 <= 12'd0;
		data_3 <= 12'd0;
		data_4 <= 12'd0;
		data_5 <= 12'd0;
	end
	else if ((done) && (done_1)) begin
		data_1 <= 12'd1000;
		data_2 <= 12'd1000;
		data_3 <= 12'd1000;
		data_4 <= 12'd1000;
		data_5 <= 12'd1000;
	end
	else if ((done) && (done_2)) begin
		data_1 <= 12'd1000;
		data_2 <= 12'd1000;
		data_3 <= 12'd1000;
		data_4 <= 12'd1000;
		data_5 <= 12'd1000;
	end
	else if (done) begin
		data_1 <= z ;
		data_2 <= data_1;
		data_3 <= data_2;
		data_4 <= data_3;
		data_5 <= data_4;
	end
end

localparam one = 34'd1;
localparam two = 34'd2;
localparam three = 34'd3;
localparam four = 34'd4;
localparam five = 34'd5;
localparam six = 34'd6;
localparam seven = 34'd7;
localparam eight = 34'd8;
localparam nine = 32'd9;
localparam ten = 34'd10;
localparam eleven = 34'd11;
localparam twelve = 34'd12;
localparam thirteen = 34'd13;
localparam fourteen = 34'd14;
localparam fifteen = 34'd15 ;
localparam sixteen = 34'd16 ;
localparam seventeen = 34'd17 ;
localparam eighteen = 34'd18;
localparam nineteen = 34'd19;
localparam twenty = 34'd20;
localparam twenty_one = 34'd21;
/*
localparam twenty_two = 34'd22;
localparam twenty_three = 34'd23;

localparam twenty_four = 34'd24;
localparam twenty_five = 34'd25;
localparam twenty_six = 34'd26;
localparam twenty_seven = 34'd27;
localparam twenty_eigth = 34'd28;
localparam twenty_nine = 34'd29;
*/
localparam thirty = 34'd22;
localparam yanchi = 34'd23 ;
localparam yanchi_1 = 34'd24 ;
localparam yanchi_2 = 34'd25 ;
localparam yanchi_3 = 34'd26 ;


reg [25:0] state,n_state;
always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		state <= one;
	else
		state <= n_state ;
end

reg [7:0] aa ;
reg [19:0] bb ;

always@(*)
begin
	case (state) 
		one :begin
			if ((done) && (done_1)) //降档
				n_state = two ;
			else if ((done) && (done_2)) //升档
				n_state = one ;
			else
				n_state = one;
		end
		two : begin
			if ((done) && (done_1)) 
				n_state = three ;
			else if ((done) && (done_2))
				n_state = one ;
			else
				n_state = two;
		end
		three: begin
			if ((done) && (done_1))
				n_state = four ;
			else if ((done) && (done_2))
				n_state = two ;
			else
				n_state = three;
		end
		four : begin
			if ((done) && (done_1))
				n_state = five ;
			else if ((done) && (done_2))
				n_state = three ;
			else
				n_state = four;
		end
		five : begin
			if ((done) && (done_1))
//				n_state = yanchi ;
				n_state = six;
			else if ((done) && (done_2))
				n_state = four ;
			else
				n_state = five;
		end
		six : begin
			if ((done) && (done_1))
				n_state = seven ;
			else if ((done) && (done_2))
//				n_state = yanchi_1 ;
				n_state = five;
			else
				n_state = six;
		end
		seven : begin
			if ((done) && (done_1))
				n_state = eight ;
			else if ((done) && (done_2))
				n_state = six ;
			else
				n_state = seven;
		end
		eight : begin
			if ((done) && (done_1))
				n_state = nine ;
			else if ((done) && (done_2))
				n_state = seven ;
			else
				n_state = eight;
		end
		nine :begin
			if ((done) && (done_1)) 
				n_state = ten ;
			else if ((done) && (done_2))
				n_state = eight ;
			else
				n_state = nine;
		end
		ten : begin
			if ((done) && (done_1)) 
				n_state = yanchi ;//yanchi
//				n_state = eleven;
			else if ((done) && (done_2))
				n_state = nine ;
			else
				n_state = ten;
		end
		eleven: begin
			if ((done) && (done_1))
				n_state = twelve ;
			else if ((done) && (done_2))
//				n_state = ten;
				n_state = yanchi_1 ;//yanchi
			else
				n_state = eleven;
		end
		twelve : begin
			if ((done) && (done_1))
				n_state = thirteen ;
			else if ((done) && (done_2))
				n_state = eleven ;
			else
				n_state = twelve;
		end
		thirteen : begin
			if ((done) && (done_1))
				n_state = fourteen ;
			else if ((done) && (done_2))
				n_state = twelve ;
			else
				n_state = thirteen;
		end
		fourteen : begin
			if ((done) && (done_1))
				n_state = fifteen ;
			else if ((done) && (done_2))
				n_state = thirteen ;
			else
				n_state = fourteen;
		end
		fifteen : begin
			if ((done) && (done_1)) //降档
				n_state = sixteen ;
			else if ((done) && (done_2)) //升档
				n_state = fourteen ;
			else
				n_state = fifteen;
		end
		sixteen : begin
			if ((done) && (done_1)) //降档
				n_state = seventeen ;
			else if ((done) && (done_2)) //升档
				n_state = fifteen ;
			else
				n_state = sixteen;
		end
		seventeen : begin
			if ((done) && (done_1)) //降档
				n_state = eighteen ;
			else if ((done) && (done_2)) //升档
				n_state = sixteen ;
			else
				n_state = seventeen ;
		end
		eighteen  : begin
			if ((done) && (done_1)) //降档
				n_state = nineteen ;
			else if ((done) && (done_2)) //升档
				n_state = seventeen;
			else
				n_state = eighteen ;
		end
		nineteen : begin
			if ((done) && (done_1)) //降档
				n_state = twenty ;
			else if ((done) && (done_2)) //升档
				n_state = eighteen;
			else
				n_state = nineteen;
		end
		twenty : begin
			if ((done) && (done_1)) //降档
//				n_state = twenty_one ;
				n_state = yanchi_2;  //yanchi_1
			else if ((done) && (done_2)) //升档
				n_state = nineteen ;
			else
				n_state = twenty;
		end
		twenty_one : begin
			if ((done) && (done_1)) //降档
				n_state = twenty_one ;
			else if ((done) && (done_2)) //升档
				n_state = yanchi_3;                 //yanchi_1
//				n_state = twenty;
			else
				n_state = twenty_one;
		end
/*
		twenty_two : begin
			if ((done) && (done_1)) //降档
				n_state = twenty_three ;
			else if ((done) && (done_2)) //升档
				n_state = twenty_one ;
			else
				n_state = twenty_two;
		end
		twenty_three : begin
			if ((done) && (done_1)) //降档
				n_state = twenty_three;
			else if ((done) && (done_2)) //升档
				n_state = twenty_two ;
			else
				n_state = twenty_three;
		end

		twenty_four : begin
			if ((done) && (done_1)) //降档
				n_state = twenty_five;
			else if ((done) && (done_2)) //升档
				n_state = twenty_three;
			else
				n_state = twenty_four;
		end
		twenty_five : begin
			if ((done) && (done_1)) //降档
				n_state = twenty_six;
			else if ((done) && (done_2)) //升档
				n_state = twenty_four ;
			else
				n_state = twenty_five;
		end
		twenty_six : begin
			if ((done) && (done_1)) //降档
				n_state = twenty_seven ;
			else if ((done) && (done_2)) //升档
				n_state = twenty_five ;
			else
				n_state = twenty_six;
		end
		twenty_seven : begin
			if ((done) && (done_1)) //降档
				n_state = twenty_eigth ;
			else if ((done) && (done_2)) //升档
				n_state = twenty_six;
			else
				n_state = twenty_seven;
		end
		twenty_eigth : begin
			if ((done) && (done_1)) //降档
				n_state = twenty_nine ;
			else if ((done) && (done_2)) //升档
				n_state = twenty_seven ;
			else
				n_state = twenty_eigth;
		end
		twenty_nine : begin
			if ((done) && (done_1)) //降档
				n_state = thirty ;
			else if ((done) && (done_2)) //升档
				n_state = twenty_eigth ;
			else
				n_state = twenty_nine;
		end
		thirty : begin
			if ((done) && (done_1)) //降档
				n_state = thirty ;
			else if ((done) && (done_2)) //升档
				n_state = twenty_nine;
			else
				n_state = thirty;
		end
*/
		yanchi : n_state = (aa == 8'd1) ? eleven : yanchi ;
		yanchi_1 : n_state = (aa == 8'd1) ? ten : yanchi_1 ;
		yanchi_2 : n_state = (aa == 8'd1) ? twenty_one : yanchi_2 ;
		yanchi_3 : n_state = (aa == 8'd1) ? twenty : yanchi_3 ;	
		
		default : n_state = one ;
	endcase
end	

always @(posedge clk or negedge rst_n)
begin
	if (!rst_n) begin
		aa <= 8'd0 ;
		bb <= 23'd0 ;
	end
	else if (state == yanchi || state == yanchi_1 || state == yanchi_2 || state == yanchi_3) begin
		if (bb>=23'd9_999) begin
			bb <= 23'd0 ;
			aa <= aa + 8'd1 ;
		end
		else begin
			bb <= bb + 23'd1 ;
		end	
	end
	else begin
		aa <= 8'd0 ;
		bb <= 23'd0 ;
	end
end

always@(posedge clk or negedge rst_n)
begin
	if (!rst_n)
		out <= 1'b1 ;
	else if (state == yanchi && n_state == six)
		out <= 1'b1 ;
	else if (state == yanchi_1 && n_state == five)
		out <= 1'b1 ;
	else if (state == yanchi_2 && n_state == eleven)
		out <= 1'b1 ;
	else if (state == yanchi_3 && n_state == ten)
		out <= 1'b1 ;
	else
		out <= 1'b0 ;
end



//assign out = 1'b1 ;
/*
assign out_1 = (state == one || state == six || state == eleven 
|| state == sixteen || state == twenty_one || state == twenty_six) ;
assign out_2 = (state == two || state == seven || state == twelve 
|| state == seventeen || state == twenty_two || state == twenty_seven);
assign out_3 = (state == three || state == eight || state == thirteen 
|| state == eighteen || state == twenty_three || state == twenty_eigth) ;
assign out_4 = (state == four || state == nine || state == fourteen 
|| state == nineteen || state == twenty_four || state == twenty_nine);
assign out_5 = (state == five || state == ten || state == fifteen 
|| state == twenty || state == twenty_five || state == thirty);
assign out_6 = (state == one || state == two || state == three || state == four || state == five 
|| state == eleven || state == twelve || state == thirteen || state == fourteen || state == fifteen 
|| state == twenty_one || state == twenty_two || state == twenty_three || state == twenty_four || state == twenty_five) ;
assign out_7 = (state == six || state == seven || state == eight || state == nine ||state == ten 
|| state == sixteen || state == seventeen || state == eighteen || state == nineteen || state == twenty 
|| state == twenty_six || state == twenty_seven || state == twenty_eigth || state == twenty_nine || state == thirty);
assign out_a = (state == one || state==two || state==three || state==four || state==five  
|| state == six || state == seven || state == eight || state == nine || state == ten ) ;
assign out_b = (state == one || state==two || state==three || state==four || state==five 
|| state == six || state == seven || state == eight || state == nine || state == ten 
|| state == eleven || state == twelve || state == thirteen || state == fourteen || state == fifteen 
|| state == sixteen || state == seventeen || state == eighteen || state == nineteen || state == twenty) ;
*/
assign out_1 = (state == one   || state == eight || state == fifteen) ;

assign out_2 = (state == two  || state == nine || state == sixteen );

assign out_3 = (state == three   || state == ten || state == seventeen) ;

assign out_4 = (state == four  || state == six || state == eleven || state == eighteen
|| state == twenty || state == thirteen);

assign out_5 = (state == five   || state == seven || state == twelve || state == nineteen
|| state == fourteen || state == twenty_one );

assign out_6 = (state == one || state == two || state == three || state == four || state == five || state == eight|| state == ten
|| state == eleven || state == twelve  || state == fifteen || state == nine || state == sixteen  || state == seventeen 
|| state == eighteen || state == nineteen) ;

assign out_7 = (state == six || state == seven  || state == thirteen  || state == fourteen
 || state == twenty || state == twenty_one);

assign out_a = (state == one || state==two || state==three || state==four || state==five  
|| state == six || state == seven ) ;

assign out_b = (state == one || state==two || state==three || state==four || state==five 
|| state == six || state == seven || state == eight || state == nine || state == ten 
|| state == eleven || state == twelve || state == thirteen || state == fourteen 
) ;
endmodule

