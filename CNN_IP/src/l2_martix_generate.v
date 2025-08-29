`timescale 1ns / 1ps

module l2_martix_generate
#(
    parameter   [4:0]  FIFO_WIDTH = 5'd16,    
    parameter   [6:0]  IMG_HDISP  = 7'd64,           
    parameter   [6:0]  IMG_VDISP  = 7'd64,
    parameter   [6:0]  DELAY_NUM  = 7'd10           
)
(
    //  global clock & reset
    input  wire                 clk                     ,
    input  wire                 rst_n                   ,
    input  wire                            pre_vsync           ,    
    input  wire                            pre_href            ,    
    input  wire     [FIFO_WIDTH-1:0]       pre_data1   ,   
    input  wire     [FIFO_WIDTH-1:0]       pre_data2   ,  
    input  wire     [FIFO_WIDTH-1:0]       pre_data3   ,  
    input  wire     [FIFO_WIDTH-1:0]       pre_data4   ,  
    input  wire     [FIFO_WIDTH-1:0]       pre_data5   ,  
    input  wire     [FIFO_WIDTH-1:0]       pre_data6   ,  
    input  wire     [FIFO_WIDTH-1:0]       pre_data7   ,  
    input  wire     [FIFO_WIDTH-1:0]       pre_data8   ,  
    input  wire     [FIFO_WIDTH-1:0]       pre_data9   ,   
    input  wire     [FIFO_WIDTH-1:0]       pre_data10  ,  
    input  wire     [FIFO_WIDTH-1:0]       pre_data11  ,  
    input  wire     [FIFO_WIDTH-1:0]       pre_data12  ,  
    input  wire     [FIFO_WIDTH-1:0]       pre_data13  ,  
    input  wire     [FIFO_WIDTH-1:0]       pre_data14  ,  
    input  wire     [FIFO_WIDTH-1:0]       pre_data15  ,  
    input  wire     [FIFO_WIDTH-1:0]       pre_data16  ,
    
    output wire    [6:0]        matrix_h_cnt            ,
    output wire    [6:0]        matrix_v_cnt            ,
    output wire                 matrix_vsync            ,   
    output wire                 matrix_href             ,   
    output wire     [FIFO_WIDTH*9-1:0]      data_combination1  , 
    output wire     [FIFO_WIDTH*9-1:0]      data_combination2  , 
    output wire     [FIFO_WIDTH*9-1:0]      data_combination3  , 
    output wire     [FIFO_WIDTH*9-1:0]      data_combination4  , 
    output wire     [FIFO_WIDTH*9-1:0]      data_combination5  , 
    output wire     [FIFO_WIDTH*9-1:0]      data_combination6  , 
    output wire     [FIFO_WIDTH*9-1:0]      data_combination7  , 
    output wire     [FIFO_WIDTH*9-1:0]      data_combination8  , 
    output wire     [FIFO_WIDTH*9-1:0]      data_combination9  , 
    output wire     [FIFO_WIDTH*9-1:0]      data_combination10 , 
    output wire     [FIFO_WIDTH*9-1:0]      data_combination11 , 
    output wire     [FIFO_WIDTH*9-1:0]      data_combination12 , 
    output wire     [FIFO_WIDTH*9-1:0]      data_combination13 , 
    output wire     [FIFO_WIDTH*9-1:0]      data_combination14 , 
    output wire     [FIFO_WIDTH*9-1:0]      data_combination15 , 
    output wire     [FIFO_WIDTH*9-1:0]      data_combination16  
);


Matrix_Generate_3X3
#(
    .FIFO_WIDTH (16          ),
    .IMG_HDISP  (IMG_HDISP     ),           
    .IMG_VDISP  (IMG_VDISP    ),
    .DELAY_NUM  (10          )      
)
u1_l2_Matrix_3X3(
    .clk     (clk            ) ,
    .rst_n   (rst_n         ) ,
    
    .pre_vsync (pre_vsync      ) ,   
    .pre_href  (pre_href       ) ,   
    .pre_data  (pre_data1    ) ,   
    
    .matrix_h_cnt           (matrix_h_cnt    ),
    .matrix_v_cnt           (matrix_v_cnt    ),
    .matrix_vsync           (matrix_vsync    ),      
    .matrix_href            (matrix_href     ),     
    .data_combination       (data_combination1        )
);


Matrix_Generate_3X3
#(
    .FIFO_WIDTH (16          ),
    .IMG_HDISP  (IMG_HDISP     ),           
    .IMG_VDISP  (IMG_VDISP    ),
    .DELAY_NUM  (10          )      
)
u2_l2_Matrix_3X3(
    .clk     (clk            ) ,
    .rst_n   (rst_n         ) ,
    
    .pre_vsync (pre_vsync      ) ,   
    .pre_href  (pre_href       ) ,   
    .pre_data  (pre_data2    ) ,   
    
    .data_combination       (data_combination2        )
);

Matrix_Generate_3X3
#(
    .FIFO_WIDTH (16          ),
    .IMG_HDISP  (IMG_HDISP     ),           
    .IMG_VDISP  (IMG_VDISP    ),
    .DELAY_NUM  (10          )      
)
u3_l2_Matrix_3X3(
    .clk     (clk            ) ,
    .rst_n   (rst_n         ) ,
    
    .pre_vsync (pre_vsync      ) ,   
    .pre_href  (pre_href       ) ,   
    .pre_data  (pre_data3    ) ,   
    
    .data_combination       (data_combination3        )
);

Matrix_Generate_3X3
#(
    .FIFO_WIDTH (16          ),
    .IMG_HDISP  (IMG_HDISP     ),           
    .IMG_VDISP  (IMG_VDISP    ),
    .DELAY_NUM  (10          )      
)
u4_l2_Matrix_3X3(
    .clk     (clk            ) ,
    .rst_n   (rst_n         ) ,
    
    .pre_vsync (pre_vsync      ) ,   
    .pre_href  (pre_href       ) ,   
    .pre_data  (pre_data4    ) ,   
    
    .data_combination       (data_combination4        )
);

Matrix_Generate_3X3
#(
    .FIFO_WIDTH (16          ),
    .IMG_HDISP  (IMG_HDISP     ),           
    .IMG_VDISP  (IMG_VDISP    ),
    .DELAY_NUM  (10          )      
)
u5_l2_Matrix_3X3(
    .clk     (clk            ) ,
    .rst_n   (rst_n         ) ,
    
    .pre_vsync (pre_vsync      ) ,   
    .pre_href  (pre_href       ) ,   
    .pre_data  (pre_data5    ) ,   
    
    .data_combination       (data_combination5        )
);

Matrix_Generate_3X3
#(
    .FIFO_WIDTH (16          ),
    .IMG_HDISP  (IMG_HDISP     ),           
    .IMG_VDISP  (IMG_VDISP    ),
    .DELAY_NUM  (10          )      
)
u6_l2_Matrix_3X3(
    .clk     (clk            ) ,
    .rst_n   (rst_n         ) ,
    
    .pre_vsync (pre_vsync      ) ,   
    .pre_href  (pre_href       ) ,   
    .pre_data  (pre_data6    ) ,   
    
    .data_combination       (data_combination6        )
);

Matrix_Generate_3X3
#(
    .FIFO_WIDTH (16          ),
    .IMG_HDISP  (IMG_HDISP     ),           
    .IMG_VDISP  (IMG_VDISP    ),
    .DELAY_NUM  (10          )      
)
u7_l2_Matrix_3X3(
    .clk     (clk            ) ,
    .rst_n   (rst_n         ) ,
    
    .pre_vsync (pre_vsync      ) ,   
    .pre_href  (pre_href       ) ,   
    .pre_data  (pre_data7    ) ,   
    
    .data_combination       (data_combination7        )
);

Matrix_Generate_3X3
#(
    .FIFO_WIDTH (16          ),
    .IMG_HDISP  (IMG_HDISP     ),           
    .IMG_VDISP  (IMG_VDISP    ),
    .DELAY_NUM  (10          )      
)
u8_l2_Matrix_3X3(
    .clk     (clk            ) ,
    .rst_n   (rst_n         ) ,
    
    .pre_vsync (pre_vsync      ) ,   
    .pre_href  (pre_href       ) ,   
    .pre_data  (pre_data8    ) ,   
    
    .data_combination       (data_combination8        )
);

Matrix_Generate_3X3
#(
    .FIFO_WIDTH (16          ),
    .IMG_HDISP  (IMG_HDISP     ),           
    .IMG_VDISP  (IMG_VDISP    ),
    .DELAY_NUM  (10          )      
)
u9_l2_Matrix_3X3(
    .clk     (clk            ) ,
    .rst_n   (rst_n         ) ,
    
    .pre_vsync (pre_vsync      ) ,   
    .pre_href  (pre_href       ) ,   
    .pre_data  (pre_data9    ) ,   
    
    .data_combination       (data_combination9        )
);

Matrix_Generate_3X3
#(
    .FIFO_WIDTH (16          ),
    .IMG_HDISP  (IMG_HDISP     ),           
    .IMG_VDISP  (IMG_VDISP    ),
    .DELAY_NUM  (10          )      
)
u10_l2_Matrix_3X3(
    .clk     (clk            ) ,
    .rst_n   (rst_n         ) ,
    
    .pre_vsync (pre_vsync      ) ,   
    .pre_href  (pre_href       ) ,   
    .pre_data  (pre_data10    ) ,   
    
    .data_combination       (data_combination10        )
);

Matrix_Generate_3X3
#(
    .FIFO_WIDTH (16          ),
    .IMG_HDISP  (IMG_HDISP     ),           
    .IMG_VDISP  (IMG_VDISP    ),
    .DELAY_NUM  (10          )      
)
u11_l2_Matrix_3X3(
    .clk     (clk            ) ,
    .rst_n   (rst_n         ) ,
    
    .pre_vsync (pre_vsync      ) ,   
    .pre_href  (pre_href       ) ,   
    .pre_data  (pre_data11    ) ,   
    
    .data_combination       (data_combination11        )
);

Matrix_Generate_3X3
#(
    .FIFO_WIDTH (16          ),
    .IMG_HDISP  (IMG_HDISP     ),           
    .IMG_VDISP  (IMG_VDISP    ),
    .DELAY_NUM  (10          )      
)
u12_l2_Matrix_3X3(
    .clk     (clk            ) ,
    .rst_n   (rst_n         ) ,
    
    .pre_vsync (pre_vsync      ) ,   
    .pre_href  (pre_href       ) ,   
    .pre_data  (pre_data12    ) ,   
    
    .data_combination       (data_combination12        )
);

Matrix_Generate_3X3
#(
    .FIFO_WIDTH (16          ),
    .IMG_HDISP  (IMG_HDISP     ),           
    .IMG_VDISP  (IMG_VDISP    ),
    .DELAY_NUM  (10          )      
)
u13_l2_Matrix_3X3(
    .clk     (clk            ) ,
    .rst_n   (rst_n         ) ,
    
    .pre_vsync (pre_vsync      ) ,   
    .pre_href  (pre_href       ) ,   
    .pre_data  (pre_data13    ) ,   
    
    .data_combination       (data_combination13        )
);

Matrix_Generate_3X3
#(
    .FIFO_WIDTH (16          ),
    .IMG_HDISP  (IMG_HDISP     ),           
    .IMG_VDISP  (IMG_VDISP    ),
    .DELAY_NUM  (10          )      
)
u14_l2_Matrix_3X3(
    .clk     (clk            ) ,
    .rst_n   (rst_n         ) ,
    
    .pre_vsync (pre_vsync      ) ,   
    .pre_href  (pre_href       ) ,   
    .pre_data  (pre_data14    ) ,   
    
    .data_combination       (data_combination14        )
);

Matrix_Generate_3X3
#(
    .FIFO_WIDTH (16          ),
    .IMG_HDISP  (IMG_HDISP     ),           
    .IMG_VDISP  (IMG_VDISP    ),
    .DELAY_NUM  (10          )      
)
u15_l2_Matrix_3X3(
    .clk     (clk            ) ,
    .rst_n   (rst_n         ) ,
    
    .pre_vsync (pre_vsync      ) ,   
    .pre_href  (pre_href       ) ,   
    .pre_data  (pre_data15    ) ,   
    
    .data_combination       (data_combination15        )
);

Matrix_Generate_3X3
#(
    .FIFO_WIDTH (16          ),
    .IMG_HDISP  (IMG_HDISP     ),           
    .IMG_VDISP  (IMG_VDISP    ),
    .DELAY_NUM  (10          )      
)
u16_l2_Matrix_3X3(
    .clk     (clk            ) ,
    .rst_n   (rst_n         ) ,
    
    .pre_vsync (pre_vsync      ) ,   
    .pre_href  (pre_href       ) ,   
    .pre_data  (pre_data16    ) ,   
    
    .data_combination       (data_combination16        )
);

endmodule
