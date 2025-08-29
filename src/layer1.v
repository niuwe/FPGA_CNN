`timescale 1ns / 1ps


module layer1#(
    parameter   IMG_WIDTH       = 'd10 ,
    parameter   IMG_HEIGHT      = 'd10 
)(
    input clk   ,
    input rst_n ,
    
    input   [7:0]   pre_data     ,
    input           pre_vsync    ,
    input           pre_href     ,
    input           start_output ,
    
    output               save_fm_acmp      ,    
    output               end_output        ,
    output               layer1_fm_vsync   ,
    output               layer1_fm_href    ,
    output      [15:0]   layer1_fm1_data   ,
    output      [15:0]   layer1_fm2_data   ,
    output      [15:0]   layer1_fm3_data   ,
    output      [15:0]   layer1_fm4_data   ,
    output      [15:0]   layer1_fm5_data   ,
    output      [15:0]   layer1_fm6_data   ,
    output      [15:0]   layer1_fm7_data   ,
    output      [15:0]   layer1_fm8_data   ,
    output      [15:0]   layer1_fm9_data   ,
    output      [15:0]   layer1_fm10_data   ,
    output      [15:0]   layer1_fm11_data   ,
    output      [15:0]   layer1_fm12_data   ,
    output      [15:0]   layer1_fm13_data   ,
    output      [15:0]   layer1_fm14_data   ,
    output      [15:0]   layer1_fm15_data   ,
    output      [15:0]   layer1_fm16_data   
    
);


localparam  signed conv1_bias1 = 16'hEC40   ;
localparam  signed conv1_bias2 = 16'h0902   ;
localparam  signed conv1_bias3 = 16'h1043   ;
localparam  signed conv1_bias4 = 16'h12AE   ;
localparam  signed conv1_bias5 = 16'hF02D   ;
localparam  signed conv1_bias6 = 16'hEB0D   ;
localparam  signed conv1_bias7 = 16'hEBB1   ;
localparam  signed conv1_bias8 = 16'hEA0D   ;
localparam  signed conv1_bias9 = 16'hEF94   ;
localparam  signed conv1_bias10 = 16'h0B21   ;
localparam  signed conv1_bias11 = 16'h0006   ;
localparam  signed conv1_bias12 = 16'h0C3F   ;
localparam  signed conv1_bias13 = 16'hECCB   ;
localparam  signed conv1_bias14 = 16'hE8C7   ;
localparam  signed conv1_bias15 = 16'hE602   ;
localparam  signed conv1_bias16 = 16'hEA53   ;

wire [143:0]  conv1_weight1 ;
wire [143:0]  conv1_weight2 ;
wire [143:0]  conv1_weight3 ;
wire [143:0]  conv1_weight4 ;
wire [143:0]  conv1_weight5 ;
wire [143:0]  conv1_weight6 ;
wire [143:0]  conv1_weight7 ;
wire [143:0]  conv1_weight8 ;
wire [143:0]  conv1_weight9 ;
wire [143:0]  conv1_weight10 ;
wire [143:0]  conv1_weight11 ;
wire [143:0]  conv1_weight12 ;
wire [143:0]  conv1_weight13 ;
wire [143:0]  conv1_weight14 ;
wire [143:0]  conv1_weight15 ;
wire [143:0]  conv1_weight16 ;


wire          matrix_vsync        ;
wire          matrix_href         ;
wire [71:0]   img_data            ;
wire [6:0]    matrix_h_cnt        ;
wire [6:0]    matrix_v_cnt        ;
wire          start_ouput_flag    ;                     
                        
wire    [6:0]           conv_h_cnt   ;                                
wire    [6:0]           conv_v_cnt   ;
wire                    conv_href    ;
wire                    conv_vsync   ;

   
wire             relu_vsync     ;
wire             relu_href      ;
wire    [6:0]    relu_h_cnt     ;
wire    [6:0]    relu_v_cnt     ;


wire               pool_vsyn  ;
wire               pool_href  ;
wire    [6:0]      pool_h_cnt ;
wire    [6:0]      pool_v_cnt ;

wire    signed [31:0]   conv_result1   ;  
wire    signed [31:0]   conv_result2   ;
wire    signed [31:0]   conv_result3   ;  
wire    signed [31:0]   conv_result4   ;
wire    signed [31:0]   conv_result5   ;  
wire    signed [31:0]   conv_result6   ;
wire    signed [31:0]   conv_result7   ;  
wire    signed [31:0]   conv_result8   ;
wire    signed [31:0]   conv_result9   ;  
wire    signed [31:0]   conv_result10  ;
wire    signed [31:0]   conv_result11  ;  
wire    signed [31:0]   conv_result12  ;
wire    signed [31:0]   conv_result13  ;  
wire    signed [31:0]   conv_result14  ;
wire    signed [31:0]   conv_result15  ;  
wire    signed [31:0]   conv_result16  ;

wire    signed [31:0]   pre_relu_data1  ;
wire    signed [31:0]   pre_relu_data2  ;
wire    signed [31:0]   pre_relu_data3  ;
wire    signed [31:0]   pre_relu_data4  ;
wire    signed [31:0]   pre_relu_data5  ;
wire    signed [31:0]   pre_relu_data6  ;
wire    signed [31:0]   pre_relu_data7  ;
wire    signed [31:0]   pre_relu_data8  ;
wire    signed [31:0]   pre_relu_data9  ;
wire    signed [31:0]   pre_relu_data10 ;
wire    signed [31:0]   pre_relu_data11 ;
wire    signed [31:0]   pre_relu_data12 ;
wire    signed [31:0]   pre_relu_data13 ;
wire    signed [31:0]   pre_relu_data14 ;
wire    signed [31:0]   pre_relu_data15 ;
wire    signed [31:0]   pre_relu_data16 ;


wire [15:0]   relu_data1       ;
wire [15:0]   relu_data2       ;
wire [15:0]   relu_data3       ;
wire [15:0]   relu_data4       ;
wire [15:0]   relu_data5       ;
wire [15:0]   relu_data6       ;
wire [15:0]   relu_data7       ;
wire [15:0]   relu_data8       ;
wire [15:0]   relu_data9       ;
wire [15:0]   relu_data10      ;
wire [15:0]   relu_data11      ;
wire [15:0]   relu_data12      ;
wire [15:0]   relu_data13      ;
wire [15:0]   relu_data14      ;
wire [15:0]   relu_data15      ;
wire [15:0]   relu_data16      ;

wire    [15:0]     pool_data1   ;
wire    [15:0]     pool_data2   ;
wire    [15:0]     pool_data3   ;
wire    [15:0]     pool_data4   ;
wire    [15:0]     pool_data5   ;
wire    [15:0]     pool_data6   ;
wire    [15:0]     pool_data7   ;
wire    [15:0]     pool_data8   ;
wire    [15:0]     pool_data9   ;
wire    [15:0]     pool_data10  ;
wire    [15:0]     pool_data11  ;
wire    [15:0]     pool_data12  ;
wire    [15:0]     pool_data13  ;
wire    [15:0]     pool_data14  ;
wire    [15:0]     pool_data15  ;
wire    [15:0]     pool_data16  ;

wire               pool_done   ;  

assign  start_ouput_flag = pool_done || start_output ;

// Auto-generated from: conv1_weights_in01.coe
// Convolution kernel size: 3x3
// Total kernels: 16

// Kernel 1
assign conv1_weight1 = {
    16'h0C9E, 16'hED03, 16'hF0B5,
    16'hDD38, 16'h15A0, 16'hF978,
    16'h0DFF, 16'hECAA, 16'h054D
};

// Kernel 2
assign conv1_weight2 = {
    16'hE6FD, 16'hF89D, 16'h1000,
    16'h083C, 16'h0500, 16'hE379,
    16'h0710, 16'h0FB2, 16'hF660
};

// Kernel 3
assign conv1_weight3 = {
    16'h121B, 16'h0B9E, 16'hE177,
    16'h08F5, 16'hED08, 16'hF19A,
    16'hF9F9, 16'hFC02, 16'hFA80
};

// Kernel 4
assign conv1_weight4 = {
    16'h1A7B, 16'h10AF, 16'h0563,
    16'hF802, 16'hFCDB, 16'hE720,
    16'hE897, 16'hF07D, 16'hE7D1
};

// Kernel 5
assign conv1_weight5 = {
    16'hF893, 16'hF711, 16'hEFAA,
    16'hE74F, 16'h08B1, 16'hF651,
    16'h03DA, 16'h1765, 16'h1A4D
};

// Kernel 6
assign conv1_weight6 = {
    16'h13DE, 16'hFC4C, 16'hF609,
    16'h1A37, 16'hFE51, 16'hEC6C,
    16'hFFD6, 16'hF343, 16'hF1C8
};

// Kernel 7
assign conv1_weight7 = {
    16'h08EF, 16'hE6A5, 16'hF124,
    16'h0196, 16'h0249, 16'hFA54,
    16'h08D3, 16'hF08D, 16'h10A6
};

// Kernel 8
assign conv1_weight8 = {
    16'h0D74, 16'hFD87, 16'h07D9,
    16'hF5B1, 16'h15DA, 16'h0DB0,
    16'hFCC8, 16'hFF21, 16'hEE68
};

// Kernel 9
assign conv1_weight9 = {
    16'h0FAC, 16'h17BF, 16'hEEB1,
    16'h0450, 16'hE628, 16'hE963,
    16'hF808, 16'h143D, 16'h00A8
};

// Kernel 10
assign conv1_weight10 = {
    16'hEA92, 16'h02FF, 16'h01A4,
    16'hFF80, 16'h03CA, 16'h04AF,
    16'h04A6, 16'hFE34, 16'h0512
};

// Kernel 11
assign conv1_weight11 = {
    16'hFEAF, 16'hF16E, 16'hF13D,
    16'h12E7, 16'hEDA0, 16'h1221,
    16'h00D4, 16'hF0F0, 16'h0DA9
};

// Kernel 12
assign conv1_weight12 = {
    16'h0BFF, 16'h15A8, 16'hE9F7,
    16'h0898, 16'h15FF, 16'h008E,
    16'h064A, 16'h0876, 16'hF465
};

// Kernel 13
assign conv1_weight13 = {
    16'hFB7C, 16'h1318, 16'h0F1E,
    16'h1047, 16'h1759, 16'h0704,
    16'h13C3, 16'h041F, 16'hEE7D
};

// Kernel 14
assign conv1_weight14 = {
    16'hE81D, 16'hE8E4, 16'h1475,
    16'hF060, 16'h0FBC, 16'hE8EC,
    16'h17A8, 16'hF0BB, 16'hEA93
};

// Kernel 15
assign conv1_weight15 = {
    16'h0D11, 16'hE1F8, 16'h0368,
    16'hF00F, 16'h0ACB, 16'h05CF,
    16'h02EE, 16'h0F8A, 16'hE5B1
};

// Kernel 16
assign conv1_weight16 = {
    16'hDEAA, 16'h1338, 16'h0BEF,
    16'hE93D, 16'hF403, 16'hFE17,
    16'hF897, 16'h1785, 16'hECDE
};

assign  pre_relu_data1  = (conv_result1  + 128)>>>8  ;
assign  pre_relu_data2  = (conv_result2  + 128)>>>8  ;
assign  pre_relu_data3  = (conv_result3  + 128)>>>8  ;
assign  pre_relu_data4  = (conv_result4  + 128)>>>8  ;
assign  pre_relu_data5  = (conv_result5  + 128)>>>8  ;
assign  pre_relu_data6  = (conv_result6  + 128)>>>8  ;
assign  pre_relu_data7  = (conv_result7  + 128)>>>8  ;
assign  pre_relu_data8  = (conv_result8  + 128)>>>8  ;
assign  pre_relu_data9  = (conv_result9  + 128)>>>8  ;
assign  pre_relu_data10 = (conv_result10 + 128)>>>8  ;
assign  pre_relu_data11 = (conv_result11 + 128)>>>8  ;
assign  pre_relu_data12 = (conv_result12 + 128)>>>8  ;
assign  pre_relu_data13 = (conv_result13 + 128)>>>8  ;
assign  pre_relu_data14 = (conv_result14 + 128)>>>8  ;
assign  pre_relu_data15 = (conv_result15 + 128)>>>8  ;
assign  pre_relu_data16 = (conv_result16 + 128)>>>8  ;


Matrix_Generate_3X3
#(
    .FIFO_WIDTH (8           ),
    .IMG_HDISP  (IMG_WIDTH   ),           
    .IMG_VDISP  (IMG_HEIGHT  ),
    .DELAY_NUM  (10          )      
)
Img_Matrix_3X3(
    //  global clock & reset
    .clk     (clk            ) ,
    .rst_n   (rst_n          ) ,
    
    //  Image data prepared to be processed
    .pre_vsync (pre_vsync   ) ,   
    .pre_href  (pre_href    ) ,   
    .pre_data  (pre_data    ) ,   
    
    // h_cnt,v_cnt output
    .matrix_h_cnt           (matrix_h_cnt          ),
    .matrix_v_cnt           (matrix_v_cnt          ),
    
    //  Image data has been processed
    .matrix_vsync           (matrix_vsync           ),      //  processed Image data vsync valid signal
    .matrix_href            (matrix_href            ),      //  processed Image data href vaild  signal
    .data_combination       (img_data               )
);

//start conv and pool             
conv2d #(
    .CONV_WIDTH    (IMG_WIDTH   ),
    .CONV_HEIGHT   (IMG_HEIGHT  )
)conv1_1(
    .clk            (clk           ),
    .rst_n          (rst_n         ),
    
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
    
    .conv_bias      (conv1_bias1   ),
    .img_data       (img_data      ),
    .conv_weight    (conv1_weight1 ),
    
    .conv_h_cnt     (conv_h_cnt     ),
    .conv_v_cnt     (conv_v_cnt     ),
    .conv_href      (conv_href      ),
    .conv_vsync     (conv_vsync     ),
    .conv_result    (conv_result1   )
);

ReLU #(
    .PRE_BIT_WIDTH(32      )
)ReLU1_1(
    .clk   (clk            ),
    .rst_n (rst_n          ),
    
    .conv_h_cnt (conv_h_cnt    ),
    .conv_v_cnt (conv_v_cnt    ),
    .pre_vsync  (conv_vsync    ),
    .pre_href   (conv_href     ),
    .pre_data   (pre_relu_data1  ),
    
    .relu_h_cnt (relu_h_cnt    ),
    .relu_v_cnt (relu_v_cnt    ),
    .relu_vsync (relu_vsync    ),
    .relu_href  (relu_href     ),
    .relu_data  (relu_data1    )
);

max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (IMG_WIDTH/2  )  
)max_pool1_1(
    .clk    (clk            ),
    .rst_n  (rst_n          ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (relu_vsync   ),
    .pre_href       (relu_href    ),
    .pre_data       (relu_data1   ),
    
    .pool_h_cnt     (pool_h_cnt   ),
    .pool_v_cnt     (pool_v_cnt   ),
    
    .pool_done      (pool_done    ),
    .pool_vsync     (pool_vsyn    ),
    .pool_href      (pool_href    ),
    .pool_data      (pool_data1   )
);


layer1_feature_map#(
    .FM_WIDTH    (IMG_WIDTH/2   ),
    .FM_HEIGHT   (IMG_HEIGHT/2  )
)u1_layer1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),
    
    .start_output (start_ouput_flag  ),
    .pre_vsync    (pool_vsyn         ),
    .pre_href     (pool_href         ),
    .pre_data     (pool_data1        ),
    
    .save_fm_acmp  (save_fm_acmp     ), 
    .end_output    (end_output       ),
    .post_data     (layer1_fm1_data   ),
    .post_href     (layer1_fm_href    ),
    .post_vsync    (layer1_fm_vsync   )
);

     
conv2d #(
    .CONV_WIDTH    (IMG_WIDTH-2   ),
    .CONV_HEIGHT   (IMG_HEIGHT-2  )
)conv1_2(
    .clk            (clk           ),
    .rst_n          (rst_n         ),
    
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
    
    .conv_bias      (conv1_bias2   ),
    .img_data       (img_data      ),
    .conv_weight    (conv1_weight2 ),
    
    .conv_result    (conv_result2   )
);


ReLU #(
    .PRE_BIT_WIDTH(32      )
)ReLU1_2(
    .clk   (clk            ),
    .rst_n (rst_n          ),
    
    .conv_h_cnt (conv_h_cnt    ),
    .conv_v_cnt (conv_v_cnt    ),
    .pre_vsync  (conv_vsync    ),
    .pre_href   (conv_href     ),
    .pre_data   (pre_relu_data2 ),
    
    .relu_data  (relu_data2    )
);


max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (IMG_WIDTH/2  )  
)max_pool1_2(
    .clk    (clk            ),
    .rst_n  (rst_n          ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (relu_vsync   ),
    .pre_href       (relu_href    ),
    .pre_data       (relu_data2   ),
    
    .pool_data      (pool_data2   )
);


layer1_feature_map#(
    .FM_WIDTH    (IMG_WIDTH/2       ),
    .FM_HEIGHT   (IMG_HEIGHT/2       )
)u2_layer1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),
    
    .start_output(start_ouput_flag  ),
    .pre_vsync   (pool_vsyn         ),
    .pre_href    (pool_href         ),
    .pre_data    (pool_data2        ),
    
    .post_data  (layer1_fm2_data )
);

conv2d #(
    .CONV_WIDTH    (IMG_WIDTH-2   ),
    .CONV_HEIGHT   (IMG_HEIGHT-2  )
)conv1_3(
    .clk            (clk           ),
    .rst_n          (rst_n         ),
    
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
    
    .conv_bias      (conv1_bias3   ),
    .img_data       (img_data      ),
    .conv_weight    (conv1_weight3 ),
    
    .conv_result    (conv_result3   )
);


ReLU #(
    .PRE_BIT_WIDTH(32      )
)ReLU1_3(
    .clk   (clk            ),
    .rst_n (rst_n          ),
    
    .conv_h_cnt (conv_h_cnt    ),
    .conv_v_cnt (conv_v_cnt    ),
    .pre_vsync  (conv_vsync    ),
    .pre_href   (conv_href     ),
    .pre_data   (pre_relu_data3 ),
    
    .relu_data  (relu_data3    )
);


max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (IMG_WIDTH/2  )  
)max_pool1_3(
    .clk    (clk            ),
    .rst_n  (rst_n          ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (relu_vsync   ),
    .pre_href       (relu_href    ),
    .pre_data       (relu_data3   ),
    
    .pool_data      (pool_data3   )
);


layer1_feature_map#(
    .FM_WIDTH    (IMG_WIDTH/2       ),
    .FM_HEIGHT   (IMG_HEIGHT/2       )
)u3_layer1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),
    
    .start_output(start_ouput_flag  ),
    .pre_vsync   (pool_vsyn         ),
    .pre_href    (pool_href         ),
    .pre_data    (pool_data3        ),
    
    .post_data  (layer1_fm3_data )
);

conv2d #(
    .CONV_WIDTH    (IMG_WIDTH-2   ),
    .CONV_HEIGHT   (IMG_HEIGHT-2  )
)conv1_4(
    .clk            (clk           ),
    .rst_n          (rst_n         ),
    
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
    
    .conv_bias      (conv1_bias4   ),
    .img_data       (img_data      ),
    .conv_weight    (conv1_weight4 ),
    
    .conv_result    (conv_result4   )
);


ReLU #(
    .PRE_BIT_WIDTH(32      )
)ReLU1_4(
    .clk   (clk            ),
    .rst_n (rst_n          ),
    
    .conv_h_cnt (conv_h_cnt    ),
    .conv_v_cnt (conv_v_cnt    ),
    .pre_vsync  (conv_vsync    ),
    .pre_href   (conv_href     ),
    .pre_data   (pre_relu_data4 ),
    
    .relu_data  (relu_data4    )
);


max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (IMG_WIDTH/2  )  
)max_pool1_4(
    .clk    (clk            ),
    .rst_n  (rst_n          ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (relu_vsync   ),
    .pre_href       (relu_href    ),
    .pre_data       (relu_data4   ),
    
    .pool_data      (pool_data4   )
);


layer1_feature_map#(
    .FM_WIDTH    (IMG_WIDTH/2       ),
    .FM_HEIGHT   (IMG_HEIGHT/2       )
)u4_layer1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),
    
    .start_output(start_ouput_flag  ),
    .pre_vsync   (pool_vsyn         ),
    .pre_href    (pool_href         ),
    .pre_data    (pool_data4        ),
    
    .post_data  (layer1_fm4_data )
);

conv2d #(
    .CONV_WIDTH    (IMG_WIDTH-2   ),
    .CONV_HEIGHT   (IMG_HEIGHT-2  )
)conv1_5(
    .clk            (clk           ),
    .rst_n          (rst_n         ),
    
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
    
    .conv_bias      (conv1_bias5   ),
    .img_data       (img_data      ),
    .conv_weight    (conv1_weight5 ),
    
    .conv_result    (conv_result5   )
);


ReLU #(
    .PRE_BIT_WIDTH(32      )
)ReLU1_5(
    .clk   (clk            ),
    .rst_n (rst_n          ),
    
    .conv_h_cnt (conv_h_cnt    ),
    .conv_v_cnt (conv_v_cnt    ),
    .pre_vsync  (conv_vsync    ),
    .pre_href   (conv_href     ),
    .pre_data   (pre_relu_data5 ),
    
    .relu_data  (relu_data5    )
);


max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (IMG_WIDTH/2  )  
)max_pool1_5(
    .clk    (clk            ),
    .rst_n  (rst_n          ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (relu_vsync   ),
    .pre_href       (relu_href    ),
    .pre_data       (relu_data5   ),
    
    .pool_data      (pool_data5   )
);


layer1_feature_map#(
    .FM_WIDTH    (IMG_WIDTH/2       ),
    .FM_HEIGHT   (IMG_HEIGHT/2       )
)u5_layer1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),
    
    .start_output(start_ouput_flag  ),
    .pre_vsync   (pool_vsyn         ),
    .pre_href    (pool_href         ),
    .pre_data    (pool_data5        ),
    
    .post_data  (layer1_fm5_data )
);

conv2d #(
    .CONV_WIDTH    (IMG_WIDTH-2   ),
    .CONV_HEIGHT   (IMG_HEIGHT-2  )
)conv1_6(
    .clk            (clk           ),
    .rst_n          (rst_n         ),
    
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
    
    .conv_bias      (conv1_bias6   ),
    .img_data       (img_data      ),
    .conv_weight    (conv1_weight6 ),
    
    .conv_result    (conv_result6   )
);


ReLU #(
    .PRE_BIT_WIDTH(32      )
)ReLU1_6(
    .clk   (clk            ),
    .rst_n (rst_n          ),
    
    .conv_h_cnt (conv_h_cnt    ),
    .conv_v_cnt (conv_v_cnt    ),
    .pre_vsync  (conv_vsync    ),
    .pre_href   (conv_href     ),
    .pre_data   (pre_relu_data6 ),
    
    .relu_data  (relu_data6    )
);


max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (IMG_WIDTH/2  )  
)max_pool1_6(
    .clk    (clk            ),
    .rst_n  (rst_n          ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (relu_vsync   ),
    .pre_href       (relu_href    ),
    .pre_data       (relu_data6   ),
    
    .pool_data      (pool_data6   )
);


layer1_feature_map#(
    .FM_WIDTH    (IMG_WIDTH/2       ),
    .FM_HEIGHT   (IMG_HEIGHT/2       )
)u6_layer1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),
    
    .start_output(start_ouput_flag  ),
    .pre_vsync   (pool_vsyn         ),
    .pre_href    (pool_href         ),
    .pre_data    (pool_data6        ),
    
    .post_data  (layer1_fm6_data )
);

conv2d #(
    .CONV_WIDTH    (IMG_WIDTH-2   ),
    .CONV_HEIGHT   (IMG_HEIGHT-2  )
)conv1_7(
    .clk            (clk           ),
    .rst_n          (rst_n         ),
    
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
    
    .conv_bias      (conv1_bias7   ),
    .img_data       (img_data      ),
    .conv_weight    (conv1_weight7 ),
    
    .conv_result    (conv_result7   )
);


ReLU #(
    .PRE_BIT_WIDTH(32      )
)ReLU1_7(
    .clk   (clk            ),
    .rst_n (rst_n          ),
    
    .conv_h_cnt (conv_h_cnt    ),
    .conv_v_cnt (conv_v_cnt    ),
    .pre_vsync  (conv_vsync    ),
    .pre_href   (conv_href     ),
    .pre_data   (pre_relu_data7  ),
    
    .relu_data  (relu_data7    )
);


max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (IMG_WIDTH/2  )  
)max_pool1_7(
    .clk    (clk            ),
    .rst_n  (rst_n          ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (relu_vsync   ),
    .pre_href       (relu_href    ),
    .pre_data       (relu_data7   ),
    
    .pool_data      (pool_data7   )
);


layer1_feature_map#(
    .FM_WIDTH    (IMG_WIDTH/2       ),
    .FM_HEIGHT   (IMG_HEIGHT/2       )
)u7_layer1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),
    
    .start_output(start_ouput_flag  ),
    .pre_vsync   (pool_vsyn         ),
    .pre_href    (pool_href         ),
    .pre_data    (pool_data7        ),
    
    .post_data  (layer1_fm7_data )
);

conv2d #(
    .CONV_WIDTH    (IMG_WIDTH-2   ),
    .CONV_HEIGHT   (IMG_HEIGHT-2  )
)conv1_8(
    .clk            (clk           ),
    .rst_n          (rst_n         ),
    
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
    
    .conv_bias      (conv1_bias8   ),
    .img_data       (img_data      ),
    .conv_weight    (conv1_weight8 ),
    
    .conv_result    (conv_result8   )
);


ReLU #(
    .PRE_BIT_WIDTH(32      )
)ReLU1_8(
    .clk   (clk            ),
    .rst_n (rst_n          ),
    
    .conv_h_cnt (conv_h_cnt    ),
    .conv_v_cnt (conv_v_cnt    ),
    .pre_vsync  (conv_vsync    ),
    .pre_href   (conv_href     ),
    .pre_data   (pre_relu_data8 ),
    
    .relu_data  (relu_data8    )
);


max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (IMG_WIDTH/2  )  
)max_pool1_8(
    .clk    (clk            ),
    .rst_n  (rst_n          ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (relu_vsync   ),
    .pre_href       (relu_href    ),
    .pre_data       (relu_data8   ),
    
    .pool_data      (pool_data8   )
);


layer1_feature_map#(
    .FM_WIDTH    (IMG_WIDTH/2       ),
    .FM_HEIGHT   (IMG_HEIGHT/2       )
)u8_layer1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),
    
    .start_output(start_ouput_flag  ),
    .pre_vsync   (pool_vsyn         ),
    .pre_href    (pool_href         ),
    .pre_data    (pool_data8        ),
    
    .post_data  (layer1_fm8_data )
);

conv2d #(
    .CONV_WIDTH    (IMG_WIDTH-2   ),
    .CONV_HEIGHT   (IMG_HEIGHT-2  )
)conv1_9(
    .clk            (clk           ),
    .rst_n          (rst_n         ),
    
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
    
    .conv_bias      (conv1_bias9   ),
    .img_data       (img_data      ),
    .conv_weight    (conv1_weight9 ),
    
    .conv_result    (conv_result9   )
);


ReLU #(
    .PRE_BIT_WIDTH(32      )
)ReLU1_9(
    .clk   (clk            ),
    .rst_n (rst_n          ),
    
    .conv_h_cnt (conv_h_cnt    ),
    .conv_v_cnt (conv_v_cnt    ),
    .pre_vsync  (conv_vsync    ),
    .pre_href   (conv_href     ),
    .pre_data   (pre_relu_data9 ),
    
    .relu_data  (relu_data9    )
);


max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (IMG_WIDTH/2  )  
)max_pool1_9(
    .clk    (clk            ),
    .rst_n  (rst_n          ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (relu_vsync   ),
    .pre_href       (relu_href    ),
    .pre_data       (relu_data9   ),
    
    .pool_data      (pool_data9   )
);


layer1_feature_map#(
    .FM_WIDTH    (IMG_WIDTH/2       ),
    .FM_HEIGHT   (IMG_HEIGHT/2       )
)u9_layer1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),
    
    .start_output(start_ouput_flag  ),
    .pre_vsync   (pool_vsyn         ),
    .pre_href    (pool_href         ),
    .pre_data    (pool_data9        ),
    
    .post_data  (layer1_fm9_data )
);

conv2d #(
    .CONV_WIDTH    (IMG_WIDTH-2   ),
    .CONV_HEIGHT   (IMG_HEIGHT-2  )
)conv1_10(
    .clk            (clk           ),
    .rst_n          (rst_n         ),
    
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
    
    .conv_bias      (conv1_bias10   ),
    .img_data       (img_data       ),
    .conv_weight    (conv1_weight10 ),
    
    .conv_result    (conv_result10   )
);


ReLU #(
    .PRE_BIT_WIDTH(32      )
)ReLU1_10(
    .clk   (clk            ),
    .rst_n (rst_n          ),
    
    .conv_h_cnt (conv_h_cnt    ),
    .conv_v_cnt (conv_v_cnt    ),
    .pre_vsync  (conv_vsync    ),
    .pre_href   (conv_href     ),
    .pre_data   (pre_relu_data10 ),
    
    .relu_data  (relu_data10    )
);


max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (IMG_WIDTH/2  )  
)max_pool1_10(
    .clk    (clk            ),
    .rst_n  (rst_n          ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (relu_vsync   ),
    .pre_href       (relu_href    ),
    .pre_data       (relu_data10   ),
    
    .pool_data      (pool_data10   )
);


layer1_feature_map#(
    .FM_WIDTH    (IMG_WIDTH/2       ),
    .FM_HEIGHT   (IMG_HEIGHT/2       )
)u10_layer1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),
    
    .start_output(start_ouput_flag  ),
    .pre_vsync   (pool_vsyn         ),
    .pre_href    (pool_href         ),
    .pre_data    (pool_data10        ),
    
    .post_data  (layer1_fm10_data )
);

conv2d #(
    .CONV_WIDTH    (IMG_WIDTH-2   ),
    .CONV_HEIGHT   (IMG_HEIGHT-2  )
)conv1_11(
    .clk            (clk           ),
    .rst_n          (rst_n         ),
    
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
    
    .conv_bias      (conv1_bias11   ),
    .img_data       (img_data      ),
    .conv_weight    (conv1_weight11 ),
    
    .conv_result    (conv_result11   )
);


ReLU #(
    .PRE_BIT_WIDTH(32      )
)ReLU1_11(
    .clk   (clk            ),
    .rst_n (rst_n          ),
    
    .conv_h_cnt (conv_h_cnt    ),
    .conv_v_cnt (conv_v_cnt    ),
    .pre_vsync  (conv_vsync    ),
    .pre_href   (conv_href     ),
    .pre_data   (pre_relu_data11 ),
    
    .relu_data  (relu_data11    )
);


max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (IMG_WIDTH/2  )  
)max_pool1_11(
    .clk    (clk            ),
    .rst_n  (rst_n          ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (relu_vsync   ),
    .pre_href       (relu_href    ),
    .pre_data       (relu_data11   ),
    
    .pool_data      (pool_data11   )
);


layer1_feature_map#(
    .FM_WIDTH    (IMG_WIDTH/2       ),
    .FM_HEIGHT   (IMG_HEIGHT/2       )
)u11_layer1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),
    
    .start_output(start_ouput_flag  ),
    .pre_vsync   (pool_vsyn         ),
    .pre_href    (pool_href         ),
    .pre_data    (pool_data11        ),
    
    .post_data  (layer1_fm11_data )
);

conv2d #(
    .CONV_WIDTH    (IMG_WIDTH-2   ),
    .CONV_HEIGHT   (IMG_HEIGHT-2  )
)conv1_12(
    .clk            (clk           ),
    .rst_n          (rst_n         ),
    
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
    
    .conv_bias      (conv1_bias12   ),
    .img_data       (img_data       ),
    .conv_weight    (conv1_weight12 ),
    
    .conv_result    (conv_result12   )
);


ReLU #(
    .PRE_BIT_WIDTH(32      )
)ReLU1_12(
    .clk   (clk            ),
    .rst_n (rst_n          ),
    
    .conv_h_cnt (conv_h_cnt    ),
    .conv_v_cnt (conv_v_cnt    ),
    .pre_vsync  (conv_vsync    ),
    .pre_href   (conv_href     ),
    .pre_data   (pre_relu_data12 ),
    
    .relu_data  (relu_data12    )
);


max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (IMG_WIDTH/2  )  
)max_pool1_12(
    .clk    (clk            ),
    .rst_n  (rst_n          ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (relu_vsync   ),
    .pre_href       (relu_href    ),
    .pre_data       (relu_data12   ),
    
    .pool_data      (pool_data12   )
);


layer1_feature_map#(
    .FM_WIDTH    (IMG_WIDTH/2       ),
    .FM_HEIGHT   (IMG_HEIGHT/2       )
)u12_layer1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),
    
    .start_output(start_ouput_flag  ),
    .pre_vsync   (pool_vsyn         ),
    .pre_href    (pool_href         ),
    .pre_data    (pool_data12       ),
    
    .post_data  (layer1_fm12_data )
);

conv2d #(
    .CONV_WIDTH    (IMG_WIDTH-2   ),
    .CONV_HEIGHT   (IMG_HEIGHT-2  )
)conv1_13(
    .clk            (clk           ),
    .rst_n          (rst_n         ),
    
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
    
    .conv_bias      (conv1_bias13   ),
    .img_data       (img_data       ),
    .conv_weight    (conv1_weight13 ),
    
    .conv_result    (conv_result13   )
);


ReLU #(
    .PRE_BIT_WIDTH(32      )
)ReLU1_13(
    .clk   (clk            ),
    .rst_n (rst_n          ),
    
    .conv_h_cnt (conv_h_cnt    ),
    .conv_v_cnt (conv_v_cnt    ),
    .pre_vsync  (conv_vsync    ),
    .pre_href   (conv_href     ),
    .pre_data   (pre_relu_data13 ),
    
    .relu_data  (relu_data13   )
);


max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (IMG_WIDTH/2  )  
)max_pool1_13(
    .clk    (clk            ),
    .rst_n  (rst_n          ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (relu_vsync   ),
    .pre_href       (relu_href    ),
    .pre_data       (relu_data13  ),
    
    .pool_data      (pool_data13   )
);


layer1_feature_map#(
    .FM_WIDTH    (IMG_WIDTH/2       ),
    .FM_HEIGHT   (IMG_HEIGHT/2        )
)u13_layer1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),
    
    .start_output(start_ouput_flag  ),
    .pre_vsync   (pool_vsyn         ),
    .pre_href    (pool_href         ),
    .pre_data    (pool_data13        ),
    
    .post_data  (layer1_fm13_data )
);

conv2d #(
    .CONV_WIDTH    (IMG_WIDTH-2   ),
    .CONV_HEIGHT   (IMG_HEIGHT-2  )
)conv1_14(
    .clk            (clk           ),
    .rst_n          (rst_n         ),
    
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
    
    .conv_bias      (conv1_bias14   ),
    .img_data       (img_data      ),
    .conv_weight    (conv1_weight14 ),
    
    .conv_result    (conv_result14   )
);


ReLU #(
    .PRE_BIT_WIDTH(32      )
)ReLU1_14(
    .clk   (clk            ),
    .rst_n (rst_n          ),
    
    .conv_h_cnt (conv_h_cnt    ),
    .conv_v_cnt (conv_v_cnt    ),
    .pre_vsync  (conv_vsync    ),
    .pre_href   (conv_href     ),
    .pre_data   (pre_relu_data14 ),
    
    .relu_data  (relu_data14    )
);


max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (IMG_WIDTH/2  )  
)max_pool1_14(
    .clk    (clk            ),
    .rst_n  (rst_n          ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (relu_vsync   ),
    .pre_href       (relu_href    ),
    .pre_data       (relu_data14   ),
    
    .pool_data      (pool_data14   )
);


layer1_feature_map#(
    .FM_WIDTH    (IMG_WIDTH/2       ),
    .FM_HEIGHT   (IMG_HEIGHT/2        )
)u14_layer1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),
    
    .start_output(start_ouput_flag  ),
    .pre_vsync   (pool_vsyn         ),
    .pre_href    (pool_href         ),
    .pre_data    (pool_data14        ),
    
    .post_data  (layer1_fm14_data )
);

conv2d #(
    .CONV_WIDTH    (IMG_WIDTH-2   ),
    .CONV_HEIGHT   (IMG_HEIGHT-2  )
)conv1_15(
    .clk            (clk           ),
    .rst_n          (rst_n         ),
    
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
    
    .conv_bias      (conv1_bias15   ),
    .img_data       (img_data      ),
    .conv_weight    (conv1_weight15 ),
    
    .conv_result    (conv_result15   )
);


ReLU #(
    .PRE_BIT_WIDTH(32      )
)ReLU1_15(
    .clk   (clk            ),
    .rst_n (rst_n          ),
    
    .conv_h_cnt (conv_h_cnt    ),
    .conv_v_cnt (conv_v_cnt    ),
    .pre_vsync  (conv_vsync    ),
    .pre_href   (conv_href     ),
    .pre_data   (pre_relu_data15 ),
    
    .relu_data  (relu_data15    )
);


max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (IMG_WIDTH/2  )  
)max_pool1_15(
    .clk    (clk            ),
    .rst_n  (rst_n          ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (relu_vsync   ),
    .pre_href       (relu_href    ),
    .pre_data       (relu_data15   ),
    
    .pool_data      (pool_data15   )
);


layer1_feature_map#(
    .FM_WIDTH    (IMG_WIDTH/2       ),
    .FM_HEIGHT   (IMG_HEIGHT/2        )
)u15_layer1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),
    
    .start_output(start_ouput_flag  ),
    .pre_vsync   (pool_vsyn         ),
    .pre_href    (pool_href         ),
    .pre_data    (pool_data15        ),
    
    .post_data  (layer1_fm15_data )
);

conv2d #(
    .CONV_WIDTH    (IMG_WIDTH-2   ),
    .CONV_HEIGHT   (IMG_HEIGHT-2  )
)conv1_16(
    .clk            (clk           ),
    .rst_n          (rst_n         ),
    
    .matrix_vsync   (matrix_vsync   ),
    .matrix_href    (matrix_href    ),
    
    .matrix_h_cnt   (matrix_h_cnt   ),
    .matrix_v_cnt   (matrix_v_cnt   ),
    
    .conv_bias      (conv1_bias16   ),
    .img_data       (img_data      ),
    .conv_weight    (conv1_weight16 ),
    
    .conv_result    (conv_result16   )
);


ReLU #(
    .PRE_BIT_WIDTH(32      )
)ReLU1_16(
    .clk   (clk            ),
    .rst_n (rst_n          ),
    
    .conv_h_cnt (conv_h_cnt    ),
    .conv_v_cnt (conv_v_cnt    ),
    .pre_vsync  (conv_vsync    ),
    .pre_href   (conv_href     ),
    .pre_data   (pre_relu_data16 ),
    
    .relu_data  (relu_data16   )
);


max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (IMG_WIDTH/2  )  
)max_pool1_16(
    .clk    (clk            ),
    .rst_n  (rst_n          ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (relu_vsync   ),
    .pre_href       (relu_href    ),
    .pre_data       (relu_data16   ),
    
    .pool_data      (pool_data16  )
);


layer1_feature_map#(
    .FM_WIDTH    (IMG_WIDTH/2       ),
    .FM_HEIGHT   (IMG_HEIGHT/2       )
)u16_layer1_feature_map(
    .clk     (clk          ),
    .rst_n   (rst_n        ),
    
    .start_output(start_ouput_flag  ),
    .pre_vsync   (pool_vsyn         ),
    .pre_href    (pool_href         ),
    .pre_data    (pool_data16        ),
    
    .post_data  (layer1_fm16_data )
);
endmodule
