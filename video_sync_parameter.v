/****************************************
______________                ______________
______________ \  /\  /|\  /| ______________
______________  \/  \/ | \/ | ______________
--Module Name:  video_sync_parameter.v
--Project Name: video_timming_generator
--Data modified: 2016-08-10 09:20:28 +0800
--author:Young-ÎâÃ÷
--E-mail: wmy367@Gmail.com
****************************************/
`ifdef I1080
localparam	H_ACTIVE		= 1920 		,
			H_TOTAL			= 2200      ,
			H_SYNC			= 44        ,
			H_FP			= 88        ,
			H_BLANK			= 280       ,

			V_TOTAL			= 1125		,
			V_ACTIVE		= 540       ,
			V_SYNC			= 5         ,
			V_ODD_FP		= 2         ,
			V_EVEN_FP		= 564       ,
			V_ODD_OFFSET 	= 0         ,
			V_EVEN_OFFSET	= 1100      ,
			V_ODD_BLANK		= 22        ,
			V_EVEN_BLANK	= 23        ,
			INTERLACE		= "TRUE"    ,
			NEGATED			= "FALSE"	;
`elsif P1080_60
localparam	H_ACTIVE		= 1920 		,
			H_TOTAL			= 2200      ,
			H_SYNC			= 44        ,
			H_FP			= 88        ,
			H_BLANK			= 280       ,

			V_TOTAL			= 1125		,
			V_ACTIVE		= 1080      ,
			V_SYNC			= 5         ,
			V_ODD_FP		= 4         ,
			V_EVEN_FP		= 0       	,
			V_ODD_OFFSET 	= 0         ,
			V_EVEN_OFFSET	= 0      	,
			V_ODD_BLANK		= 45        ,
			V_EVEN_BLANK	= 0        	, 
			NEGATED			= "FALSE"	, 
			INTERLACE		= "FALSE"   ;
`elsif P720_60
localparam	H_ACTIVE		= 1280 		,		
			H_TOTAL			= 1650      ,
			H_SYNC			= 40        ,
			H_FP			= 110       , 
			H_BLANK			= 370       ,
                                        
			V_TOTAL			= 750		,
			V_ACTIVE		= 720       ,
			V_SYNC			= 5         ,
			V_ODD_FP		= 5         ,
			V_EVEN_FP		= 0         ,
			V_ODD_OFFSET 	= 0         ,
			V_EVEN_OFFSET	= 0         ,
			V_ODD_BLANK		= 30        ,
			V_EVEN_BLANK	= 0         ,
			NEGATED			= "FALSE"	, 
			INTERLACE		= "FALSE"    ;
`elsif I1080_60
localparam	H_ACTIVE		= 1920 		,
			H_TOTAL			= 2200      ,
			H_SYNC			= 44        ,
			H_FP			= 88        ,
			H_BLANK			= 280       ,
                                         
			V_TOTAL			= 1125		,
			V_ACTIVE		= 540       ,
			V_SYNC			= 5         ,
			V_ODD_FP		= 2         ,
			V_EVEN_FP		= 564       ,
			V_ODD_OFFSET 	= 0         ,
			V_EVEN_OFFSET	= 1100      ,
			V_ODD_BLANK		= 22        ,
			V_EVEN_BLANK	= 23        ,
			NEGATED			= "FALSE"	,
			INTERLACE		= "TRUE"    ;
`elsif I480_60
localparam	H_ACTIVE		= 1716 		,
			H_TOTAL			= 1440      ,
			H_SYNC			= 124       ,
			H_FP			= 38        ,
			H_BLANK			= 276       ,
                                         
			V_TOTAL			= 525		,
			V_ACTIVE		= 240       ,
			V_SYNC			= 3         ,
			V_ODD_FP		= 4         ,
			V_EVEN_FP		= 266       ,
			V_ODD_OFFSET 	= 0         ,
			V_EVEN_OFFSET	= 858      ,
			V_ODD_BLANK		= 22        ,
			V_EVEN_BLANK	= 23        ,  
			NEGATED			= "TRUE"	,
			INTERLACE		= "TRUE"    ;
`elsif P720_50
localparam	H_ACTIVE		= 1280 		,
			H_TOTAL			= 1980      ,
			H_SYNC			= 40        ,
			H_FP			= 440       ,
			H_BLANK			= 700       ,
                                         
			V_TOTAL			= 750		,
			V_ACTIVE		= 720       ,
			V_SYNC			= 5         ,
			V_ODD_FP		= 5         ,
			V_EVEN_FP		= 0       	,
			V_ODD_OFFSET 	= 0         ,
			V_EVEN_OFFSET	= 0      	,
			V_ODD_BLANK		= 30        ,
			V_EVEN_BLANK	= 0        , 
			NEGATED			= "FALSE"	,
			INTERLACE		= "FALSE"    ;
`elsif I1080_50
localparam	H_ACTIVE		= 1920 		,
			H_TOTAL			= 2640      ,
			H_SYNC			= 40        ,
			H_FP			= 528       ,
			H_BLANK			= 720       ,
                                         
			V_TOTAL			= 1125		,
			V_ACTIVE		= 540       ,
			V_SYNC			= 5         ,
			V_ODD_FP		= 2         ,
			V_EVEN_FP		= 564     	,
			V_ODD_OFFSET 	= 0         ,
			V_EVEN_OFFSET	= 1320     	,
			V_ODD_BLANK		= 22        ,
			V_EVEN_BLANK	= 23        , 
			NEGATED			= "FALSE"	,
			INTERLACE		= "TRUE"    ;
`elsif P576_50
localparam	H_ACTIVE		= 1440 		,
			H_TOTAL			= 1728      ,
			H_SYNC			= 126        ,
			H_FP			= 24        ,
			H_BLANK			= 288       ,
                                         
			V_TOTAL			= 625		,
			V_ACTIVE		= 288       ,
			V_SYNC			= 3         ,
			V_ODD_FP		= 2         ,
			V_EVEN_FP		= 0       	,
			V_ODD_OFFSET 	= 0         ,
			V_EVEN_OFFSET	= 0      	,
			V_ODD_BLANK		= 24        ,
			V_EVEN_BLANK	= 0        , 
			NEGATED			= "TRUE"	,
			INTERLACE		= "FALSE"    ;
`elsif P1080_50
localparam	H_ACTIVE		= 1980 		,
			H_TOTAL			= 2640      ,
			H_SYNC			= 44        ,
			H_FP			= 528       ,
			H_BLANK			= 720       ,
                                         
			V_TOTAL			= 1125		,
			V_ACTIVE		= 1080       ,
			V_SYNC			= 5         ,
			V_ODD_FP		= 4         ,
			V_EVEN_FP		= 0       	,
			V_ODD_OFFSET 	= 0         ,
			V_EVEN_OFFSET	= 0      	,
			V_ODD_BLANK		= 45        ,
			V_EVEN_BLANK	= 0        , 
			NEGATED			= "FALSE"	,
			INTERLACE		= "FALSE"    ;
`elsif P1080_24
localparam	H_ACTIVE		= 1920 		,
			H_TOTAL			= 2750      ,
			H_SYNC			= 44        ,
			H_FP			= 638       ,
			H_BLANK			= 830       ,
                                         
			V_TOTAL			= 1125		,
			V_ACTIVE		= 1080      ,
			V_SYNC			= 5         ,
			V_ODD_FP		= 4         ,
			V_EVEN_FP		= 0       	,
			V_ODD_OFFSET 	= 0         ,
			V_EVEN_OFFSET	= 0      	,
			V_ODD_BLANK		= 45        ,
			V_EVEN_BLANK	= 0        , 
			NEGATED			= "FALSE"	,
			INTERLACE		= "FALSE"    ;
`elsif P1080_25
localparam	H_ACTIVE		= 1920 		,
			H_TOTAL			= 2640      ,
			H_SYNC			= 44        ,
			H_FP			= 528       ,
			H_BLANK			= 720       ,
                                         
			V_TOTAL			= 1125		,
			V_ACTIVE		= 1080       ,
			V_SYNC			= 5         ,
			V_ODD_FP		= 4         ,
			V_EVEN_FP		= 0       	,
			V_ODD_OFFSET 	= 0         ,
			V_EVEN_OFFSET	= 0      	,
			V_ODD_BLANK		= 45        ,
			V_EVEN_BLANK	= 0        , 
			NEGATED			= "FALSE"	,
			INTERLACE		= "FALSE"    ;
`elsif P1080_30
localparam	H_ACTIVE		= 1920 		,
			H_TOTAL			= 2200      ,
			H_SYNC			= 44        ,
			H_FP			= 88       ,
			H_BLANK			= 280       ,
                                         
			V_TOTAL			= 1125		,
			V_ACTIVE		= 1080       ,
			V_SYNC			= 5         ,
			V_ODD_FP		= 4         ,
			V_EVEN_FP		= 0       	,
			V_ODD_OFFSET 	= 0         ,
			V_EVEN_OFFSET	= 0      	,
			V_ODD_BLANK		= 45        ,
			V_EVEN_BLANK	= 0        , 
			NEGATED			= "FALSE"	,
			INTERLACE		= "FALSE"    ;
`endif


