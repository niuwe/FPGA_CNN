`timescale 1ns / 1ps

module common_layer_conv#(
    parameter   CONV_WIDTH      = 'd8 ,
    parameter   CONV_HEIGHT     = 'd8 
)(
    input clk   ,
    input rst_n ,
    
    input                matrix_vsync ,
    input                matrix_href  ,
    input        [6:0]   matrix_h_cnt       ,
    input        [6:0]   matrix_v_cnt       ,
    input signed [15:0]   conv_bias1    ,
    input signed [15:0]   conv_bias2    ,
    input signed [15:0]   conv_bias3    ,
    input signed [15:0]   conv_bias4    ,
    input signed [15:0]   conv_bias5    ,
    input signed [15:0]   conv_bias6    ,
    input signed [15:0]   conv_bias7    ,
    input signed [15:0]   conv_bias8    ,
    input signed [15:0]   conv_bias9    ,
    input signed [15:0]   conv_bias10   ,
    input signed [15:0]   conv_bias11   ,
    input signed [15:0]   conv_bias12   ,
    input signed [15:0]   conv_bias13   ,
    input signed [15:0]   conv_bias14   ,
    input signed [15:0]   conv_bias15   ,
    input signed [15:0]   conv_bias16   ,
    input signed [15:0]   conv_bias17   ,
    input signed [15:0]   conv_bias18   ,
    input signed [15:0]   conv_bias19   ,
    input signed [15:0]   conv_bias20   ,
    input signed [15:0]   conv_bias21   ,
    input signed [15:0]   conv_bias22   ,
    input signed [15:0]   conv_bias23   ,
    input signed [15:0]   conv_bias24   ,
    input signed [15:0]   conv_bias25   ,
    input signed [15:0]   conv_bias26   ,
    input signed [15:0]   conv_bias27   ,
    input signed [15:0]   conv_bias28   ,
    input signed [15:0]   conv_bias29   ,
    input signed [15:0]   conv_bias30   ,
    input signed [15:0]   conv_bias31   ,
    input signed [15:0]   conv_bias32   ,
    input        [143:0]  fm_data1      ,
    input        [143:0]  fm_data2      ,
    input        [143:0]  fm_data3      ,
    input        [143:0]  fm_data4      ,
    input        [143:0]  fm_data5      ,
    input        [143:0]  fm_data6      ,
    input        [143:0]  fm_data7      ,
    input        [143:0]  fm_data8      ,
    input        [143:0]  fm_data9      ,
    input        [143:0]  fm_data10     ,
    input        [143:0]  fm_data11     ,
    input        [143:0]  fm_data12     ,
    input        [143:0]  fm_data13     ,
    input        [143:0]  fm_data14     ,
    input        [143:0]  fm_data15     ,
    input        [143:0]  fm_data16     ,
    input        [143:0]  fm_data17     ,
    input        [143:0]  fm_data18     ,
    input        [143:0]  fm_data19     ,
    input        [143:0]  fm_data20     ,
    input        [143:0]  fm_data21     ,
    input        [143:0]  fm_data22     ,
    input        [143:0]  fm_data23     ,
    input        [143:0]  fm_data24     ,
    input        [143:0]  fm_data25     ,
    input        [143:0]  fm_data26     ,
    input        [143:0]  fm_data27     ,
    input        [143:0]  fm_data28     ,
    input        [143:0]  fm_data29     ,
    input        [143:0]  fm_data30     ,
    input        [143:0]  fm_data31     ,
    input        [143:0]  fm_data32     ,
    input        [143:0]  conv_weight1  ,
    input        [143:0]  conv_weight2  ,
    input        [143:0]  conv_weight3  ,
    input        [143:0]  conv_weight4  ,
    input        [143:0]  conv_weight5  ,
    input        [143:0]  conv_weight6  ,
    input        [143:0]  conv_weight7  ,
    input        [143:0]  conv_weight8  ,
    input        [143:0]  conv_weight9  ,
    input        [143:0]  conv_weight10 ,
    input        [143:0]  conv_weight11 ,
    input        [143:0]  conv_weight12 ,
    input        [143:0]  conv_weight13 ,
    input        [143:0]  conv_weight14 ,
    input        [143:0]  conv_weight15 ,
    input        [143:0]  conv_weight16 ,
    input        [143:0]  conv_weight17 ,
    input        [143:0]  conv_weight18 ,
    input        [143:0]  conv_weight19 ,
    input        [143:0]  conv_weight20 ,
    input        [143:0]  conv_weight21 ,
    input        [143:0]  conv_weight22 ,
    input        [143:0]  conv_weight23 ,
    input        [143:0]  conv_weight24 ,
    input        [143:0]  conv_weight25 ,
    input        [143:0]  conv_weight26 ,
    input        [143:0]  conv_weight27 ,
    input        [143:0]  conv_weight28 ,
    input        [143:0]  conv_weight29 ,
    input        [143:0]  conv_weight30 ,
    input        [143:0]  conv_weight31 ,
    input        [143:0]  conv_weight32 ,

    output         [6:0]  conv_h_cnt ,
    output         [6:0]  conv_v_cnt ,
    output                conv_href  ,
    output                conv_vsync ,
    output  signed [31:0] conv_result1 ,
    output  signed [31:0] conv_result2 ,
    output  signed [31:0] conv_result3 ,
    output  signed [31:0] conv_result4 ,
    output  signed [31:0] conv_result5 ,
    output  signed [31:0] conv_result6 ,
    output  signed [31:0] conv_result7 ,
    output  signed [31:0] conv_result8 ,
    output  signed [31:0] conv_result9 ,
    output  signed [31:0] conv_result10,
    output  signed [31:0] conv_result11,
    output  signed [31:0] conv_result12,
    output  signed [31:0] conv_result13,
    output  signed [31:0] conv_result14,
    output  signed [31:0] conv_result15,
    output  signed [31:0] conv_result16,
    output  signed [31:0] conv_result17,
    output  signed [31:0] conv_result18,
    output  signed [31:0] conv_result19,
    output  signed [31:0] conv_result20,
    output  signed [31:0] conv_result21,
    output  signed [31:0] conv_result22,
    output  signed [31:0] conv_result23,
    output  signed [31:0] conv_result24,
    output  signed [31:0] conv_result25,
    output  signed [31:0] conv_result26,
    output  signed [31:0] conv_result27,
    output  signed [31:0] conv_result28,
    output  signed [31:0] conv_result29,
    output  signed [31:0] conv_result30,
    output  signed [31:0] conv_result31,
    output  signed [31:0] conv_result32
);

conv2d #(
    .CONV_WIDTH    (CONV_WIDTH   ),
    .CONV_HEIGHT   (CONV_HEIGHT  )
)conv1_1(
    .clk            (clk           ),
    .rst_n          (rst_n        ),
    
    .matrix_vsync   (matrix_vsync   ),  
    .matrix_href    (matrix_href    ), 
    
    .matrix_h_cnt   (matrix_h_cnt   ), //[6:0]
    .matrix_v_cnt   (matrix_v_cnt   ), //[6:0]
    
    .conv_bias      (conv_bias1   ),   //[15:0]
    .fm_data        (fm_data1 ),   //[143:0]
    .conv_weight    (conv_weight1 ),   //[143:0]
    
    .conv_h_cnt     (conv_h_cnt     ), //[6:0]
    .conv_v_cnt     (conv_v_cnt     ), //[6:0]
    .conv_href      (conv_href      ),
    .conv_vsync     (conv_vsync     ),
    .conv_result    (conv_result1      )  //signed [31:0]
);
conv2d #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_2(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias2     ),
    .fm_data        (fm_data2   ),    
    .conv_weight    (conv_weight2   ),
    .conv_result    (conv_result2   ) 
);

conv2d #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_3(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias3     ),
    .fm_data        (fm_data3   ),    
    .conv_weight    (conv_weight3   ),
    .conv_result    (conv_result3   ) 
);

conv2d #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_4(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias4     ),
    .fm_data        (fm_data4   ),    
    .conv_weight    (conv_weight4   ),
    .conv_result    (conv_result4   ) 
);

conv2d #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_5(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias5     ),
    .fm_data        (fm_data5   ),    
    .conv_weight    (conv_weight5   ),
    .conv_result    (conv_result5   ) 
);

conv2d #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_6(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias6     ),
    .fm_data        (fm_data6   ),    
    .conv_weight    (conv_weight6   ),
    .conv_result    (conv_result6   ) 
);

conv2d #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_7(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias7     ),
    .fm_data        (fm_data7   ),    
    .conv_weight    (conv_weight7   ),
    .conv_result    (conv_result7   ) 
);

conv2d #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_8(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias8     ),
    .fm_data        (fm_data8   ),    
    .conv_weight    (conv_weight8   ),
    .conv_result    (conv_result8   ) 
);

conv2d #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_9(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias9     ),
    .fm_data        (fm_data9   ),    
    .conv_weight    (conv_weight9   ),
    .conv_result    (conv_result9   ) 
);

conv2d #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_10(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias10     ),
    .fm_data        (fm_data10   ),    
    .conv_weight    (conv_weight10   ),
    .conv_result    (conv_result10   ) 
);

conv2d #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_11(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias11     ),
    .fm_data        (fm_data11   ),    
    .conv_weight    (conv_weight11   ),
    .conv_result    (conv_result11   ) 
);

conv2d #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_12(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias12     ),
    .fm_data        (fm_data12   ),    
    .conv_weight    (conv_weight12   ),
    .conv_result    (conv_result12   ) 
);

conv2d #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_13(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias13     ),
    .fm_data        (fm_data13   ),    
    .conv_weight    (conv_weight13   ),
    .conv_result    (conv_result13   ) 
);

conv2d #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_14(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias14     ),
    .fm_data        (fm_data14   ),    
    .conv_weight    (conv_weight14   ),
    .conv_result    (conv_result14   ) 
);

conv2d #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_15(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias15     ),
    .fm_data        (fm_data15   ),    
    .conv_weight    (conv_weight15   ),
    .conv_result    (conv_result15   ) 
);

conv2d #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_16(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias16     ),
    .fm_data        (fm_data16   ),    
    .conv_weight    (conv_weight16   ),
    .conv_result    (conv_result16   ) 
);

conv2d #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_17(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias17     ),
    .fm_data        (fm_data17   ),    
    .conv_weight    (conv_weight17   ),
    .conv_result    (conv_result17   ) 
);

conv2d #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_18(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias18     ),
    .fm_data        (fm_data18   ),    
    .conv_weight    (conv_weight18   ),
    .conv_result    (conv_result18   ) 
);

conv2d #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_19(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias19     ),
    .fm_data        (fm_data19   ),    
    .conv_weight    (conv_weight19   ),
    .conv_result    (conv_result19   ) 
);

conv2d #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_20(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias20     ),
    .fm_data        (fm_data20   ),    
    .conv_weight    (conv_weight20   ),
    .conv_result    (conv_result20   ) 
);

conv2d #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_21(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias21     ),
    .fm_data        (fm_data21   ),    
    .conv_weight    (conv_weight21   ),
    .conv_result    (conv_result21   ) 
);

conv2d #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_22(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias22     ),
    .fm_data        (fm_data22   ),    
    .conv_weight    (conv_weight22   ),
    .conv_result    (conv_result22   ) 
);

conv2d #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_23(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias23     ),
    .fm_data        (fm_data23   ),    
    .conv_weight    (conv_weight23   ),
    .conv_result    (conv_result23   ) 
);

conv2d #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_24(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias24     ),
    .fm_data        (fm_data24   ),    
    .conv_weight    (conv_weight24   ),
    .conv_result    (conv_result24   ) 
);

conv2d #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_25(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias25     ),
    .fm_data        (fm_data25   ),    
    .conv_weight    (conv_weight25   ),
    .conv_result    (conv_result25   ) 
);

conv2d_use_luts #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_26(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias26     ),
    .fm_data        (fm_data26   ),    
    .conv_weight    (conv_weight26   ),
    .conv_result    (conv_result26   ) 
);

conv2d_use_luts #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_27(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias27     ),
    .fm_data        (fm_data27   ),    
    .conv_weight    (conv_weight27   ),
    .conv_result    (conv_result27   ) 
);

conv2d_use_luts #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_28(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias28     ),
    .fm_data        (fm_data28   ),    
    .conv_weight    (conv_weight28   ),
    .conv_result    (conv_result28   ) 
);

conv2d_use_luts #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_29(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias29     ),
    .fm_data        (fm_data29   ),    
    .conv_weight    (conv_weight29   ),
    .conv_result    (conv_result29   ) 
);

conv2d_use_luts #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_30(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias30     ),
    .fm_data        (fm_data30   ),    
    .conv_weight    (conv_weight30   ),
    .conv_result    (conv_result30   ) 
);

conv2d_use_luts #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_31(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias31     ),
    .fm_data        (fm_data31   ),    
    .conv_weight    (conv_weight31   ),
    .conv_result    (conv_result31   ) 
);

conv2d_use_luts #(                             
    .CONV_WIDTH    (CONV_WIDTH   ),   
    .CONV_HEIGHT   (CONV_HEIGHT  )    
)conv1_32(                             
    .clk            (clk          ),  
    .rst_n          (rst_n        ),  
                                      
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
                                      
    .conv_bias      (conv_bias32     ),
    .fm_data        (fm_data32   ),    
    .conv_weight    (conv_weight32   ),
    .conv_result    (conv_result32   ) 
);


endmodule
