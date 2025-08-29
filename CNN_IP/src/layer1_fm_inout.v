`timescale 1ns / 1ps

module layer1_fm_inout#(
    parameter FM_WIDTH    = 'd4  ,
    parameter FM_HEIGHT   = 'd4  
)(
    input   clk     ,
    input   rst_n   ,
    
    input           fm_wea        ,
    input           start_output  ,
    input           pre_vsync     ,
    input           pre_href      ,
    input   [15:0]  pre_data1     ,
    input   [15:0]  pre_data2     ,
    input   [15:0]  pre_data3     ,
    input   [15:0]  pre_data4     ,
    input   [15:0]  pre_data5     ,
    input   [15:0]  pre_data6     ,
    input   [15:0]  pre_data7     ,
    input   [15:0]  pre_data8     ,
    input   [15:0]  pre_data9     ,
    input   [15:0]  pre_data10    ,
    input   [15:0]  pre_data11    ,
    input   [15:0]  pre_data12    ,
    input   [15:0]  pre_data13    ,
    input   [15:0]  pre_data14    ,
    input   [15:0]  pre_data15    ,
    input   [15:0]  pre_data16    ,

    output               save_fm_acmp ,
    output               end_output   ,
    output               post_vsync   ,
    output               post_href    ,
    output   [15:0]      post_data1     , 
    output   [15:0]      post_data2     , 
    output   [15:0]      post_data3     , 
    output   [15:0]      post_data4     , 
    output   [15:0]      post_data5     , 
    output   [15:0]      post_data6     , 
    output   [15:0]      post_data7     , 
    output   [15:0]      post_data8     , 
    output   [15:0]      post_data9     , 
    output   [15:0]      post_data10    , 
    output   [15:0]      post_data11    , 
    output   [15:0]      post_data12    , 
    output   [15:0]      post_data13    , 
    output   [15:0]      post_data14    , 
    output   [15:0]      post_data15    , 
    output   [15:0]      post_data16    
);


layer1_feature_map#(
    .FM_WIDTH    (FM_WIDTH   ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u1_l1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n      ),
    
    .fm_wea       (fm_wea            ),
    .start_output (start_output      ), //test l1_pool_done
    .pre_vsync    (pre_vsync         ),
    .pre_href     (pre_href          ),
    .pre_data     (pre_data1     ),
    
    .save_fm_acmp  (save_fm_acmp     ), 
    .end_output    (end_output       ),
    .post_data     (post_data1      ),
    .post_href     (post_href       ),
    .post_vsync    (post_vsync      )
);

layer1_feature_map#(
    .FM_WIDTH    (FM_WIDTH   ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u2_l1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n      ),
    
    .fm_wea       (fm_wea            ),
    .start_output (start_output      ),
    .pre_vsync    (pre_vsync         ),
    .pre_href     (pre_href          ),
    .pre_data     (pre_data2     ),

    .post_data    (post_data2       )
);

layer1_feature_map#(
    .FM_WIDTH    (FM_WIDTH   ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u3_l1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n      ),
    
    .fm_wea       (fm_wea            ),
    .start_output (start_output      ),
    .pre_vsync    (pre_vsync         ),
    .pre_href     (pre_href          ),
    .pre_data     (pre_data3     ),

    .post_data    (post_data3       )
);

layer1_feature_map#(
    .FM_WIDTH    (FM_WIDTH   ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u4_l1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n      ),
    
    .fm_wea       (fm_wea            ),
    .start_output (start_output      ),
    .pre_vsync    (pre_vsync         ),
    .pre_href     (pre_href          ),
    .pre_data     (pre_data4     ),

    .post_data    (post_data4       )
);

layer1_feature_map#(
    .FM_WIDTH    (FM_WIDTH   ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u5_l1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n      ),
    
    .fm_wea       (fm_wea            ),
    .start_output (start_output      ),
    .pre_vsync    (pre_vsync         ),
    .pre_href     (pre_href          ),
    .pre_data     (pre_data5     ),

    .post_data    (post_data5       )
);

layer1_feature_map#(
    .FM_WIDTH    (FM_WIDTH   ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u6_l1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n      ),
    
    .fm_wea       (fm_wea            ),
    .start_output (start_output      ),
    .pre_vsync    (pre_vsync         ),
    .pre_href     (pre_href          ),
    .pre_data     (pre_data6     ),
    .post_data    (post_data6       )
);

layer1_feature_map#(
    .FM_WIDTH    (FM_WIDTH   ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u7_l1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n      ),
    
    .fm_wea       (fm_wea            ),
    .start_output (start_output      ),
    .pre_vsync    (pre_vsync         ),
    .pre_href     (pre_href          ),
    .pre_data     (pre_data7     ),

    .post_data    (post_data7       )
);

layer1_feature_map#(
    .FM_WIDTH    (FM_WIDTH   ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u8_l1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n      ),
    
    .fm_wea       (fm_wea            ),
    .start_output (start_output      ),
    .pre_vsync    (pre_vsync         ),
    .pre_href     (pre_href          ),
    .pre_data     (pre_data8     ),

    .post_data    (post_data8       )
);

layer1_feature_map#(
    .FM_WIDTH    (FM_WIDTH   ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u9_l1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n      ),
    
    .fm_wea       (fm_wea            ),
    .start_output (start_output      ),
    .pre_vsync    (pre_vsync         ),
    .pre_href     (pre_href          ),
    .pre_data     (pre_data9     ),

    .post_data    (post_data9       )
);

layer1_feature_map#(
    .FM_WIDTH    (FM_WIDTH   ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u10_l1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n      ),
    
    .fm_wea       (fm_wea            ),
    .start_output (start_output      ),
    .pre_vsync    (pre_vsync         ),
    .pre_href     (pre_href          ),
    .pre_data     (pre_data10     ),

    .post_data    (post_data10       )
);

layer1_feature_map#(
    .FM_WIDTH    (FM_WIDTH   ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u11_l1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n      ),
    
    .fm_wea       (fm_wea            ),
    .start_output (start_output      ),
    .pre_vsync    (pre_vsync         ),
    .pre_href     (pre_href          ),
    .pre_data     (pre_data11     ),

    .post_data    (post_data11       )
);

layer1_feature_map#(
    .FM_WIDTH    (FM_WIDTH   ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u12_l1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n      ),
    
    .fm_wea       (fm_wea            ),
    .start_output (start_output      ),
    .pre_vsync    (pre_vsync         ),
    .pre_href     (pre_href          ),
    .pre_data     (pre_data12     ),

    .post_data    (post_data12       )
);

layer1_feature_map#(
    .FM_WIDTH    (FM_WIDTH   ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u13_l1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n      ),
    
    .fm_wea       (fm_wea            ),
    .start_output (start_output      ),
    .pre_vsync    (pre_vsync         ),
    .pre_href     (pre_href          ),
    .pre_data     (pre_data13     ),

    .post_data    (post_data13       )
);

layer1_feature_map#(
    .FM_WIDTH    (FM_WIDTH   ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u14_l1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n      ),
    
    .fm_wea       (fm_wea            ),
    .start_output (start_output      ),
    .pre_vsync    (pre_vsync         ),
    .pre_href     (pre_href          ),
    .pre_data     (pre_data14     ),

    .post_data    (post_data14       )
);

layer1_feature_map#(
    .FM_WIDTH    (FM_WIDTH   ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u15_l1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n      ),
    
    .fm_wea       (fm_wea            ),
    .start_output (start_output      ),
    .pre_vsync    (pre_vsync         ),
    .pre_href     (pre_href          ),
    .pre_data     (pre_data15     ),

    .post_data    (post_data15       )
);

layer1_feature_map#(
    .FM_WIDTH    (FM_WIDTH   ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u16_l1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n      ),
    
    .fm_wea       (fm_wea            ),
    .start_output (start_output      ),
    .pre_vsync    (pre_vsync         ),
    .pre_href     (pre_href          ),
    .pre_data     (pre_data16     ),

    .post_data    (post_data16       )
);

endmodule
