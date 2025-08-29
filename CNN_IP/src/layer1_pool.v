`timescale 1ns / 1ps

module layer1_pool#(
    parameter   WIDTH = 'd16
    )(
    input    clk   ,
    input    rst_n ,
    
    input    [6:0]   relu_h_cnt ,
    input    [6:0]   relu_v_cnt ,
    input            pre_vsync  ,
    input            pre_href   ,
    input    [15:0]  pre_data1    ,
    input    [15:0]  pre_data2    ,
    input    [15:0]  pre_data3    ,
    input    [15:0]  pre_data4    ,
    input    [15:0]  pre_data5    ,
    input    [15:0]  pre_data6    ,
    input    [15:0]  pre_data7    ,
    input    [15:0]  pre_data8    ,
    input    [15:0]  pre_data9    ,
    input    [15:0]  pre_data10   ,
    input    [15:0]  pre_data11   ,
    input    [15:0]  pre_data12   ,
    input    [15:0]  pre_data13   ,
    input    [15:0]  pre_data14   ,
    input    [15:0]  pre_data15   ,
    input    [15:0]  pre_data16   ,
   
    output              pool_done  ,
    output      [6:0]   pool_h_cnt ,
    output      [6:0]   pool_v_cnt ,
    
    output               pool_vsync ,
    output               pool_href  ,
    output       [15:0]  pool_data1  ,  
    output       [15:0]  pool_data2  , 
    output       [15:0]  pool_data3  ,  
    output       [15:0]  pool_data4  ,  
    output       [15:0]  pool_data5  ,  
    output       [15:0]  pool_data6  ,  
    output       [15:0]  pool_data7  ,  
    output       [15:0]  pool_data8  ,   
    output       [15:0]  pool_data9  ,  
    output       [15:0]  pool_data10 , 
    output       [15:0]  pool_data11 ,  
    output       [15:0]  pool_data12 ,  
    output       [15:0]  pool_data13 ,  
    output       [15:0]  pool_data14 ,  
    output       [15:0]  pool_data15 ,  
    output       [15:0]  pool_data16 
);



max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (WIDTH        )  
)pool_1(
    .clk    (clk            ),
    .rst_n  (rst_n        ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (pre_vsync    ),
    .pre_href       (pre_href     ),
    .pre_data       (pre_data1   ),
    
    .pool_h_cnt     (pool_h_cnt   ),
    .pool_v_cnt     (pool_v_cnt   ),
    
    .pool_done      (pool_done    ),
    .pool_vsync     (pool_vsync   ),
    .pool_href      (pool_href    ),
    .pool_data      (pool_data1   )     //[15:0]
);

max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (WIDTH        )  
)pool_2(
    .clk    (clk            ),
    .rst_n  (rst_n        ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (pre_vsync    ),
    .pre_href       (pre_href     ),
    .pre_data       (pre_data2   ),
    
    .pool_data      (pool_data2   )     
);

max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (WIDTH        )  
)pool_3(
    .clk    (clk            ),
    .rst_n  (rst_n        ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (pre_vsync    ),
    .pre_href       (pre_href     ),
    .pre_data       (pre_data3   ),
    
    .pool_data      (pool_data3   ) 
);

max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (WIDTH        )  
)pool_4(
    .clk    (clk            ),
    .rst_n  (rst_n        ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (pre_vsync    ),
    .pre_href       (pre_href     ),
    .pre_data       (pre_data4   ),
    
    .pool_data      (pool_data4   ) 
);

max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (WIDTH        )  
)pool_5(
    .clk    (clk            ),
    .rst_n  (rst_n        ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (pre_vsync    ),
    .pre_href       (pre_href     ),
    .pre_data       (pre_data5   ),
    
    .pool_data      (pool_data5   ) 
);

max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (WIDTH        )  
)pool_6(
    .clk    (clk            ),
    .rst_n  (rst_n        ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (pre_vsync    ),
    .pre_href       (pre_href     ),
    .pre_data       (pre_data6   ),
    
    .pool_data      (pool_data6   ) 
);

max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (WIDTH        )  
)pool_7(
    .clk    (clk            ),
    .rst_n  (rst_n        ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (pre_vsync    ),
    .pre_href       (pre_href     ),
    .pre_data       (pre_data7   ),
    
    .pool_data      (pool_data7   ) 
);

max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (WIDTH        )  
)pool_8(
    .clk    (clk            ),
    .rst_n  (rst_n        ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (pre_vsync    ),
    .pre_href       (pre_href     ),
    .pre_data       (pre_data8   ),
    
    .pool_data      (pool_data8   ) 
);

max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (WIDTH        )  
)pool_9(
    .clk    (clk            ),
    .rst_n  (rst_n        ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (pre_vsync    ),
    .pre_href       (pre_href     ),
    .pre_data       (pre_data9   ),
    
    .pool_data      (pool_data9   ) 
);

max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (WIDTH        )  
)pool_10(
    .clk    (clk            ),
    .rst_n  (rst_n        ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (pre_vsync    ),
    .pre_href       (pre_href     ),
    .pre_data       (pre_data10   ),
    
    .pool_data      (pool_data10   ) 
);

max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (WIDTH        )  
)pool_11(
    .clk    (clk            ),
    .rst_n  (rst_n        ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (pre_vsync    ),
    .pre_href       (pre_href     ),
    .pre_data       (pre_data11   ),
    
    .pool_data      (pool_data11   ) 
);

max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (WIDTH        )  
)pool_12(
    .clk    (clk            ),
    .rst_n  (rst_n        ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (pre_vsync    ),
    .pre_href       (pre_href     ),
    .pre_data       (pre_data12   ),
    
    .pool_data      (pool_data12   ) 
);

max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (WIDTH        )  
)pool_13(
    .clk    (clk            ),
    .rst_n  (rst_n        ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (pre_vsync    ),
    .pre_href       (pre_href     ),
    .pre_data       (pre_data13   ),
    
    .pool_data      (pool_data13   ) 
);

max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (WIDTH        )  
)pool_14(
    .clk    (clk            ),
    .rst_n  (rst_n        ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (pre_vsync    ),
    .pre_href       (pre_href     ),
    .pre_data       (pre_data14   ),
    
    .pool_data      (pool_data14   ) 
);

max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (WIDTH        )  
)pool_15(
    .clk    (clk            ),
    .rst_n  (rst_n        ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (pre_vsync    ),
    .pre_href       (pre_href     ),
    .pre_data       (pre_data15   ),
    
    .pool_data      (pool_data15   ) 
);

max_pool
#(
    .FIFO_WIDTH (16           ),
    .FIFO_DEPTH (WIDTH        )  
)pool_16(
    .clk    (clk            ),
    .rst_n  (rst_n        ),
    
    .relu_h_cnt     (relu_h_cnt   ),
    .relu_v_cnt     (relu_v_cnt   ),
    .pre_vsync      (pre_vsync    ),
    .pre_href       (pre_href     ),
    .pre_data       (pre_data16   ),
    
    .pool_data      (pool_data16   ) 
);



endmodule
