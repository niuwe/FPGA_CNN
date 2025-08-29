`timescale 1ns / 1ps

module layer1_feature_map#(
    parameter FM_WIDTH    = 'd4  ,
    parameter FM_HEIGHT   = 'd4  
)(
    input   clk     ,
    input   rst_n   ,
    
    input           fm_wea     ,
    input           start_output,
    input           pre_vsync   ,
    input           pre_href    ,
    input   [15:0]  pre_data    ,
    
    output   reg         save_fm_acmp ,
    output               end_output   ,
    output   reg         post_vsync   ,
    output   reg         post_href    ,
    output   [15:0]      post_data    
);

reg              clk_2d = 0  ;   //Two frequency division
reg     [6:0]    fm_h_cnt    ;
reg     [6:0]    fm_v_cnt    ;
reg     [3:0]    fm_hblk_cnt ;  //horizontal blanking counter

reg           pre_vsync_r   ;
reg           pre_href_r    ;
reg   [15:0]  pre_data_r    ;
reg           post_vsync_r   ;
reg           post_vsync_1dly;
reg           post_href_r    ;
reg   [9:0]   addra       ;
reg   [9:0]   addrb       ;
wire          fm_hblk     ;

reg           fm_wea_r    ;

assign      end_output = post_vsync_1dly && !post_vsync;

always @(posedge clk ) begin
    clk_2d <= !clk_2d ;
end

always @(posedge clk_2d or negedge rst_n) begin
    if(!rst_n) begin
        save_fm_acmp <= 0 ; 
    end
    else if(fm_wea_r && !fm_wea)begin
        save_fm_acmp <= 1;
    end
    else
        save_fm_acmp <= 0;
end

//sync 
always @(posedge clk_2d or negedge rst_n) begin
    if(!rst_n) begin
        pre_vsync_r <= 0 ;
        pre_href_r  <= 0 ;
        pre_data_r  <= 0 ;
        fm_wea_r    <= 0 ;
    end
    else  begin
        pre_vsync_r <=   pre_vsync   ;
        pre_href_r  <=   pre_href    ;
        pre_data_r  <=   pre_data    ;
        fm_wea_r    <=   fm_wea      ;
    end
end


always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        post_vsync  <= 0 ;
        post_href   <= 0 ;
        post_vsync_1dly <= 0 ;
    end
    else  begin
        post_href   <=   post_href_r ;
        post_vsync  <=   post_vsync_r;
        post_vsync_1dly <= post_vsync ;
    end
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        post_vsync_r <= 0 ; 
    end
    else if(fm_v_cnt == FM_HEIGHT)begin
        post_vsync_r <= 0;
    end
    else if(start_output) begin
        post_vsync_r <=  1 ; 
    end
    else
        post_vsync_r <= post_vsync_r ;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        fm_v_cnt <= 0 ;
    end
    else if(post_vsync_r)begin
        if(fm_h_cnt == FM_WIDTH-2)
            fm_v_cnt <= fm_v_cnt + 1 ;
        else 
            fm_v_cnt <= fm_v_cnt ;
    end
    else 
        fm_v_cnt <= 0 ;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        post_href_r <= 0 ;
    end
    else if(start_output || fm_hblk_cnt == 15)begin
        post_href_r <= 1;
    end
    else if(fm_h_cnt == FM_WIDTH-1)begin
        post_href_r <= 0 ;
    end
    else
        post_href_r <= post_href_r ;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        fm_h_cnt <= 0 ;
    end
    else if(post_href_r)begin
        fm_h_cnt <= fm_h_cnt + 1 ;
    end
    else
        fm_h_cnt <= 0 ;
end

assign fm_hblk = post_vsync_r && !post_href_r ;


always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        fm_hblk_cnt <= 0 ;
    end
    else if(fm_hblk )begin
        fm_hblk_cnt <= fm_hblk_cnt + 1 ;
    end
    else
        fm_hblk_cnt <= 0 ;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        
    end
end


always @(posedge clk_2d or negedge rst_n) begin
    if(!rst_n) begin
        addra <= 0 ;
    end
    else if(pre_href_r)begin
        if(addra == FM_WIDTH*FM_HEIGHT-1 || !fm_wea)
            addra <= 0 ;
        else
            addra <= addra + 1 ;
    end
    else
        addra <= addra ;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        addrb <= 0 ;
    end
    else if(post_href_r)begin
        if(addrb == FM_WIDTH*FM_HEIGHT-1)
            addrb <= 0 ;
        else
            addrb <= addrb + 1 ;
    end
    else
        addrb <= addrb ;
end


layer1_fm_sdram u_layer1_fm_sdram (
  .clka     (clk_2d         ),    
  .wea      (fm_wea         ),      
  .addra    (addra          ),  
  .dina     (pre_data_r     ),  
  .ena      (pre_href_r     ),
   
  .clkb     (clk            ), 
  .enb      (post_href_r    ),  
  .addrb    (addrb          ),  
  .doutb    (post_data      )  
);
endmodule
