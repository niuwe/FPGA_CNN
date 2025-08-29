`timescale 1ns / 1ps

module max_pool
#(
    parameter FIFO_WIDTH = 'd16  ,
    parameter FIFO_DEPTH = 'd4   
)(
    input    clk   ,
    input    rst_n ,
    
    input    [6:0]   relu_h_cnt ,
    input    [6:0]   relu_v_cnt ,
    input            pre_vsync  ,
    input            pre_href   ,
    input    [15:0]  pre_data   ,
    
    output    wire          pool_done  ,
    
    output    reg   [6:0]   pool_h_cnt ,
    output    reg   [6:0]   pool_v_cnt ,
    
    output    reg           pool_vsync ,
    output    reg           pool_href  ,
    output    reg   [15:0]  pool_data  
);


reg     [15:0]      pre_data_1dly;
reg                 pre_vsync_r  ;
reg                 pre_href_r   ; 
reg     [6:0]       relu_v_cnt_r ;
reg     [6:0]       pool_h_cnt_r ;
reg     [6:0]       pool_v_cnt_r ;
reg                 pool_vsync_r ;
reg     [4:0]       wait_cnt    ;
reg                 cnt_flag    ;
reg                 wait_done   ;
reg                 fifo1_wenb  ;
reg                 fifo1_renb  ;

wire    [15:0]      fifo1_rdata    ;
wire    [15:0]      fifo1_wdata    ;
wire                neg_pool_vsync ;
wire    [15:0]      max1           ;
wire                neg_pre_href   ;

assign      neg_pool_vsync = pool_vsync_r && !pool_vsync ;
assign      neg_pre_href =  !pre_href && pre_href_r ; 
assign      fifo1_wdata = max1  ;
assign      pool_done = wait_done ;
assign      max1 = (pre_data_1dly >= pre_data)?pre_data_1dly:pre_data;



//delay one clock cycle-------------------//
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        pre_href_r   <= 0 ;
        relu_v_cnt_r <= 0 ;
        pool_vsync_r <= 0 ;
    end
    else begin
        pool_vsync_r <= pool_vsync ;
        pre_href_r   <= pre_href   ;
        relu_v_cnt_r <= relu_v_cnt ;
    end
end
//-------------end------------------------//


//Generating    pool_v_cnt and pool_h_cnt------------------------//
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        pool_h_cnt_r <= 0 ;
    end
    else if(pre_href)begin
        if(relu_h_cnt[0])
            pool_h_cnt_r <= pool_h_cnt_r + 1 ;
        else
            pool_h_cnt_r <= pool_h_cnt_r ;
    end
    else
        pool_h_cnt_r <= 0;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        pool_v_cnt_r <= 0 ;
    end
    else if(pre_vsync)begin
        if(relu_v_cnt[0] && neg_pre_href)
            pool_v_cnt_r <= pool_v_cnt_r + 1 ;
        else
            pool_v_cnt_r <= pool_v_cnt_r ;
    end
    else
        pool_v_cnt_r <= 0;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        pool_v_cnt <= 0 ;
        pool_h_cnt <= 0 ;
    end
    else begin
        pool_v_cnt <= pool_v_cnt_r ;
        pool_h_cnt <= pool_h_cnt_r ;
    end

end
///////end-------------------------------------//

//delay 2 clock cycle,interleave valid---------//
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        pool_vsync <= 0 ;
        pre_vsync_r<= 0 ;
    end
    else begin 
        pre_vsync_r <= pre_vsync      ;
        pool_vsync  <=  pre_vsync_r   ;
    end
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        pool_href  <= 0 ;
        pre_href_r <= 0 ;
    end
    else begin 
        pre_href_r  <= pre_href   ;
        if(relu_v_cnt_r[0] )
            pool_href  <= pre_href_r  ;
        else
            pool_href <= 0;
    end
end
//////////end-----------------------////////


//delay 1 clock cycle
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        pre_data_1dly <= 0 ;
    end
    else 
        pre_data_1dly <= pre_data ;
end


always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        fifo1_wenb <= 0 ;
    end
    
    else if(relu_h_cnt[0] && ~relu_v_cnt[0] ) begin
        fifo1_wenb <= 1 ;
    end 
    else
        fifo1_wenb <= 0 ;    
end


always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        fifo1_renb <= 0 ;
    end
    
    else if(relu_h_cnt[0] && relu_v_cnt[0] ) begin
        fifo1_renb <= 1 ;
    end 
    else
        fifo1_renb <= 0 ;    
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        pool_data <= 0 ;
    end
    else if(fifo1_renb)
        if(fifo1_rdata >= max1 )
            pool_data <= fifo1_rdata ;
        else 
            pool_data <= max1 ;
    else
        pool_data <= pool_data ;
end


always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        wait_done <= 0;
    end
    else if(wait_cnt == 31)
        wait_done <= 1 ;
    else
        wait_done <= 0 ; 
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        cnt_flag <= 0;
    end
    else if(neg_pool_vsync)
        cnt_flag <= 1 ;
    else if(wait_cnt == 31)
        cnt_flag <= 0 ;
    else
        cnt_flag <= cnt_flag ; 
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        wait_cnt <= 0;
    end
    else if(cnt_flag)
        wait_cnt <= wait_cnt + 1;
    else
        wait_cnt <= 0 ;
end


sync_fifo
#(
    .C_FIFO_WIDTH   (FIFO_WIDTH   ),
    .C_FIFO_DEPTH   (FIFO_DEPTH+1 )
)
u1_sync_fifo
(
    .rst        (~rst_n     ) ,
    .clk        (clk        ) ,
    
    .wr_en      (fifo1_wenb ) ,
    .din        (fifo1_wdata) , 
    .full       (           ) ,
    
    .rd_en      (fifo1_renb ) ,
    .dout       (fifo1_rdata) ,
    .empty      (           ) ,
    .data_count (           )
);


endmodule