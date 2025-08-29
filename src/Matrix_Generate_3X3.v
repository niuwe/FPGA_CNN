module Matrix_Generate_3X3
#(
    parameter   [4:0]  FIFO_WIDTH = 5'd16,    
    parameter   [6:0]  IMG_HDISP  = 7'd64,           
    parameter   [6:0]  IMG_VDISP  = 7'd64,
    parameter   [6:0]  DELAY_NUM  = 7'd10              //  Interval period from the penultimate row to the last row
)
(
    //  global clock & reset
    input  wire                 clk                     ,
    input  wire                 rst_n                   ,
    
    //  Image data prepared to be processed
    input  wire                            pre_vsync           ,    
    input  wire                            pre_href            ,    
    input  wire     [FIFO_WIDTH-1:0]       pre_data            ,   
    
    // matrix_h_cnt,matrix_v_cnt output
    output reg     [6:0]        matrix_h_cnt                   ,
    output reg     [6:0]        matrix_v_cnt                   ,
    
    //  Image data has been processed
    output reg                  matrix_vsync            ,   //  processed Image data vsync valid signal
    output reg                  matrix_href             ,   //  processed Image data href vaild  signal
    output wire     [FIFO_WIDTH*9-1:0]      data_combination    
);
//----------------------------------------------------------------------

wire                            matrix_vsync_r          ;
wire                            matrix_href_r           ;

reg      [FIFO_WIDTH-1:0]       matrix_p11              ;   
reg      [FIFO_WIDTH-1:0]       matrix_p12              ;
reg      [FIFO_WIDTH-1:0]       matrix_p13              ;
reg      [FIFO_WIDTH-1:0]       matrix_p21              ;
reg      [FIFO_WIDTH-1:0]       matrix_p22              ;
reg      [FIFO_WIDTH-1:0]       matrix_p23              ;
reg      [FIFO_WIDTH-1:0]       matrix_p31              ;  
reg      [FIFO_WIDTH-1:0]       matrix_p32              ;
reg      [FIFO_WIDTH-1:0]       matrix_p33              ;
reg      [FIFO_WIDTH-1:0]       pre_data_r              ;  

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        pre_data_r <= 0;
    else
    begin
        pre_data_r <= pre_data ;
    end
end

//  href & vsync counter
reg             [10:0]          hcnt;

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        hcnt <= 11'b0;
    else
    begin
        if(pre_href == 1'b1)
            hcnt <= hcnt + 1'b1;
        else
            hcnt <= 11'b0;
    end
end

reg                             pre_href_dly;

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        pre_href_dly <= 1'b0;
    else
        pre_href_dly <= pre_href;
end

wire img_href_neg = ~pre_href & pre_href_dly;       //  falling edge of pre_href

reg             [10:0]          vcnt;

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        vcnt <= 11'b0;
    else
    begin
        if(pre_vsync == 1'b0)
            vcnt <= 11'b0;
        else if(img_href_neg == 1'b1)
            vcnt <= vcnt + 1'b1;
        else
            vcnt <= vcnt;
    end
end


always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        matrix_h_cnt <= 7'b0;
    else
    begin
        if(matrix_href_r == 1'b1)
            matrix_h_cnt <= matrix_h_cnt + 1'b1;
        else
            matrix_h_cnt <= 7'b0;
    end
end

reg                             matrix_href_dly;

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        matrix_href_dly <= 1'b0;
    else
        matrix_href_dly <= matrix_href_r;
end

wire matrix_href_neg = ~matrix_href_r & matrix_href_dly;      

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        matrix_v_cnt <= 7'b0;
    else
    begin
        if(matrix_vsync_r == 1'b0)
            matrix_v_cnt <= 7'b0;
        else if(matrix_href_neg == 1'b1)
            matrix_v_cnt <= matrix_v_cnt + 1'b1;
        else
            matrix_v_cnt <= matrix_v_cnt;
    end
end

always @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        matrix_vsync  <= 0 ;
        matrix_href   <= 0 ;
    end
    else begin
        matrix_vsync  <= matrix_vsync_r ;
        matrix_href   <= matrix_href_r  ;
    end
end
//----------------------------------------------------------------------
//  two fifo for raw data buffer
reg             [10:0]          extend_last_row_cnt;

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        extend_last_row_cnt <= 11'b0;
    else
    begin
        if((pre_href == 1'b1)&&(vcnt == IMG_VDISP - 1'b1)&&(hcnt == IMG_HDISP - 1'b1))
            extend_last_row_cnt <= 11'd1;
        else if((extend_last_row_cnt > 11'b0)&&(extend_last_row_cnt < DELAY_NUM + IMG_HDISP))
            extend_last_row_cnt <= extend_last_row_cnt + 1'b1;
        else
            extend_last_row_cnt <= 11'b0;
    end
end

wire extend_last_row_en = (extend_last_row_cnt > DELAY_NUM) ? 1'b1 : 1'b0;

wire                                       fifo1_wenb;
wire            [FIFO_WIDTH-1:0]           fifo1_wdata;
wire                                       fifo1_renb;
wire            [FIFO_WIDTH-1:0]           fifo1_rdata;

wire                                       fifo2_wenb;
wire            [FIFO_WIDTH-1:0]           fifo2_wdata;
wire                                       fifo2_renb;
wire            [FIFO_WIDTH-1:0]           fifo2_rdata;

assign fifo1_wenb  = pre_href;
assign fifo1_wdata = pre_data;
assign fifo1_renb  = pre_href & (vcnt > 11'b0) | extend_last_row_en;

assign fifo2_wenb  = pre_href & (vcnt > 11'b0);
assign fifo2_wdata = fifo1_rdata;
assign fifo2_renb  = pre_href & (vcnt > 11'b1) | extend_last_row_en;

sync_fifo
#(
    .C_FIFO_WIDTH   (FIFO_WIDTH    ),
    .C_FIFO_DEPTH   (IMG_HDISP+1   )
)
u1_sync_fifo
(
    .rst        (~rst_n     ),
    
    .clk        (clk        ),
    
    .wr_en      (fifo1_wenb ),
    .din        (fifo1_wdata), 
    .full       (           ),
    
    .rd_en      (fifo1_renb ),
    .dout       (fifo1_rdata),
    .empty      (           )
//    .data_count (           )
);

sync_fifo
#(
    .C_FIFO_WIDTH   (FIFO_WIDTH    ),
    .C_FIFO_DEPTH   (IMG_HDISP+1   )
)
u2_sync_fifo
(
    .rst        (~rst_n     ),
    
    .clk        (clk        ),

    
    .wr_en      (fifo2_wenb ),
    .din        (fifo2_wdata), 
    .full       (           ),
    
    .rd_en      (fifo2_renb ),
    .dout       (fifo2_rdata),
    .empty      (           )
//    .data_count (           )
);

//----------------------------------------------------------------------

wire                            matrix_top_edge_flag    ;   
wire                            matrix_bottom_edge_flag ;  
wire                            matrix_left_edge_flag   ;   
wire                            matrix_right_edge_flag  ;  

//  Read data from fifo
always @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        {matrix_p11, matrix_p12, matrix_p13} <= 24'h0;
        {matrix_p21, matrix_p22, matrix_p23} <= 24'h0;
        {matrix_p31, matrix_p32, matrix_p33} <= 24'h0;
    end
    else if(matrix_top_edge_flag ) begin    // up
        if(matrix_left_edge_flag)begin
            {matrix_p11, matrix_p12, matrix_p13} <= {{FIFO_WIDTH{1'b0}}, {FIFO_WIDTH{1'b0}}, {FIFO_WIDTH{1'b0}}};      
            {matrix_p21, matrix_p22, matrix_p23} <= {{FIFO_WIDTH{1'b0}}, matrix_p23, fifo1_rdata};      
            {matrix_p31, matrix_p32, matrix_p33} <= {{FIFO_WIDTH{1'b0}}, matrix_p33, pre_data};        
        end
        else if(matrix_right_edge_flag)begin
            {matrix_p11, matrix_p12, matrix_p13} <= {{FIFO_WIDTH{1'b0}}, {FIFO_WIDTH{1'b0}}, {FIFO_WIDTH{1'b0}}};      
            {matrix_p21, matrix_p22, matrix_p23} <= {matrix_p22, matrix_p23, {FIFO_WIDTH{1'b0}}};      
            {matrix_p31, matrix_p32, matrix_p33} <= {matrix_p32, matrix_p33, {FIFO_WIDTH{1'b0}}};
        end
        else begin
            {matrix_p11, matrix_p12, matrix_p13} <= {{FIFO_WIDTH{1'b0}}, {FIFO_WIDTH{1'b0}}, {FIFO_WIDTH{1'b0}}};      
            {matrix_p21, matrix_p22, matrix_p23} <= {matrix_p22, matrix_p23, fifo1_rdata};      
            {matrix_p31, matrix_p32, matrix_p33} <= {matrix_p32, matrix_p33, pre_data};
        end
    end
    else if(matrix_bottom_edge_flag ) begin    // bottom
        if(matrix_left_edge_flag)begin
            {matrix_p11, matrix_p12, matrix_p13} <= {{FIFO_WIDTH{1'b0}}, matrix_p13, fifo2_rdata};      
            {matrix_p21, matrix_p22, matrix_p23} <= {{FIFO_WIDTH{1'b0}}, matrix_p23, fifo1_rdata};      
            {matrix_p31, matrix_p32, matrix_p33} <= {{FIFO_WIDTH{1'b0}}, {FIFO_WIDTH{1'b0}}, {FIFO_WIDTH{1'b0}}};        
        end
        else if(matrix_right_edge_flag)begin
            {matrix_p11, matrix_p12, matrix_p13} <= {matrix_p12, matrix_p13, {FIFO_WIDTH{1'b0}}};      
            {matrix_p21, matrix_p22, matrix_p23} <= {matrix_p22, matrix_p23, {FIFO_WIDTH{1'b0}}};      
            {matrix_p31, matrix_p32, matrix_p33} <= {{FIFO_WIDTH{1'b0}}, {FIFO_WIDTH{1'b0}}, {FIFO_WIDTH{1'b0}}};
        end
        else begin
            {matrix_p11, matrix_p12, matrix_p13} <= {matrix_p12, matrix_p13, fifo2_rdata};      
            {matrix_p21, matrix_p22, matrix_p23} <= {matrix_p22, matrix_p23, fifo1_rdata};      
            {matrix_p31, matrix_p32, matrix_p33} <= {{FIFO_WIDTH{1'b0}}, {FIFO_WIDTH{1'b0}}, {FIFO_WIDTH{1'b0}}};
        end
    end
    else if(matrix_left_edge_flag)begin //left
            {matrix_p11, matrix_p12, matrix_p13} <= {{FIFO_WIDTH{1'b0}}, matrix_p13, fifo2_rdata};      
            {matrix_p21, matrix_p22, matrix_p23} <= {{FIFO_WIDTH{1'b0}}, matrix_p23, fifo1_rdata};      
            {matrix_p31, matrix_p32, matrix_p33} <= {{FIFO_WIDTH{1'b0}}, matrix_p33, pre_data}; 
    end
    else if(matrix_right_edge_flag)begin //right
            {matrix_p11, matrix_p12, matrix_p13} <= {matrix_p12, matrix_p13, {FIFO_WIDTH{1'b0}}};      
            {matrix_p21, matrix_p22, matrix_p23} <= {matrix_p22, matrix_p23, {FIFO_WIDTH{1'b0}}};      
            {matrix_p31, matrix_p32, matrix_p33} <= {matrix_p32, matrix_p33, {FIFO_WIDTH{1'b0}}}; 
    end
    else begin
        {matrix_p11, matrix_p12, matrix_p13} <= {matrix_p12, matrix_p13, fifo2_rdata};      //  1st row input
        {matrix_p21, matrix_p22, matrix_p23} <= {matrix_p22, matrix_p23, fifo1_rdata};      //  2nd row input
        {matrix_p31, matrix_p32, matrix_p33} <= {matrix_p32, matrix_p33, pre_data};        //  3rd row input
    end
end

reg                             extend_last_row_en_dly;

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        extend_last_row_en_dly <= 1'b0;
    else
        extend_last_row_en_dly <= extend_last_row_en;
end

reg             [1:0]           vsync;
reg             [1:0]           href;
reg             [1:0]           top_edge_flag;
reg             [1:0]           bottom_edge_flag;
reg             [1:0]           left_edge_flag;
reg             [1:0]           right_edge_flag;

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        vsync <= 2'b0;
    else
    begin
        if((pre_href == 1'b1)&&(vcnt == 11'd1)&&(hcnt == 11'b0))
            vsync[0] <= 1'b1;
        else if((extend_last_row_en == 1'b0)&&(extend_last_row_en_dly == 1'b1))
            vsync[0] <= 1'b0;
        else
            vsync[0] <= vsync[0];
        vsync[1] <= vsync[0];
    end
end

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        href             <= 2'b0;
        top_edge_flag    <= 2'b0;
        bottom_edge_flag <= 2'b0;
        left_edge_flag   <= 2'b0;
        right_edge_flag  <= 2'b0;
    end
    else
    begin
        href[0]             <= pre_href & (vcnt > 11'b0) | extend_last_row_en;
        href[1]             <= href[0];
        top_edge_flag[0]    <= pre_href & (vcnt == 11'd1);
        top_edge_flag[1]    <= top_edge_flag[0];
        bottom_edge_flag[0] <= extend_last_row_en;
        bottom_edge_flag[1] <= bottom_edge_flag[0];
        left_edge_flag[0]   <= pre_href & (vcnt > 11'b0) & (hcnt == 11'b0) | (extend_last_row_cnt == DELAY_NUM + 1'b1);
        left_edge_flag[1]   <= left_edge_flag[0];
        right_edge_flag[0]  <= pre_href & (vcnt > 11'b0) & (hcnt == IMG_HDISP - 1'b1) | (extend_last_row_cnt == DELAY_NUM + IMG_HDISP);
        right_edge_flag[1]  <= right_edge_flag[0];
    end
end

//assign matrix_vsync_r          = vsync[1];
//assign matrix_href_r           = href[1];
//assign matrix_top_edge_flag    = top_edge_flag[1];
//assign matrix_bottom_edge_flag = bottom_edge_flag[1];
//assign matrix_left_edge_flag   = left_edge_flag[1];
//assign matrix_right_edge_flag  = right_edge_flag[1];
assign matrix_vsync_r          = vsync[0];
assign matrix_href_r           = href[0];
assign matrix_top_edge_flag    = top_edge_flag[0];
assign matrix_bottom_edge_flag = bottom_edge_flag[0];
assign matrix_left_edge_flag   = left_edge_flag[0];
assign matrix_right_edge_flag  = right_edge_flag[0];
assign data_combination        = {matrix_p11, matrix_p12, matrix_p13, 
                                  matrix_p21, matrix_p22, matrix_p23,
                                  matrix_p31, matrix_p32, matrix_p33 };
endmodule