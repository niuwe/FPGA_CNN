`timescale 1ns / 1ps

module l2_fm_inout#(
    parameter FM_WIDTH    = 'd4  ,
    parameter FM_HEIGHT   = 'd4  
)(
    input   clk     ,
    input   rst_n   ,
    
    input   [32:0]  fm_ram_wea  ,
    input           start_output,
    input           pre_vsync   ,
    input           pre_href    ,
    input   [15:0]  pre_data    ,
    
    output               end_output     ,
    output               post_vsync     ,
    output               post_href      ,
    output               save_fm1_acmp  ,
    output               save_fm2_acmp  ,
    output               save_fm3_acmp  ,
    output               save_fm4_acmp  ,
    output               save_fm5_acmp  ,
    output               save_fm6_acmp  ,
    output               save_fm7_acmp  ,
    output               save_fm8_acmp  ,
    output               save_fm9_acmp  ,
    output               save_fm10_acmp ,
    output               save_fm11_acmp ,
    output               save_fm12_acmp ,
    output               save_fm13_acmp ,
    output               save_fm14_acmp ,
    output               save_fm15_acmp ,
    output               save_fm16_acmp ,
    output               save_fm17_acmp ,
    output               save_fm18_acmp ,
    output               save_fm19_acmp ,
    output               save_fm20_acmp ,
    output               save_fm21_acmp ,
    output               save_fm22_acmp ,
    output               save_fm23_acmp ,
    output               save_fm24_acmp ,
    output               save_fm25_acmp ,
    output               save_fm26_acmp ,
    output               save_fm27_acmp ,
    output               save_fm28_acmp ,
    output               save_fm29_acmp ,
    output               save_fm30_acmp ,
    output               save_fm31_acmp ,
    output               save_fm32_acmp ,
    output   [15:0]      fm1_data     ,
    output   [15:0]      fm2_data     ,
    output   [15:0]      fm3_data     ,
    output   [15:0]      fm4_data     ,
    output   [15:0]      fm5_data     ,
    output   [15:0]      fm6_data     ,
    output   [15:0]      fm7_data     ,
    output   [15:0]      fm8_data     ,
    output   [15:0]      fm9_data     ,
    output   [15:0]      fm10_data    ,
    output   [15:0]      fm11_data    ,
    output   [15:0]      fm12_data    ,
    output   [15:0]      fm13_data    ,
    output   [15:0]      fm14_data    ,
    output   [15:0]      fm15_data    ,
    output   [15:0]      fm16_data    ,
    output   [15:0]      fm17_data    ,
    output   [15:0]      fm18_data    ,
    output   [15:0]      fm19_data    ,
    output   [15:0]      fm20_data    ,
    output   [15:0]      fm21_data    ,
    output   [15:0]      fm22_data    ,
    output   [15:0]      fm23_data    ,
    output   [15:0]      fm24_data    ,
    output   [15:0]      fm25_data    ,
    output   [15:0]      fm26_data    ,
    output   [15:0]      fm27_data    ,
    output   [15:0]      fm28_data    ,
    output   [15:0]      fm29_data    ,
    output   [15:0]      fm30_data    ,
    output   [15:0]      fm31_data    ,
    output   [15:0]      fm32_data    

);


layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u1_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),
    
    .fm_ram_wea   (fm_ram_wea[0] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),
    
    .save_fm_acmp  (save_fm1_acmp  ),
    .end_output    (end_output     ),
    .post_data     (fm1_data       ),
    .post_href     (post_href      ),
    .post_vsync    (post_vsync     )
);
layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u2_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[1] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm2_acmp  ),
    .post_data     (fm2_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u3_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[2] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm3_acmp  ),
    .post_data     (fm3_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u4_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[3] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm4_acmp  ),
    .post_data     (fm4_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u5_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[4] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm5_acmp  ),
    .post_data     (fm5_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u6_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[5] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm6_acmp  ),
    .post_data     (fm6_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u7_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[6] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm7_acmp  ),
    .post_data     (fm7_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u8_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[7] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm8_acmp  ),
    .post_data     (fm8_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u9_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[8] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm9_acmp  ),
    .post_data     (fm9_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u10_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[9] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm10_acmp  ),
    .post_data     (fm10_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u11_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[10] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm11_acmp  ),
    .post_data     (fm11_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u12_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[11] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm12_acmp  ),
    .post_data     (fm12_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u13_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[12] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm13_acmp  ),
    .post_data     (fm13_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u14_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[13] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm14_acmp  ),
    .post_data     (fm14_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u15_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[14] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm15_acmp  ),
    .post_data     (fm15_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u16_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[15] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm16_acmp  ),
    .post_data     (fm16_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u17_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[16] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm17_acmp  ),
    .post_data     (fm17_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u18_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[17] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm18_acmp  ),
    .post_data     (fm18_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u19_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[18] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm19_acmp  ),
    .post_data     (fm19_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u20_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[19] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm20_acmp  ),
    .post_data     (fm20_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u21_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[20] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm21_acmp  ),
    .post_data     (fm21_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u22_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[21] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm22_acmp  ),
    .post_data     (fm22_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u23_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[22] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm23_acmp  ),
    .post_data     (fm23_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u24_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[23] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm24_acmp  ),
    .post_data     (fm24_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u25_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[24] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm25_acmp  ),
    .post_data     (fm25_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u26_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[25] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm26_acmp  ),
    .post_data     (fm26_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u27_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[26] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm27_acmp  ),
    .post_data     (fm27_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u28_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[27] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm28_acmp  ),
    .post_data     (fm28_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u29_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[28] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm29_acmp  ),
    .post_data     (fm29_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u30_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[29] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm30_acmp  ),
    .post_data     (fm30_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u31_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[30] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm31_acmp  ),
    .post_data     (fm31_data       )
);

layer2_feature_map#(
    .FM_WIDTH    (FM_WIDTH  ),
    .FM_HEIGHT   (FM_HEIGHT  )
)u32_layer2_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),

    .fm_ram_wea   (fm_ram_wea[31] ),
    .start_output (start_output   ),
    .pre_vsync    (pre_vsync   ),
    .pre_href     (pre_href    ),
    .pre_data     (pre_data    ),

    .save_fm_acmp  (save_fm32_acmp  ),
    .post_data     (fm32_data       )
);

endmodule
