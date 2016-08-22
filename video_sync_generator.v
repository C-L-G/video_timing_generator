/****************************************
______________                ______________
______________ \  /\  /|\  /| ______________
______________  \/  \/ | \/ | ______________
--Module Name:  video_sync_generator.v
--Project Name: video_timming_generator
--Data modified: 2016-08-10 09:20:28 +0800
--author:Young-ÎâÃ÷
--E-mail: wmy367@Gmail.com
****************************************/
`timescale 1ns/1ps
`define P720_50
module video_sync_generator (
	input				pclk 		,
	input				rst_n       ,
	input				enable      ,
	//--->> Extend Sync
	output				vsync  		,
	output				hsync       ,
	output				de          ,
	output				field                    
);
/*             |-> start ->>>
          _____                                _______      __
DE   : XXX     \_______________......_________/        .....  \_____
                       ______
VS   : ........_______/      \_......_______________________
                  _     _             _     _     _
HS   : ........__/ \___/ \..___....../ \___/ \___/ \___.....
                ______________________________________________
FIELD:........./                                              \_____

*/
`include "video_sync_parameter.vh"

//----->> H SYNC <<------------------------
reg [12:0]		Hcnt;
reg				h_reg;

always@(posedge pclk,negedge rst_n)begin
	if(~rst_n)	Hcnt	<= 13'd0;
	else begin
		if(enable)begin
			if(Hcnt >= H_TOTAL-1'b1)
					Hcnt	<= 13'd0;
			else	Hcnt	<= Hcnt + 1'b1;
		end else	Hcnt	<= 13'd0;
end end

reg h_up_fp;
reg h_down_sync;

always@(posedge pclk,negedge rst_n)begin
	if(~rst_n)	h_up_fp	<= 1'b0;
	else		h_up_fp	<= (Hcnt >= H_FP);
end 

always@(posedge pclk,negedge rst_n)begin
	if(~rst_n)	h_down_sync	<= 1'b0;
	else		h_down_sync	<= Hcnt < (H_FP+H_SYNC);
end

always@(posedge pclk,negedge rst_n)begin
	if(~rst_n)	h_reg	<= 1'b0;
	else begin
		if(enable)
				h_reg	<=  h_up_fp && h_down_sync;
		else	h_reg	<= 1'b0;
end end
//-----<< H SYNC >>------------------------
//----->> V SYNC <<------------------------
reg 		v_inc_pulse;
always@(posedge pclk,negedge rst_n)begin
	if(~rst_n)	v_inc_pulse	<= 1'b0;
	else		v_inc_pulse	<= Hcnt == (H_TOTAL-2'd1);
end

reg [12:0]		Vcnt;

always@(posedge pclk,negedge rst_n)begin
	if(~rst_n)	Vcnt	<= 13'd0;
	else begin
		if(enable)begin
			if(v_inc_pulse)begin
				if(Vcnt >= V_TOTAL-1'b1)
					Vcnt	<= 13'd0;
				else
					Vcnt	<= Vcnt + 1'b1;
			end else
				Vcnt	<= Vcnt;
		end else
			Vcnt	<= 13'd0;
end end

reg v_odd_up_fp;
reg	v_odd_down_sync;
reg v_even_up_fp;
reg	v_even_down_sync;

always@(posedge pclk,negedge rst_n)begin
	if(~rst_n)begin
		v_odd_up_fp		<= 1'b0;
		v_odd_down_sync	<= 1'b0;
		v_even_up_fp	<= 1'b0;
		v_even_down_sync<= 1'b0;
	end else begin
		v_odd_up_fp		<= (Vcnt == V_ODD_FP) && (Hcnt == (V_ODD_OFFSET+H_FP));		
		v_odd_down_sync	<= (Vcnt == (V_ODD_FP+V_SYNC)) && (Hcnt == (V_ODD_FP+V_SYNC+V_ODD_OFFSET));
		v_even_up_fp	<= (Vcnt == V_EVEN_FP) && (Hcnt == (V_EVEN_OFFSET+H_FP));	
		v_even_down_sync<= (Vcnt == (V_EVEN_FP+V_SYNC)) && (Hcnt == (V_EVEN_FP+V_SYNC+V_EVEN_OFFSET));
end end
				
reg 			v_reg;

always@(posedge pclk,negedge rst_n)begin
	if(~rst_n)	v_reg	<= 1'b0;
	else begin
		if(INTERLACE == "TRUE")
			if(v_odd_up_fp)
				v_reg	<= 1'b1;
			else if(v_odd_down_sync)
				v_reg	<= 1'b0;
			else if(v_even_up_fp)
				v_reg	<= 1'b1;
			else if(v_even_down_sync)
				v_reg	<= 1'b0;
			else
				v_reg	<= v_reg;
		else
			if(v_odd_up_fp)
				v_reg	<= 1'b1;
			else if(v_odd_down_sync)
				v_reg	<= 1'b0;
			else
				v_reg	<= v_reg;
end end 

//-----<< V SYNC >>------------------------	
//----->> DISPLAY ENABLE <<----------------	

reg d_odd_up_blank;
reg d_odd_down_blank;

always@(posedge pclk,negedge rst_n)begin
	if(~rst_n)begin
		d_odd_up_blank		<= 1'b0;
		d_odd_down_blank	<= 1'b0;
	end else begin
		d_odd_up_blank		<= (Vcnt >= V_ODD_BLANK) && (Vcnt < (V_ODD_BLANK+V_ACTIVE)) && (Hcnt == H_BLANK);	
		d_odd_down_blank	<= 	(Vcnt >= V_ODD_BLANK) && 
								(Vcnt < (V_ODD_BLANK+V_ACTIVE)) && 
								(Hcnt == (H_BLANK+H_ACTIVE)) ||
								(Hcnt == 0); 
end end

reg d_even_up_blank;
reg d_even_down_blank;

always@(posedge pclk,negedge rst_n)begin
	if(~rst_n)begin
		d_even_up_blank		<= 1'b0;
		d_even_down_blank	<= 1'b0;
	end else begin
		d_even_up_blank		<= 	(Vcnt >= V_ODD_BLANK+V_ACTIVE+V_EVEN_BLANK) && 
								(Vcnt < (V_ODD_BLANK+V_ACTIVE+V_EVEN_BLANK+V_ACTIVE)) && (Hcnt == H_BLANK);	
		d_even_down_blank	<= 	(Vcnt >= V_ODD_BLANK+V_ACTIVE+V_EVEN_BLANK) && 
								(Vcnt < (V_ODD_BLANK+V_ACTIVE+V_EVEN_BLANK+V_ACTIVE)) && 
								(Hcnt == (H_BLANK+H_ACTIVE)) ||
								(Hcnt == 0); 
end end

reg 	d_reg;

always@(posedge pclk,negedge rst_n)
	if(~rst_n)	d_reg	<= 1'b0;
	else begin
		if(INTERLACE == "TRUE")
			if(d_odd_up_blank)
				d_reg	<= 1'b1;
			else if (d_odd_down_blank)
				d_reg	<= 1'b0;
			else if (d_even_up_blank)
				d_reg	<= 1'b1;
			else if (d_even_down_blank)
				d_reg	<= 1'b0;
			else
				d_reg	<= d_reg;
		else
			if(d_odd_up_blank)
				d_reg	<= 1'b1;
			else if (d_odd_down_blank)
				d_reg	<= 1'b0;
			else
				d_reg	<= d_reg;
	end 

//-----<< DISPLAY ENABLE >>----------------
//----->> FIELD <<-------------------------
reg y_reg;

always@(posedge pclk,negedge rst_n)
	if(~rst_n)	y_reg	<= 1'b0;
	else begin
		if(INTERLACE == "TRUE")begin
			if(v_even_up_fp)
				y_reg	<= 1'b1;
			else if(v_odd_up_fp)
				y_reg	<= 1'b0;
			else
				y_reg	<= y_reg;
		end else 
			y_reg	<= 1'b0;
	end	
//-----<< FIELD >>-------------------------
		


assign	vsync	= (NEGATED == "FALSE")? v_reg : ~v_reg;
assign	hsync	= (NEGATED == "FALSE")? h_reg : ~h_reg;
assign	de		= d_reg;
assign	field	= y_reg;


endmodule

