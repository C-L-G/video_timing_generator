/****************************************
______________                ______________
______________ \  /\  /|\  /| ______________
______________  \/  \/ | \/ | ______________
--Module Name:  video_generator_tb.sv
--Project Name: video_timming_generator
--Data modified: 2015-09-30 16:32:09 +0800
--author:Young-ÎâÃ÷
--E-mail: wmy367@Gmail.com
****************************************/
`timescale 1ns/1ps
module video_generator_tb;

//----->> CLOCK AND RESET <<------------
wire		clock;
wire		rst_n;

clock_rst clk_rst_inst(
	.clock		(clock),
	.rst		(rst_n)
);

defparam clk_rst_inst.ACTIVE = 0;
initial begin:INITIAL_CLOCK
	clk_rst_inst.run(10 , 1000/50 ,0);
end
//-----<< CLOCK AND RESET >>------------

logic 	vsync;
logic	hsync;
logic	de;
logic	field;

video_sync_generator 
inst(
	.pclk 			(clock		),
	.rst_n      	(rst_n      ),
	.enable     	(1'b1       ),
	.vsync  		(vsync      ),
	.hsync      	(hsync      ),
	.de         	(de         ),
	.field      	(field      )
);

int 	H_measure;
int		D_measure;
int 	V_measure;

always@(de)
	if(!de)
		H_measure	= 1;

always@(posedge clock)begin
	H_measure	+= 1;
end

always@(posedge de)
	D_measure	= 1;

always@(posedge clock)
	if(de)
		D_measure	+= 1;

always@(posedge inst.v_reg)
	if (~field)V_measure	= 1;

always@(posedge inst.h_reg)begin
	V_measure	+= 1;
	if(V_measure > inst.V_TOTAL)
		V_measure	= 1;
end

endmodule
