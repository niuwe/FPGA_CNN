`timescale 1ns / 1ps

module layer1_relu#(
    parameter   PRE_BIT_WIDTH  = 'd32
)(
    input clk   ,
    input rst_n ,
    
    input   [6:0]   conv_h_cnt ,
    input   [6:0]   conv_v_cnt ,
    
    input                               pre_vsync ,
    input                               pre_href  ,
    input   signed [PRE_BIT_WIDTH-1:0]  pre_data1   ,
    input   signed [PRE_BIT_WIDTH-1:0]  pre_data2   ,
    input   signed [PRE_BIT_WIDTH-1:0]  pre_data3   ,
    input   signed [PRE_BIT_WIDTH-1:0]  pre_data4   ,
    input   signed [PRE_BIT_WIDTH-1:0]  pre_data5   ,
    input   signed [PRE_BIT_WIDTH-1:0]  pre_data6   ,
    input   signed [PRE_BIT_WIDTH-1:0]  pre_data7   ,
    input   signed [PRE_BIT_WIDTH-1:0]  pre_data8   ,
    input   signed [PRE_BIT_WIDTH-1:0]  pre_data9   ,
    input   signed [PRE_BIT_WIDTH-1:0]  pre_data10  ,
    input   signed [PRE_BIT_WIDTH-1:0]  pre_data11  ,
    input   signed [PRE_BIT_WIDTH-1:0]  pre_data12  ,
    input   signed [PRE_BIT_WIDTH-1:0]  pre_data13  ,
    input   signed [PRE_BIT_WIDTH-1:0]  pre_data14  ,
    input   signed [PRE_BIT_WIDTH-1:0]  pre_data15  ,
    input   signed [PRE_BIT_WIDTH-1:0]  pre_data16  ,

    output     [6:0]   relu_h_cnt ,
    output     [6:0]   relu_v_cnt ,
    output              relu_vsync ,
    output              relu_href  ,
    output    [15:0]    relu_data1  ,
    output    [15:0]    relu_data2  ,
    output    [15:0]    relu_data3  ,
    output    [15:0]    relu_data4  ,
    output    [15:0]    relu_data5  ,
    output    [15:0]    relu_data6  ,
    output    [15:0]    relu_data7  ,
    output    [15:0]    relu_data8  ,
    output    [15:0]    relu_data9  ,
    output    [15:0]    relu_data10  ,
    output    [15:0]    relu_data11  ,
    output    [15:0]    relu_data12  ,
    output    [15:0]    relu_data13  ,
    output    [15:0]    relu_data14  ,
    output    [15:0]    relu_data15  ,
    output    [15:0]    relu_data16  
);


ReLU #(
    .PRE_BIT_WIDTH(PRE_BIT_WIDTH      )
)ReLU1_1(
    .clk   (clk            ),
    .rst_n (rst_n     ),
    
    .conv_h_cnt (conv_h_cnt     ),
    .conv_v_cnt (conv_v_cnt     ),
    .pre_vsync  (pre_vsync     ),
    .pre_href   (pre_href      ),
    .pre_data   (pre_data1      ),  //signed [31:0]
    
    .relu_h_cnt (relu_h_cnt    ),
    .relu_v_cnt (relu_v_cnt    ),
    .relu_vsync (relu_vsync    ),
    .relu_href  (relu_href     ),
    .relu_data  (relu_data1    )    //[15:0]
);

ReLU #(
    .PRE_BIT_WIDTH(PRE_BIT_WIDTH      )
)ReLU1_2(
    .clk   (clk            ),
    .rst_n (rst_n     ),
    
    .conv_h_cnt (conv_h_cnt     ),
    .conv_v_cnt (conv_v_cnt     ),
    .pre_vsync  (pre_vsync     ),
    .pre_href   (pre_href      ),
    .pre_data   (pre_data2 ),  

    .relu_data  (relu_data2    )   
);

ReLU #(
    .PRE_BIT_WIDTH(PRE_BIT_WIDTH      )
)ReLU1_3(
    .clk   (clk            ),
    .rst_n (rst_n     ),
    
    .conv_h_cnt (conv_h_cnt     ),
    .conv_v_cnt (conv_v_cnt     ),
    .pre_vsync  (pre_vsync     ),
    .pre_href   (pre_href      ),
    .pre_data   (pre_data3 ), 
    
    .relu_data  (relu_data3    )
);

ReLU #(
    .PRE_BIT_WIDTH(PRE_BIT_WIDTH      )
)ReLU1_4(
    .clk   (clk            ),
    .rst_n (rst_n     ),
    
    .conv_h_cnt (conv_h_cnt     ),
    .conv_v_cnt (conv_v_cnt     ),
    .pre_vsync  (pre_vsync     ),
    .pre_href   (pre_href      ),
    .pre_data   (pre_data4 ), 
    
    .relu_data  (relu_data4    )
);

ReLU #(
    .PRE_BIT_WIDTH(PRE_BIT_WIDTH      )
)ReLU1_5(
    .clk   (clk            ),
    .rst_n (rst_n     ),
    
    .conv_h_cnt (conv_h_cnt     ),
    .conv_v_cnt (conv_v_cnt     ),
    .pre_vsync  (pre_vsync     ),
    .pre_href   (pre_href      ),
    .pre_data   (pre_data5 ), 
    
    .relu_data  (relu_data5    )
);

ReLU #(
    .PRE_BIT_WIDTH(PRE_BIT_WIDTH      )
)ReLU1_6(
    .clk   (clk            ),
    .rst_n (rst_n     ),
    
    .conv_h_cnt (conv_h_cnt     ),
    .conv_v_cnt (conv_v_cnt     ),
    .pre_vsync  (pre_vsync     ),
    .pre_href   (pre_href      ),
    .pre_data   (pre_data6 ), 
    
    .relu_data  (relu_data6    )
);

ReLU #(
    .PRE_BIT_WIDTH(PRE_BIT_WIDTH      )
)ReLU1_7(
    .clk   (clk            ),
    .rst_n (rst_n     ),
    
    .conv_h_cnt (conv_h_cnt     ),
    .conv_v_cnt (conv_v_cnt     ),
    .pre_vsync  (pre_vsync     ),
    .pre_href   (pre_href      ),
    .pre_data   (pre_data7 ), 
    
    .relu_data  (relu_data7    )
);

ReLU #(
    .PRE_BIT_WIDTH(PRE_BIT_WIDTH      )
)ReLU1_8(
    .clk   (clk            ),
    .rst_n (rst_n     ),
    
    .conv_h_cnt (conv_h_cnt     ),
    .conv_v_cnt (conv_v_cnt     ),
    .pre_vsync  (pre_vsync     ),
    .pre_href   (pre_href      ),
    .pre_data   (pre_data8 ), 
    
    .relu_data  (relu_data8    )
);

ReLU #(
    .PRE_BIT_WIDTH(PRE_BIT_WIDTH      )
)ReLU1_9(
    .clk   (clk            ),
    .rst_n (rst_n     ),
    
    .conv_h_cnt (conv_h_cnt     ),
    .conv_v_cnt (conv_v_cnt     ),
    .pre_vsync  (pre_vsync     ),
    .pre_href   (pre_href      ),
    .pre_data   (pre_data9 ), 
    
    .relu_data  (relu_data9    )
);

ReLU #(
    .PRE_BIT_WIDTH(PRE_BIT_WIDTH      )
)ReLU1_10(
    .clk   (clk            ),
    .rst_n (rst_n     ),
    
    .conv_h_cnt (conv_h_cnt     ),
    .conv_v_cnt (conv_v_cnt     ),
    .pre_vsync  (pre_vsync     ),
    .pre_href   (pre_href      ),
    .pre_data   (pre_data10      ), 
    
    .relu_data  (relu_data10    )
);

ReLU #(
    .PRE_BIT_WIDTH(PRE_BIT_WIDTH      )
)ReLU1_11(
    .clk   (clk            ),
    .rst_n (rst_n     ),
    
    .conv_h_cnt (conv_h_cnt     ),
    .conv_v_cnt (conv_v_cnt     ),
    .pre_vsync  (pre_vsync     ),
    .pre_href   (pre_href      ),
    .pre_data   (pre_data11      ), 
    
    .relu_data  (relu_data11    )
);

ReLU #(
    .PRE_BIT_WIDTH(PRE_BIT_WIDTH      )
)ReLU1_12(
    .clk   (clk            ),
    .rst_n (rst_n     ),
    
    .conv_h_cnt (conv_h_cnt     ),
    .conv_v_cnt (conv_v_cnt     ),
    .pre_vsync  (pre_vsync     ),
    .pre_href   (pre_href      ),
    .pre_data   (pre_data12      ), 
    
    .relu_data  (relu_data12    )
);

ReLU #(
    .PRE_BIT_WIDTH(PRE_BIT_WIDTH      )
)ReLU1_13(
    .clk   (clk            ),
    .rst_n (rst_n     ),
    
    .conv_h_cnt (conv_h_cnt     ),
    .conv_v_cnt (conv_v_cnt     ),
    .pre_vsync  (pre_vsync     ),
    .pre_href   (pre_href      ),
    .pre_data   (pre_data13      ), 
    
    .relu_data  (relu_data13    )
);

ReLU #(
    .PRE_BIT_WIDTH(PRE_BIT_WIDTH      )
)ReLU1_14(
    .clk   (clk            ),
    .rst_n (rst_n     ),
    
    .conv_h_cnt (conv_h_cnt     ),
    .conv_v_cnt (conv_v_cnt     ),
    .pre_vsync  (pre_vsync     ),
    .pre_href   (pre_href      ),
    .pre_data   (pre_data14      ), 
    
    .relu_data  (relu_data14    )
);

ReLU #(
    .PRE_BIT_WIDTH(PRE_BIT_WIDTH      )
)ReLU1_15(
    .clk   (clk            ),
    .rst_n (rst_n     ),
    
    .conv_h_cnt (conv_h_cnt     ),
    .conv_v_cnt (conv_v_cnt     ),
    .pre_vsync  (pre_vsync     ),
    .pre_href   (pre_href      ),
    .pre_data   (pre_data15      ), 
    
    .relu_data  (relu_data15    )
);

ReLU #(
    .PRE_BIT_WIDTH(PRE_BIT_WIDTH      )
)ReLU1_16(
    .clk   (clk            ),
    .rst_n (rst_n     ),
    
    .conv_h_cnt (conv_h_cnt     ),
    .conv_v_cnt (conv_v_cnt     ),
    .pre_vsync  (pre_vsync     ),
    .pre_href   (pre_href      ),
    .pre_data   (pre_data16      ), 
    
    .relu_data  (relu_data16    )
);

endmodule
