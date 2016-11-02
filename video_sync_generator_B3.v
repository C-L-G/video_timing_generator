/****************************************
______________                ______________
______________ \  /\  /|\  /| ______________
______________  \/  \/ | \/ | ______________
--Module Name:  video_sync_generator_B2.v
--Project Name: video_timming_generator
--Data modified: 2016/10/28 上午11:21:18
--author:Young
--E-mail: wmy367@Gmail.com
****************************************/
`timescale 1ns/1ps
module video_sync_generator_B3 #(
	parameter	MODE	= "1080P@60"
)(
	input				pclk 		,
	input				rst_n       ,
	input				enable      ,
	input				pause		,
	//--->> Extend Sync
	output				vsync  		,
	output				hsync       ,
	output				de          ,
	output				field       ,
    output              ng_vs       ,
    output              ng_hs       ,
    output[15:0]        vactive     ,
    output[15:0]        hactive
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

wire[31:0]
	H_ACTIVE			,
	H_TOTAL			    ,
	H_SYNC			    ,
	H_FP			    ,
	H_BLANK			    ,
	V_TOTAL			    ,
	V_ACTIVE		    ,
	V_SYNC			    ,
	V_ODD_FP		    ,
	V_EVEN_FP		    ,
	V_ODD_OFFSET_RE     ,
	V_ODD_OFFSET_FE     ,
	V_EVEN_OFFSET_RE    ,
	V_EVEN_OFFSET_FE    ,
	V_ODD_BLANK		    ,
	V_EVEN_BLANK	    ,
	INTERLACE		    ,
	NEGATED			    ;


generate
if(MODE == "1080I")begin
assign			H_ACTIVE		= 1920 		;
assign			H_TOTAL			= 2200      ;
assign			H_SYNC			= 44        ;
assign			H_FP			= 88        ;
assign			H_BLANK			= 280       ;
assign			V_TOTAL			= 1125		;
assign			V_ACTIVE		= 540       ;
assign			V_SYNC			= 5         ;
assign			V_ODD_FP		= 2         ;
assign			V_EVEN_FP		= 564       ;
assign			V_ODD_OFFSET_RE = 0         ;
assign			V_ODD_OFFSET_FE = 0			;
assign			V_EVEN_OFFSET_RE= 1000      ;
assign			V_EVEN_OFFSET_FE= 1000		;
assign			V_ODD_BLANK		= 22        ;
assign			V_EVEN_BLANK	= 23        ;
assign			INTERLACE		= 1    		;
assign			NEGATED			= 0			;
end else if(MODE == "1080P@60")begin
assign			H_ACTIVE		= 1920 		;
assign			H_TOTAL			= 2200      ;
assign			H_SYNC			= 44        ;
assign			H_FP			= 88        ;
assign			H_BLANK			= 280       ;
assign			V_TOTAL			= 1125		;
assign			V_ACTIVE		= 1080      ;
assign			V_SYNC			= 5         ;
assign			V_ODD_FP		= 4         ;
assign			V_EVEN_FP		= 0       	;
assign			V_ODD_OFFSET_RE = 44        ;
assign			V_ODD_OFFSET_FE = 0			;
assign			V_EVEN_OFFSET_RE= 44      	;
assign			V_EVEN_OFFSET_FE= 0			;
assign			V_ODD_BLANK		= 45        ;
assign			V_EVEN_BLANK	= 0        	;
assign			NEGATED			= 0			;
assign			INTERLACE		= 0	   		;
end else if(MODE == "720P@60")begin
assign			H_ACTIVE		= 1280 		;
assign			H_TOTAL			= 1650      ;
assign			H_SYNC			= 40        ;
assign			H_FP			= 110       ;
assign			H_BLANK			= 370       ;
assign			V_TOTAL			= 750		;
assign			V_ACTIVE		= 720       ;
assign			V_SYNC			= 5         ;
assign			V_ODD_FP		= 5         ;
assign			V_EVEN_FP		= 0         ;
assign			V_ODD_OFFSET_RE = 40        ;
assign			V_ODD_OFFSET_FE = 0			;
assign			V_EVEN_OFFSET_RE= 40      	;
assign			V_EVEN_OFFSET_FE= 0			;
assign			V_ODD_BLANK		= 30        ;
assign			V_EVEN_BLANK	= 0         ;
assign			NEGATED			= 0	;
assign			INTERLACE		= 0   ;
end else if(MODE == "1080I@60")begin
assign			H_ACTIVE		= 1920 		;
assign			H_TOTAL			= 2200      ;
assign			H_SYNC			= 44        ;
assign			H_FP			= 88        ;
assign			H_BLANK			= 280       ;
assign			V_TOTAL			= 1125		;
assign			V_ACTIVE		= 540       ;
assign			V_SYNC			= 5         ;
assign			V_ODD_FP		= 2         ;
assign			V_EVEN_FP		= 564       ;
assign			V_ODD_OFFSET_RE = 0         ;
assign			V_ODD_OFFSET_FE = 0			;
assign			V_EVEN_OFFSET_RE= 1000      ;
assign			V_EVEN_OFFSET_FE= 1000		;
assign			V_ODD_BLANK		= 22        ;
assign			V_EVEN_BLANK	= 23        ;
assign			NEGATED			= 0;
assign			INTERLACE		= 1;
end else if(MODE == "480I@60")begin
assign			H_ACTIVE		= 1716 		;
assign			H_TOTAL			= 1440      ;
assign			H_SYNC			= 124       ;
assign			H_FP			= 38        ;
assign			H_BLANK			= 276       ;
assign			V_TOTAL			= 525		;
assign			V_ACTIVE		= 240       ;
assign			V_SYNC			= 3         ;
assign			V_ODD_FP		= 4         ;
assign			V_EVEN_FP		= 266       ;
assign			V_ODD_OFFSET_RE = 0         ;
assign			V_ODD_OFFSET_FE = 0			;
assign			V_EVEN_OFFSET_RE= 858      	;
assign			V_EVEN_OFFSET_FE= 858		;
assign			V_ODD_BLANK		= 22        ;
assign			V_EVEN_BLANK	= 23        ;
assign			NEGATED			= 1;
assign			INTERLACE		= 1;
end else if(MODE == "720P@50")begin
assign			H_ACTIVE		= 1280 		;
assign			H_TOTAL			= 1980     	;
assign			H_SYNC			= 40       	;
assign			H_FP			= 440      	;
assign			H_BLANK			= 700      	;
assign			V_TOTAL			= 750		;
assign			V_ACTIVE		= 720      	;
assign			V_SYNC			= 5        	;
assign			V_ODD_FP		= 5        	;
assign			V_EVEN_FP		= 0       	;
assign			V_ODD_OFFSET_RE = 40       	;
assign			V_ODD_OFFSET_FE = 0			;
assign			V_EVEN_OFFSET_RE= 40      	;
assign			V_EVEN_OFFSET_FE= 0			;
assign			V_ODD_BLANK		= 30       	;
assign			V_EVEN_BLANK	= 0        	;
assign			NEGATED			= 0;
assign			INTERLACE		= 0;
end else if(MODE == "1080I@50")begin
assign			H_ACTIVE		= 1920 		;
assign			H_TOTAL			= 2640      ;
assign			H_SYNC			= 40        ;
assign			H_FP			= 528       ;
assign			H_BLANK			= 720       ;
assign			V_TOTAL			= 1125		;
assign			V_ACTIVE		= 540       ;
assign			V_SYNC			= 5         ;
assign			V_ODD_FP		= 2         ;
assign			V_EVEN_FP		= 564     	;
assign			V_ODD_OFFSET_RE = 0         ;
assign			V_ODD_OFFSET_FE = 0			;
assign			V_EVEN_OFFSET_RE= 1320     	;
assign			V_EVEN_OFFSET_FE= 1320		;
assign			V_ODD_BLANK		= 22        ;
assign			V_EVEN_BLANK	= 23        ;
assign			NEGATED			= 0	;
assign			INTERLACE		= 1 ;
end else if(MODE == "P576@50")begin
assign			H_ACTIVE		= 1440 		;
assign			H_TOTAL			= 1728     	;
assign			H_SYNC			= 126      	;
assign			H_FP			= 24       	;
assign			H_BLANK			= 288      	;
assign			V_TOTAL			= 625		;
assign			V_ACTIVE		= 288      	;
assign			V_SYNC			= 3        	;
assign			V_ODD_FP		= 2        	;
assign			V_EVEN_FP		= 0       	;
assign			V_ODD_OFFSET_RE = 126      	;
assign			V_ODD_OFFSET_FE = 0			;
assign			V_EVEN_OFFSET_RE= 126      	;
assign			V_EVEN_OFFSET_FE= 0			;
assign			V_ODD_BLANK		= 24       	;
assign			V_EVEN_BLANK	= 0        	;
assign			NEGATED			= 1;
assign			INTERLACE		= 0;
end else if(MODE == "1080P@50")begin
assign			H_ACTIVE		= 1980 		;
assign			H_TOTAL			= 2640     	;
assign			H_SYNC			= 44       	;
assign			H_FP			= 528      	;
assign			H_BLANK			= 720      	;
assign			V_TOTAL			= 1125		;
assign			V_ACTIVE		= 1080     	;
assign			V_SYNC			= 5        	;
assign			V_ODD_FP		= 4        	;
assign			V_EVEN_FP		= 0       	;
assign			V_ODD_OFFSET_RE = 44       	;
assign			V_ODD_OFFSET_FE = 0			;
assign			V_EVEN_OFFSET_RE= 44      	;
assign			V_EVEN_OFFSET_FE= 0			;
assign			V_ODD_BLANK		= 45       	;
assign			V_EVEN_BLANK	= 0        	;
assign			NEGATED			= 0;
assign			INTERLACE		= 0;
end else if(MODE == "1080P24")begin
assign			H_ACTIVE		= 1920 		;
assign			H_TOTAL			= 2750     	;
assign			H_SYNC			= 44       	;
assign			H_FP			= 638      	;
assign			H_BLANK			= 830      	;
assign			V_TOTAL			= 1125		;
assign			V_ACTIVE		= 1080     	;
assign			V_SYNC			= 5        	;
assign			V_ODD_FP		= 4        	;
assign			V_EVEN_FP		= 0       	;
assign			V_ODD_OFFSET_RE = 44       	;
assign			V_ODD_OFFSET_FE = 0			;
assign			V_EVEN_OFFSET_RE= 44      	;
assign			V_EVEN_OFFSET_FE= 0			;
assign			V_ODD_BLANK		= 45       	;
assign			V_EVEN_BLANK	= 0        	;
assign			NEGATED			= 0;
assign			INTERLACE		= 0;
end else if(MODE == "1080P@25")begin
assign			H_ACTIVE		= 1920 		;
assign			H_TOTAL			= 2640     	;
assign			H_SYNC			= 44       	;
assign			H_FP			= 528      	;
assign			H_BLANK			= 720      	;
assign			V_TOTAL			= 1125		;
assign			V_ACTIVE		= 1080     	;
assign			V_SYNC			= 5        	;
assign			V_ODD_FP		= 4        	;
assign			V_EVEN_FP		= 0       	;
assign			V_ODD_OFFSET_RE = 44       	;
assign			V_ODD_OFFSET_FE = 0			;
assign			V_EVEN_OFFSET_RE= 44      	;
assign			V_EVEN_OFFSET_FE= 0			;
assign			V_ODD_BLANK		= 45       	;
assign			V_EVEN_BLANK	= 0        	;
assign			NEGATED			= 0;
assign			INTERLACE		= 0;
end else if(MODE == "1080P@30")begin
assign			H_ACTIVE		= 1920 		;
assign			H_TOTAL			= 2200     	;
assign			H_SYNC			= 44       	;
assign			H_FP			= 88       	;
assign			H_BLANK			= 280      	;
assign			V_TOTAL			= 1125		;
assign			V_ACTIVE		= 1080     	;
assign			V_SYNC			= 5        	;
assign			V_ODD_FP		= 4        	;
assign			V_EVEN_FP		= 0       	;
assign			V_ODD_OFFSET_RE = 44       	;
assign			V_ODD_OFFSET_FE = 0			;
assign			V_EVEN_OFFSET_RE= 44      	;
assign			V_EVEN_OFFSET_FE= 0			;
assign			V_ODD_BLANK		= 45       	;
assign			V_EVEN_BLANK	= 0        	;
assign			NEGATED			= 0;
assign			INTERLACE		= 0;
end else if(MODE == "768P@60")begin
assign			H_ACTIVE		= 1024 		;
assign			H_TOTAL			= 1344     	;
assign			H_SYNC			= 136      	;
assign			H_FP			= 24       	;
assign			H_BLANK			= 320      	;
assign			V_TOTAL			= 806		;
assign			V_ACTIVE		= 768      	;
assign			V_SYNC			= 6        	;
assign			V_ODD_FP		= 3        	;
assign			V_EVEN_FP		= 3       	;
assign			V_ODD_OFFSET_RE = 40      	;
assign			V_ODD_OFFSET_FE = 0			;
assign			V_EVEN_OFFSET_RE= 40      	;
assign			V_EVEN_OFFSET_FE= 0			;
assign			V_ODD_BLANK		= 38       	;
assign			V_EVEN_BLANK	= 0        	;
assign			NEGATED			= 1;
assign			INTERLACE		= 0;
end else if(MODE == "TEST")begin
assign			H_ACTIVE		= 1920 		;
assign			H_TOTAL			= 2200     	;
assign			H_SYNC			= 44       	;
assign			H_FP			= 88       	;
assign			H_BLANK			= 280      	;
assign			V_TOTAL			= 25		;
assign			V_ACTIVE		= 20     	;
assign			V_SYNC			= 1        	;
assign			V_ODD_FP		= 1        	;
assign			V_EVEN_FP		= 1       	;
assign			V_ODD_OFFSET_RE = 1       	;
assign			V_ODD_OFFSET_FE = 0			;
assign			V_EVEN_OFFSET_RE= 1      	;
assign			V_EVEN_OFFSET_FE= 0			;
assign			V_ODD_BLANK		= 5       	;
assign			V_EVEN_BLANK	= 0        	;
assign			NEGATED			= 0;
end
endgenerate


//----->> H SYNC <<------------------------
reg [12:0]		Hcnt;
reg				h_reg;

always@(posedge pclk,negedge rst_n)begin
	if(~rst_n)	Hcnt	<= 13'd0;
	else begin
		if(enable)begin
			if(Hcnt >= H_TOTAL-1'b1)
					Hcnt	<= 13'd0;
			else	Hcnt	<= Hcnt + !pause;
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
	else		v_inc_pulse	<= Hcnt == (H_TOTAL-2'd1) && !pause;
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
		v_odd_up_fp		<= (Vcnt == V_ODD_FP)          && (Hcnt == (V_ODD_OFFSET_RE+H_FP));
		v_odd_down_sync	<= (Vcnt == (V_ODD_FP+V_SYNC)) && (Hcnt == (H_FP+V_ODD_OFFSET_FE));
		v_even_up_fp	<= (Vcnt == V_EVEN_FP)         && (Hcnt == (V_EVEN_OFFSET_RE+H_FP));
		v_even_down_sync<= (Vcnt == (V_EVEN_FP+V_SYNC))&& (Hcnt == (H_FP+V_EVEN_OFFSET_FE));
end end

reg 			v_reg;

always@(posedge pclk,negedge rst_n)begin
	if(~rst_n)	v_reg	<= 1'b0;
	else begin
		if(INTERLACE == 1)
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
		d_odd_up_blank		<= (Vcnt >= V_ODD_BLANK) && (Vcnt < (V_ODD_BLANK+V_ACTIVE)) && (Hcnt == H_BLANK) && !pause;
		d_odd_down_blank	<= 	!pause &&
								(Vcnt >= V_ODD_BLANK) &&
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
		d_even_up_blank		<= 	!pause &&
								(Vcnt >= V_ODD_BLANK+V_ACTIVE+V_EVEN_BLANK) &&
								(Vcnt < (V_ODD_BLANK+V_ACTIVE+V_EVEN_BLANK+V_ACTIVE)) && (Hcnt == H_BLANK);
		d_even_down_blank	<= 	!pause &&
								(Vcnt >= V_ODD_BLANK+V_ACTIVE+V_EVEN_BLANK) &&
								(Vcnt < (V_ODD_BLANK+V_ACTIVE+V_EVEN_BLANK+V_ACTIVE)) &&
								(Hcnt == (H_BLANK+H_ACTIVE)) ||
								(Hcnt == 0);
end end

reg 	d_reg;

always@(posedge pclk,negedge rst_n)
	if(~rst_n)	d_reg	<= 1'b0;
	else begin
		if(INTERLACE == 1)
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
		if(INTERLACE == 1)begin
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



assign	vsync	= (NEGATED == 0)? v_reg : ~v_reg;
assign	hsync	= (NEGATED == 0)? h_reg : ~h_reg;
assign	de		= d_reg && !pause;
assign	field	= y_reg;

assign ng_hs    = h_reg;    // :2016/5/17 下午3:20:18
assign ng_vs    = v_reg;

assign vactive  = V_ACTIVE;
assign hactive  = H_ACTIVE;

endmodule
