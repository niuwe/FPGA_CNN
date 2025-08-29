`timescale 1ns / 1ps


module CNN_net#(
    parameter WIDTH        = 'd64,
    parameter HEIGHT       = 'd64
)(
    input           clk         ,
    input           async_rst_n ,
    
    input   [7:0]   pre_data  ,
    input           pre_vsync ,
    input           pre_href  ,
    
    output  [15:0]  data      ,
    output          vsync     ,
    output          active    
);

reg              clk_2d = 0  ;   //Two frequency division

//The pooling layer will perform downsampling by half, and here the synchronization timing is synchronized.
always @(posedge clk ) begin
    clk_2d <= !clk_2d ;
end

reg rst_reg    ; 
reg sync_rst_n ; 

//Asynchronous reset
always @(posedge clk or negedge async_rst_n)begin
    if(!async_rst_n)begin
        rst_reg <= 0 ;
    end
    else begin
        rst_reg <= 1 ;
    end
end

// synchronous release
always @(posedge clk) begin
    sync_rst_n <= rst_reg; // 
end

//-----common conv parameter--------------------//
reg                    matrix_vsync  ;
reg                    matrix_href   ;
reg    [6:0]           matrix_h_cnt  ;
reg    [6:0]           matrix_v_cnt  ;
reg    [143:0]         matrix_data1  ;
reg    [143:0]         matrix_data2  ;
reg    [143:0]         matrix_data3  ;
reg    [143:0]         matrix_data4  ;
reg    [143:0]         matrix_data5  ;
reg    [143:0]         matrix_data6  ;
reg    [143:0]         matrix_data7  ;
reg    [143:0]         matrix_data8  ;
reg    [143:0]         matrix_data9  ;
reg    [143:0]         matrix_data10 ;
reg    [143:0]         matrix_data11 ;
reg    [143:0]         matrix_data12 ;
reg    [143:0]         matrix_data13 ;
reg    [143:0]         matrix_data14 ;
reg    [143:0]         matrix_data15 ;
reg    [143:0]         matrix_data16 ;
reg    [143:0]         matrix_data17 ;
reg    [143:0]         matrix_data18 ;
reg    [143:0]         matrix_data19 ;
reg    [143:0]         matrix_data20 ;
reg    [143:0]         matrix_data21 ;
reg    [143:0]         matrix_data22 ;
reg    [143:0]         matrix_data23 ;
reg    [143:0]         matrix_data24 ;
reg    [143:0]         matrix_data25 ;
reg    [143:0]         matrix_data26 ;
reg    [143:0]         matrix_data27 ;
reg    [143:0]         matrix_data28 ;
reg    [143:0]         matrix_data29 ;
reg    [143:0]         matrix_data30 ;
reg    [143:0]         matrix_data31 ;
reg    [143:0]         matrix_data32 ;
reg    [143:0]         conv_weight1  ;
reg    [143:0]         conv_weight2  ;
reg    [143:0]         conv_weight3  ;
reg    [143:0]         conv_weight4  ;
reg    [143:0]         conv_weight5  ;
reg    [143:0]         conv_weight6  ;
reg    [143:0]         conv_weight7  ;
reg    [143:0]         conv_weight8  ;
reg    [143:0]         conv_weight9  ;
reg    [143:0]         conv_weight10 ;
reg    [143:0]         conv_weight11 ;
reg    [143:0]         conv_weight12 ;
reg    [143:0]         conv_weight13 ;
reg    [143:0]         conv_weight14 ;
reg    [143:0]         conv_weight15 ;
reg    [143:0]         conv_weight16 ;
reg    [143:0]         conv_weight17 ;
reg    [143:0]         conv_weight18 ;
reg    [143:0]         conv_weight19 ;
reg    [143:0]         conv_weight20 ;
reg    [143:0]         conv_weight21 ;
reg    [143:0]         conv_weight22 ;
reg    [143:0]         conv_weight23 ;
reg    [143:0]         conv_weight24 ;
reg    [143:0]         conv_weight25 ;
reg    [143:0]         conv_weight26 ;
reg    [143:0]         conv_weight27 ;
reg    [143:0]         conv_weight28 ;
reg    [143:0]         conv_weight29 ;
reg    [143:0]         conv_weight30 ;
reg    [143:0]         conv_weight31 ;
reg    [143:0]         conv_weight32 ;

reg    signed   [15:0]          conv_bias1    ;
reg    signed   [15:0]          conv_bias2    ;
reg    signed   [15:0]          conv_bias3    ;
reg    signed   [15:0]          conv_bias4    ;
reg    signed   [15:0]          conv_bias5    ;
reg    signed   [15:0]          conv_bias6    ;
reg    signed   [15:0]          conv_bias7    ;
reg    signed   [15:0]          conv_bias8    ;
reg    signed   [15:0]          conv_bias9    ;
reg    signed   [15:0]          conv_bias10   ;
reg    signed   [15:0]          conv_bias11   ;
reg    signed   [15:0]          conv_bias12   ;
reg    signed   [15:0]          conv_bias13   ;
reg    signed   [15:0]          conv_bias14   ;
reg    signed   [15:0]          conv_bias15   ;
reg    signed   [15:0]          conv_bias16   ;
reg    signed   [15:0]          conv_bias17   ;
reg    signed   [15:0]          conv_bias18   ;
reg    signed   [15:0]          conv_bias19   ;
reg    signed   [15:0]          conv_bias20   ;
reg    signed   [15:0]          conv_bias21   ;
reg    signed   [15:0]          conv_bias22   ;
reg    signed   [15:0]          conv_bias23   ;
reg    signed   [15:0]          conv_bias24   ;
reg    signed   [15:0]          conv_bias25   ;
reg    signed   [15:0]          conv_bias26   ;
reg    signed   [15:0]          conv_bias27   ;
reg    signed   [15:0]          conv_bias28   ;
reg    signed   [15:0]          conv_bias29   ;
reg    signed   [15:0]          conv_bias30   ;
reg    signed   [15:0]          conv_bias31   ;
reg    signed   [15:0]          conv_bias32   ;


wire   [6:0]           conv_h_cnt   ;
wire   [6:0]           conv_v_cnt   ;
wire                   conv_href    ;
wire                   conv_vsync   ;
wire   signed  [31:0]  conv_rlt1    ;
wire   signed  [31:0]  conv_rlt2    ;
wire   signed  [31:0]  conv_rlt3    ;
wire   signed  [31:0]  conv_rlt4    ;
wire   signed  [31:0]  conv_rlt5    ;
wire   signed  [31:0]  conv_rlt6    ;
wire   signed  [31:0]  conv_rlt7    ;
wire   signed  [31:0]  conv_rlt8    ;
wire   signed  [31:0]  conv_rlt9    ;
wire   signed  [31:0]  conv_rlt10   ;
wire   signed  [31:0]  conv_rlt11   ;
wire   signed  [31:0]  conv_rlt12   ;
wire   signed  [31:0]  conv_rlt13   ;
wire   signed  [31:0]  conv_rlt14   ;
wire   signed  [31:0]  conv_rlt15   ;
wire   signed  [31:0]  conv_rlt16   ;
wire   signed  [31:0]  conv_rlt17   ;
wire   signed  [31:0]  conv_rlt18   ;
wire   signed  [31:0]  conv_rlt19   ;
wire   signed  [31:0]  conv_rlt20   ;
wire   signed  [31:0]  conv_rlt21   ;
wire   signed  [31:0]  conv_rlt22   ;
wire   signed  [31:0]  conv_rlt23   ;
wire   signed  [31:0]  conv_rlt24   ;
wire   signed  [31:0]  conv_rlt25   ;
wire   signed  [31:0]  conv_rlt26   ;
wire   signed  [31:0]  conv_rlt27   ;
wire   signed  [31:0]  conv_rlt28   ;
wire   signed  [31:0]  conv_rlt29   ;
wire   signed  [31:0]  conv_rlt30   ;
wire   signed  [31:0]  conv_rlt31   ;
wire   signed  [31:0]  conv_rlt32   ;
//////////------------end---------------------////


//-------------layer1 parameter-------------//
reg             l1_start_output  ;

wire            l1_pool_done   ;
wire    [6:0]   l1_pool_h_cnt  ;
wire    [6:0]   l1_pool_v_cnt  ;
wire            l1_pool_vsync  ;
wire            l1_pool_href   ;
wire    [15:0]  l1_pool_data1  ;
wire    [15:0]  l1_pool_data2  ;
wire    [15:0]  l1_pool_data3  ;
wire    [15:0]  l1_pool_data4  ;
wire    [15:0]  l1_pool_data5  ;
wire    [15:0]  l1_pool_data6  ;
wire    [15:0]  l1_pool_data7  ;
wire    [15:0]  l1_pool_data8  ;
wire    [15:0]  l1_pool_data9  ;
wire    [15:0]  l1_pool_data10 ;
wire    [15:0]  l1_pool_data11 ;
wire    [15:0]  l1_pool_data12 ;
wire    [15:0]  l1_pool_data13 ;
wire    [15:0]  l1_pool_data14 ;
wire    [15:0]  l1_pool_data15 ;
wire    [15:0]  l1_pool_data16 ;

wire            l1_fm_href      ;
wire            l1_fm_vsync     ;
wire            l1_end_output   ;
wire            l1_save_fm_acmp ;
wire    [15:0]  l1_fm_data1  ;
wire    [15:0]  l1_fm_data2  ;
wire    [15:0]  l1_fm_data3  ;
wire    [15:0]  l1_fm_data4  ;
wire    [15:0]  l1_fm_data5  ;
wire    [15:0]  l1_fm_data6  ;
wire    [15:0]  l1_fm_data7  ;
wire    [15:0]  l1_fm_data8  ;
wire    [15:0]  l1_fm_data9  ;
wire    [15:0]  l1_fm_data10 ;
wire    [15:0]  l1_fm_data11 ;
wire    [15:0]  l1_fm_data12 ;
wire    [15:0]  l1_fm_data13 ;
wire    [15:0]  l1_fm_data14 ;
wire    [15:0]  l1_fm_data15 ;
wire    [15:0]  l1_fm_data16 ;
reg             l1_fm_wea    ;

wire    [143:0]    pre_data_r      ;
wire    [6:0]      l1_matrix_h_cnt ;
wire    [6:0]      l1_matrix_v_cnt ;
wire               l1_matrix_vsync ;
wire               l1_matrix_href  ;
wire    [143:0]    l1_matrix_data  ;
// //------------------end---------------------//

// //layer2 parameter

wire     signed [15:0]  l2_conv_bias  ;


wire                l2_fm_vsync  ;
wire                l2_fm_href   ;
wire     [15:0]     l2_fm1_data  ;
wire     [15:0]     l2_fm2_data  ;
wire     [15:0]     l2_fm3_data  ;
wire     [15:0]     l2_fm4_data  ;
wire     [15:0]     l2_fm5_data  ;
wire     [15:0]     l2_fm6_data  ;
wire     [15:0]     l2_fm7_data  ;
wire     [15:0]     l2_fm8_data  ;
wire     [15:0]     l2_fm9_data  ;
wire     [15:0]     l2_fm10_data ;
wire     [15:0]     l2_fm11_data ;
wire     [15:0]     l2_fm12_data ;
wire     [15:0]     l2_fm13_data ;
wire     [15:0]     l2_fm14_data ;
wire     [15:0]     l2_fm15_data ;
wire     [15:0]     l2_fm16_data ;
wire     [15:0]     l2_fm17_data ;
wire     [15:0]     l2_fm18_data ;
wire     [15:0]     l2_fm19_data ;
wire     [15:0]     l2_fm20_data ;
wire     [15:0]     l2_fm21_data ;
wire     [15:0]     l2_fm22_data ;
wire     [15:0]     l2_fm23_data ;
wire     [15:0]     l2_fm24_data ;
wire     [15:0]     l2_fm25_data ;
wire     [15:0]     l2_fm26_data ;
wire     [15:0]     l2_fm27_data ;
wire     [15:0]     l2_fm28_data ;
wire     [15:0]     l2_fm29_data ;
wire     [15:0]     l2_fm30_data ;
wire     [15:0]     l2_fm31_data ;
wire     [15:0]     l2_fm32_data ;

wire                    l2_matrix_vsync ;
wire                    l2_matrix_href  ;
wire    [6:0]           l2_matrix_h_cnt ;
wire    [6:0]           l2_matrix_v_cnt ;
wire    [143:0]         l2_martix_data1 ;
wire    [143:0]         l2_martix_data2 ;
wire    [143:0]         l2_martix_data3 ;
wire    [143:0]         l2_martix_data4 ;
wire    [143:0]         l2_martix_data5 ;
wire    [143:0]         l2_martix_data6 ;
wire    [143:0]         l2_martix_data7 ;
wire    [143:0]         l2_martix_data8 ;
wire    [143:0]         l2_martix_data9 ;
wire    [143:0]         l2_martix_data10;
wire    [143:0]         l2_martix_data11;
wire    [143:0]         l2_martix_data12;
wire    [143:0]         l2_martix_data13;
wire    [143:0]         l2_martix_data14;
wire    [143:0]         l2_martix_data15;
wire    [143:0]         l2_martix_data16;

wire    [143:0]         l2_conv_weight1  ;
wire    [143:0]         l2_conv_weight2  ;
wire    [143:0]         l2_conv_weight3  ;
wire    [143:0]         l2_conv_weight4  ;
wire    [143:0]         l2_conv_weight5  ;
wire    [143:0]         l2_conv_weight6  ;
wire    [143:0]         l2_conv_weight7  ;
wire    [143:0]         l2_conv_weight8  ;
wire    [143:0]         l2_conv_weight9  ;
wire    [143:0]         l2_conv_weight10 ;
wire    [143:0]         l2_conv_weight11 ;
wire    [143:0]         l2_conv_weight12 ;
wire    [143:0]         l2_conv_weight13 ;
wire    [143:0]         l2_conv_weight14 ;
wire    [143:0]         l2_conv_weight15 ;
wire    [143:0]         l2_conv_weight16 ;

 wire            l2_save_fm1_acmp    ;
 wire            l2_save_fm2_acmp    ;
 wire            l2_save_fm3_acmp    ;
 wire            l2_save_fm4_acmp    ;
 wire            l2_save_fm5_acmp    ;
 wire            l2_save_fm6_acmp    ;
 wire            l2_save_fm7_acmp    ;
 wire            l2_save_fm8_acmp    ;
 wire            l2_save_fm9_acmp    ;
 wire            l2_save_fm10_acmp   ;
 wire            l2_save_fm11_acmp   ;
 wire            l2_save_fm12_acmp   ;
 wire            l2_save_fm13_acmp   ;
 wire            l2_save_fm14_acmp   ;
 wire            l2_save_fm15_acmp   ;
 wire            l2_save_fm16_acmp   ;
 wire            l2_save_fm17_acmp   ;
 wire            l2_save_fm18_acmp   ;
 wire            l2_save_fm19_acmp   ;
 wire            l2_save_fm20_acmp   ;
 wire            l2_save_fm21_acmp   ;
 wire            l2_save_fm22_acmp   ;
 wire            l2_save_fm23_acmp   ;
 wire            l2_save_fm24_acmp   ;
 wire            l2_save_fm25_acmp   ;
 wire            l2_save_fm26_acmp   ;
 wire            l2_save_fm27_acmp   ;
 wire            l2_save_fm28_acmp   ;
 wire            l2_save_fm29_acmp   ;
 wire            l2_save_fm30_acmp   ;
 wire            l2_save_fm31_acmp   ;
 wire            l2_save_fm32_acmp   ;

reg              l2_start_output ;
wire             l2_end_output   ;
reg     [5:0]    l2_weg_addr     ;
reg     [32:0]   l2_fm_ram_wea   ;



// //----------layer3 parameter-------------------//
wire     signed     [15:0]  l3_conv_bias    ;

wire     [143:0]    l3_conv_weight1     ;
wire     [143:0]    l3_conv_weight2     ;
wire     [143:0]    l3_conv_weight3     ;
wire     [143:0]    l3_conv_weight4     ;
wire     [143:0]    l3_conv_weight5     ;
wire     [143:0]    l3_conv_weight6     ;
wire     [143:0]    l3_conv_weight7     ;
wire     [143:0]    l3_conv_weight8     ;
wire     [143:0]    l3_conv_weight9     ;
wire     [143:0]    l3_conv_weight10    ;
wire     [143:0]    l3_conv_weight11    ;
wire     [143:0]    l3_conv_weight12    ;
wire     [143:0]    l3_conv_weight13    ;
wire     [143:0]    l3_conv_weight14    ;
wire     [143:0]    l3_conv_weight15    ;
wire     [143:0]    l3_conv_weight16    ;
wire     [143:0]    l3_conv_weight17    ;
wire     [143:0]    l3_conv_weight18    ;
wire     [143:0]    l3_conv_weight19    ;
wire     [143:0]    l3_conv_weight20    ;
wire     [143:0]    l3_conv_weight21    ;
wire     [143:0]    l3_conv_weight22    ;
wire     [143:0]    l3_conv_weight23    ;
wire     [143:0]    l3_conv_weight24    ;
wire     [143:0]    l3_conv_weight25    ;
wire     [143:0]    l3_conv_weight26    ;
wire     [143:0]    l3_conv_weight27    ;
wire     [143:0]    l3_conv_weight28    ;
wire     [143:0]    l3_conv_weight29    ;
wire     [143:0]    l3_conv_weight30    ;
wire     [143:0]    l3_conv_weight31    ;
wire     [143:0]    l3_conv_weight32    ;

wire     [6:0]      l3_matrix_h_cnt  ;
wire     [6:0]      l3_matrix_v_cnt  ;
wire                l3_matrix_vsync  ;
wire                l3_matrix_href   ;
wire     [143:0]    l3_martix_data1  ;
wire     [143:0]    l3_martix_data2  ;
wire     [143:0]    l3_martix_data3  ;
wire     [143:0]    l3_martix_data4  ;
wire     [143:0]    l3_martix_data5  ;
wire     [143:0]    l3_martix_data6  ;
wire     [143:0]    l3_martix_data7  ;
wire     [143:0]    l3_martix_data8  ;
wire     [143:0]    l3_martix_data9  ;
wire     [143:0]    l3_martix_data10 ;
wire     [143:0]    l3_martix_data11 ;
wire     [143:0]    l3_martix_data12 ;
wire     [143:0]    l3_martix_data13 ;
wire     [143:0]    l3_martix_data14 ;
wire     [143:0]    l3_martix_data15 ;
wire     [143:0]    l3_martix_data16 ;
wire     [143:0]    l3_martix_data17 ;
wire     [143:0]    l3_martix_data18 ;
wire     [143:0]    l3_martix_data19 ;
wire     [143:0]    l3_martix_data20 ;
wire     [143:0]    l3_martix_data21 ;
wire     [143:0]    l3_martix_data22 ;
wire     [143:0]    l3_martix_data23 ;
wire     [143:0]    l3_martix_data24 ;
wire     [143:0]    l3_martix_data25 ;
wire     [143:0]    l3_martix_data26 ;
wire     [143:0]    l3_martix_data27 ;
wire     [143:0]    l3_martix_data28 ;
wire     [143:0]    l3_martix_data29 ;
wire     [143:0]    l3_martix_data30 ;
wire     [143:0]    l3_martix_data31 ;
wire     [143:0]    l3_martix_data32 ;

 wire            l3_end_output    ;
 wire            l3_save_fm_acmp  ;
 wire            l3_fm_vsync      ;
 wire            l3_fm_href       ;
 wire    [15:0]  l3_fm_data       ;

 reg     [6:0]    l3_weg_addr     ;
 reg     [64:0]   l3_fm_ram_wea   ;
 reg              l3_output_flag  ;
 reg              l3_start_output ;

 reg     vsync_r         ;

 assign  vsync   = l3_output_flag && !vsync_r  ;
 assign  active  = l3_fm_href   ;
 assign  data    = l3_fm_data    ;
// //------------others---------------------------//


// //---------------layer1------------------

always @(posedge clk or negedge sync_rst_n)begin
    if(!sync_rst_n) 
        l1_start_output <= 0 ;
    else if(l1_save_fm_acmp || l2_save_fm1_acmp || l2_save_fm2_acmp || l2_save_fm3_acmp || l2_save_fm4_acmp
         || l2_save_fm5_acmp || l2_save_fm6_acmp || l2_save_fm7_acmp || l2_save_fm8_acmp
         || l2_save_fm9_acmp || l2_save_fm10_acmp || l2_save_fm11_acmp || l2_save_fm12_acmp
         || l2_save_fm13_acmp || l2_save_fm14_acmp || l2_save_fm15_acmp|| l2_save_fm16_acmp
         || l2_save_fm17_acmp || l2_save_fm18_acmp || l2_save_fm19_acmp|| l2_save_fm20_acmp
         || l2_save_fm21_acmp || l2_save_fm22_acmp || l2_save_fm23_acmp|| l2_save_fm24_acmp
         || l2_save_fm25_acmp || l2_save_fm26_acmp || l2_save_fm27_acmp|| l2_save_fm28_acmp
         || l2_save_fm29_acmp || l2_save_fm30_acmp || l2_save_fm31_acmp)
        l1_start_output <= 1 ;
    else
        l1_start_output <= 0;
end


always @(posedge clk or negedge sync_rst_n) begin
    if(!sync_rst_n) begin
        l1_fm_wea <= 0 ; 
    end
    else if(l1_pool_done)begin
        l1_fm_wea <= 0;
    end
    else if(pre_vsync)begin
        l1_fm_wea <= 1;
    end
    else
        l1_fm_wea <= l1_fm_wea;
end

// //---------layer2---------------------

 always @(posedge clk_2d or negedge sync_rst_n)begin
     if(!sync_rst_n) 
         l2_start_output <= 0 ;
     else if((l2_save_fm32_acmp || l3_save_fm_acmp) && l3_weg_addr < 63)begin
         l2_start_output <= 1 ;
     end
     else
         l2_start_output <= 0 ;
 end

 always @(posedge clk_2d or negedge sync_rst_n)begin
     if(!sync_rst_n) begin
         l2_weg_addr <= 0 ;
         l2_fm_ram_wea  <= 33'h100000000 ;
     end
     else if(l1_save_fm_acmp || l2_save_fm1_acmp || l2_save_fm2_acmp || l2_save_fm3_acmp || l2_save_fm4_acmp
         || l2_save_fm5_acmp || l2_save_fm6_acmp || l2_save_fm7_acmp || l2_save_fm8_acmp
         || l2_save_fm9_acmp || l2_save_fm10_acmp || l2_save_fm11_acmp || l2_save_fm12_acmp
         || l2_save_fm13_acmp || l2_save_fm14_acmp || l2_save_fm15_acmp|| l2_save_fm16_acmp
         || l2_save_fm17_acmp || l2_save_fm18_acmp || l2_save_fm19_acmp|| l2_save_fm20_acmp
         || l2_save_fm21_acmp || l2_save_fm22_acmp || l2_save_fm23_acmp|| l2_save_fm24_acmp
         || l2_save_fm25_acmp || l2_save_fm26_acmp || l2_save_fm27_acmp|| l2_save_fm28_acmp
         || l2_save_fm29_acmp || l2_save_fm30_acmp || l2_save_fm31_acmp|| l2_save_fm32_acmp)begin
         l2_fm_ram_wea  <= {l2_fm_ram_wea[31:0],l2_fm_ram_wea[32]} ;
         if(l2_save_fm1_acmp || l2_save_fm2_acmp || l2_save_fm3_acmp || l2_save_fm4_acmp
         || l2_save_fm5_acmp || l2_save_fm6_acmp || l2_save_fm7_acmp || l2_save_fm8_acmp
         || l2_save_fm9_acmp || l2_save_fm10_acmp || l2_save_fm11_acmp || l2_save_fm12_acmp
         || l2_save_fm13_acmp || l2_save_fm14_acmp || l2_save_fm15_acmp|| l2_save_fm16_acmp
         || l2_save_fm17_acmp || l2_save_fm18_acmp || l2_save_fm19_acmp|| l2_save_fm20_acmp
         || l2_save_fm21_acmp || l2_save_fm22_acmp || l2_save_fm23_acmp|| l2_save_fm24_acmp
         || l2_save_fm25_acmp || l2_save_fm26_acmp || l2_save_fm27_acmp|| l2_save_fm28_acmp
         || l2_save_fm29_acmp || l2_save_fm30_acmp || l2_save_fm31_acmp|| l2_save_fm32_acmp)
            l2_weg_addr <= l2_weg_addr + 1 ;
     end
     else if(l2_weg_addr == 32)begin
         l2_weg_addr <= 0 ;
         l2_fm_ram_wea  <= 33'h100000000 ;
     end
     else begin
         l2_weg_addr <= l2_weg_addr ;
         l2_fm_ram_wea  <= l2_fm_ram_wea ;    
     end
 end

// //----------------layer3----------------------------

 always @(posedge clk or negedge sync_rst_n)begin
     if(!sync_rst_n) begin
         vsync_r <= 0 ;
     end
     else begin
         vsync_r <= l3_output_flag ; 
     end
 end


 always @(posedge clk_2d or negedge sync_rst_n)begin
     if(!sync_rst_n) begin
         l3_output_flag <= 0 ;
     end
     else if(l2_save_fm32_acmp )begin
         l3_output_flag <=  1 ;
     end
     else if(l3_weg_addr == 64 )begin
         l3_output_flag <=  0 ;
     end
     else begin
         l3_output_flag <= l3_output_flag ; 
     end
 end

 always @(posedge clk or negedge sync_rst_n)begin
     if(!sync_rst_n) begin
         l3_start_output <= 0 ;
     end
     else if(l3_output_flag )begin
         if(l3_save_fm_acmp && l3_weg_addr < 64)
             l3_start_output <= 1 ;
         else
             l3_start_output <= 0 ;
     end
     else begin
         l3_start_output <= 0 ; 
     end
 end
always @(posedge clk_2d or negedge sync_rst_n)begin
     if(!sync_rst_n) begin
         l3_weg_addr <= 0 ;
         l3_fm_ram_wea <= 1 ;
     end
     else if(l3_save_fm_acmp &&  l3_output_flag)begin
         l3_weg_addr <= l3_weg_addr + 1 ;
         l3_fm_ram_wea <= {l3_fm_ram_wea[62:0],1'b0};
     end
     else if(l3_weg_addr == 64)begin
         l3_weg_addr <= 0 ;
         l3_fm_ram_wea <= 1;
     end
     else begin
         l3_weg_addr <= l3_weg_addr ; 
         l3_fm_ram_wea <= l3_fm_ram_wea ;
     end
 end

//--------------end-------------------------------//


/////////////////////////////////////////////////////////////
//                                                         //
//               first conv+relu+pool layer                //
//                                                         //
/////////////////////////////////////////////////////////////
wire [143:0]  l1_conv_weight1 ;
wire [143:0]  l1_conv_weight2 ;
wire [143:0]  l1_conv_weight3 ;
wire [143:0]  l1_conv_weight4 ;
wire [143:0]  l1_conv_weight5 ;
wire [143:0]  l1_conv_weight6 ;
wire [143:0]  l1_conv_weight7 ;
wire [143:0]  l1_conv_weight8 ;
wire [143:0]  l1_conv_weight9 ;
wire [143:0]  l1_conv_weight10 ;
wire [143:0]  l1_conv_weight11 ;
wire [143:0]  l1_conv_weight12 ;
wire [143:0]  l1_conv_weight13 ;
wire [143:0]  l1_conv_weight14 ;
wire [143:0]  l1_conv_weight15 ;
wire [143:0]  l1_conv_weight16 ;

// Auto-generated from: conv1_weights.coe
// Convolution kernel size: 3x3
// Total kernels: 16

// Kernel 1
assign l1_conv_weight1 = {
    16'h0A75, 16'hF435, 16'hF3D5,
    16'hE6CB, 16'h0DCE, 16'hFA10,
    16'h0B0C, 16'hEE09, 16'h053F
};

// Kernel 2
assign l1_conv_weight2 = {
    16'hEA34, 16'hFA00, 16'h11A6,
    16'h03AC, 16'h0236, 16'hE90B,
    16'h076A, 16'h1339, 16'hF863
};

// Kernel 3
assign l1_conv_weight3 = {
    16'h0E37, 16'h0A36, 16'hE27D,
    16'h051C, 16'hE6D9, 16'hF51F,
    16'hFD95, 16'hF332, 16'h0AB0
};

// Kernel 4
assign l1_conv_weight4 = {
    16'h16E4, 16'h0C36, 16'h031B,
    16'hF3C5, 16'hF94C, 16'hE69B,
    16'hF3AF, 16'hF97C, 16'hF920
};

// Kernel 5
assign l1_conv_weight5 = {
    16'hF748, 16'h023F, 16'hED51,
    16'hECD8, 16'h0767, 16'hF470,
    16'h062A, 16'h1739, 16'h190C
};

// Kernel 6
assign l1_conv_weight6 = {
    16'h1142, 16'hFA6A, 16'hF1D5,
    16'h177B, 16'h0433, 16'hF539,
    16'hF8AC, 16'hF365, 16'hE702
};

// Kernel 7
assign l1_conv_weight7 = {
    16'h0781, 16'hE9C7, 16'hF787,
    16'h04B8, 16'h0491, 16'hF5E9,
    16'h0CF1, 16'hEC98, 16'h1023
};

// Kernel 8
assign l1_conv_weight8 = {
    16'h133D, 16'hFEE0, 16'h0A61,
    16'hF4C3, 16'h1520, 16'h0D22,
    16'hFA59, 16'hF8BB, 16'hE87E
};

// Kernel 9
assign l1_conv_weight9 = {
    16'h0F81, 16'h1675, 16'hEE0B,
    16'h055E, 16'hE61D, 16'hEEFD,
    16'h001D, 16'h17EA, 16'h04EB
};

// Kernel 10
assign l1_conv_weight10 = {
    16'hE9B6, 16'h05B0, 16'h0381,
    16'hFD49, 16'hFD90, 16'h0452,
    16'h087A, 16'hFFA9, 16'h05BB
};

// Kernel 11
assign l1_conv_weight11 = {
    16'hF80D, 16'hEE76, 16'hF4E4,
    16'h14A8, 16'hF027, 16'h1245,
    16'h01AF, 16'hF508, 16'h0EE3
};

// Kernel 12
assign l1_conv_weight12 = {
    16'h0F26, 16'h17E7, 16'hEA24,
    16'h08D6, 16'h17B2, 16'h04D5,
    16'h087F, 16'h0BAB, 16'hF8E9
};

// Kernel 13
assign l1_conv_weight13 = {
    16'hFCD0, 16'h1469, 16'h11BA,
    16'h1033, 16'h17B9, 16'h080A,
    16'h15F8, 16'h06C3, 16'hEF85
};

// Kernel 14
assign l1_conv_weight14 = {
    16'hF096, 16'hEB55, 16'h14EC,
    16'hF37D, 16'hFDD4, 16'hF1CE,
    16'h1A7D, 16'hF9A7, 16'hE754
};

// Kernel 15
assign l1_conv_weight15 = {
    16'h08B5, 16'hE124, 16'h0585,
    16'hEABD, 16'h0B0B, 16'h09BD,
    16'h0082, 16'h0F74, 16'hF013
};

// Kernel 16
assign l1_conv_weight16 = {
    16'hE39E, 16'h0E18, 16'h117E,
    16'hE493, 16'hDE6E, 16'hFBF8,
    16'h0408, 16'h160E, 16'hF6BC
};


localparam  signed l1_conv_bias1  = 16'hF8B3   ;
localparam  signed l1_conv_bias2  = 16'h02D6   ;
localparam  signed l1_conv_bias3  = 16'hF8F9   ;
localparam  signed l1_conv_bias4  = 16'hFD67   ;
localparam  signed l1_conv_bias5  = 16'hF94B   ;
localparam  signed l1_conv_bias6  = 16'hF78A   ;
localparam  signed l1_conv_bias7  = 16'hF862   ;
localparam  signed l1_conv_bias8  = 16'hF510   ;
localparam  signed l1_conv_bias9  = 16'hF832   ;
localparam  signed l1_conv_bias10 = 16'h0210   ;
localparam  signed l1_conv_bias11 = 16'hFAED   ;
localparam  signed l1_conv_bias12 = 16'h011C   ;
localparam  signed l1_conv_bias13 = 16'hF733   ;
localparam  signed l1_conv_bias14 = 16'hF8B5   ;
localparam  signed l1_conv_bias15 = 16'hF6BD   ;
localparam  signed l1_conv_bias16 = 16'hF5CF   ;


assign  pre_data_r = {{8'b0},pre_data}  ;
Matrix_Generate_3X3
#(
    .FIFO_WIDTH (16          ),
    .IMG_HDISP  (WIDTH       ),           
    .IMG_VDISP  (HEIGHT      ),
    .DELAY_NUM  (10          )      
)
Img_Matrix_3X3(
    //  global clock & reset
    .clk     (clk            ) ,
    .rst_n   (sync_rst_n    ) ,
    
    //  Image data prepared to be processed
    .pre_vsync (pre_vsync   ) ,   
    .pre_href  (pre_href    ) ,   
    .pre_data  (pre_data_r  ) ,   
    
    // h_cnt,v_cnt output
    .matrix_h_cnt           (l1_matrix_h_cnt          ),
    .matrix_v_cnt           (l1_matrix_v_cnt          ),
    
    //  Image data has been processed
    .matrix_vsync           (l1_matrix_vsync           ),      
    .matrix_href            (l1_matrix_href            ),      
    .data_combination       (l1_matrix_data            )
);



common_layer_conv#(
    .CONV_WIDTH      (WIDTH     ) ,
    .CONV_HEIGHT     (HEIGHT    ) 
)u_common_layer_conv(
    .clk   (clk         ),
    .rst_n (sync_rst_n ),
    .matrix_vsync (matrix_vsync ),
    .matrix_href  (matrix_href  ),
    .matrix_h_cnt (matrix_h_cnt ),
    .matrix_v_cnt (matrix_v_cnt ),
    .conv_bias1   (conv_bias1   ),
    .conv_bias2   (conv_bias2   ),
    .conv_bias3   (conv_bias3   ),
    .conv_bias4   (conv_bias4   ),
    .conv_bias5   (conv_bias5   ),
    .conv_bias6   (conv_bias6   ),
    .conv_bias7   (conv_bias7   ),
    .conv_bias8   (conv_bias8   ),
    .conv_bias9   (conv_bias9   ),
    .conv_bias10  (conv_bias10  ),
    .conv_bias11  (conv_bias11  ),
    .conv_bias12  (conv_bias12  ),
    .conv_bias13  (conv_bias13  ),
    .conv_bias14  (conv_bias14  ),
    .conv_bias15  (conv_bias15  ),
    .conv_bias16  (conv_bias16  ),
    .conv_bias17  (conv_bias17  ),
    .conv_bias18  (conv_bias18  ),
    .conv_bias19  (conv_bias19  ),
    .conv_bias20  (conv_bias20  ),
    .conv_bias21  (conv_bias21  ),
    .conv_bias22  (conv_bias22  ),
    .conv_bias23  (conv_bias23  ),
    .conv_bias24  (conv_bias24  ),
    .conv_bias25  (conv_bias25  ),
    .conv_bias26  (conv_bias26  ),
    .conv_bias27  (conv_bias27  ),
    .conv_bias28  (conv_bias28  ),
    .conv_bias29  (conv_bias29  ),
    .conv_bias30  (conv_bias30  ),
    .conv_bias31  (conv_bias31  ),
    .conv_bias32  (conv_bias32  ),
    .fm_data1      (matrix_data1    ),
    .fm_data2      (matrix_data2    ),
    .fm_data3      (matrix_data3    ),
    .fm_data4      (matrix_data4    ),
    .fm_data5      (matrix_data5    ),
    .fm_data6      (matrix_data6    ),
    .fm_data7      (matrix_data7    ),
    .fm_data8      (matrix_data8    ),
    .fm_data9      (matrix_data9    ),
    .fm_data10     (matrix_data10   ),
    .fm_data11     (matrix_data11   ),
    .fm_data12     (matrix_data12   ),
    .fm_data13     (matrix_data13   ),
    .fm_data14     (matrix_data14   ),
    .fm_data15     (matrix_data15   ),
    .fm_data16     (matrix_data16   ),
    .fm_data17     (matrix_data17   ),
    .fm_data18     (matrix_data18   ),
    .fm_data19     (matrix_data19   ),
    .fm_data20     (matrix_data20   ),
    .fm_data21     (matrix_data21   ),
    .fm_data22     (matrix_data22   ),
    .fm_data23     (matrix_data23   ),
    .fm_data24     (matrix_data24   ),
    .fm_data25     (matrix_data25   ),
    .fm_data26     (matrix_data26   ),
    .fm_data27     (matrix_data27   ),
    .fm_data28     (matrix_data28   ),
    .fm_data29     (matrix_data29   ),
    .fm_data30     (matrix_data30   ),
    .fm_data31     (matrix_data31   ),
    .fm_data32     (matrix_data32   ),
    .conv_weight1  (conv_weight1    ),
    .conv_weight2  (conv_weight2    ),
    .conv_weight3  (conv_weight3    ),
    .conv_weight4  (conv_weight4    ),
    .conv_weight5  (conv_weight5    ),
    .conv_weight6  (conv_weight6    ),
    .conv_weight7  (conv_weight7    ),
    .conv_weight8  (conv_weight8    ),
    .conv_weight9  (conv_weight9    ),
    .conv_weight10 (conv_weight10   ),
    .conv_weight11 (conv_weight11   ),
    .conv_weight12 (conv_weight12   ),
    .conv_weight13 (conv_weight13   ),
    .conv_weight14 (conv_weight14   ),
    .conv_weight15 (conv_weight15   ),
    .conv_weight16 (conv_weight16   ),
    .conv_weight17 (conv_weight17   ),
    .conv_weight18 (conv_weight18   ),
    .conv_weight19 (conv_weight19   ),
    .conv_weight20 (conv_weight20   ),
    .conv_weight21 (conv_weight21   ),
    .conv_weight22 (conv_weight22   ),
    .conv_weight23 (conv_weight23   ),
    .conv_weight24 (conv_weight24   ),
    .conv_weight25 (conv_weight25   ),
    .conv_weight26 (conv_weight26   ),
    .conv_weight27 (conv_weight27   ),
    .conv_weight28 (conv_weight28   ),
    .conv_weight29 (conv_weight29   ),
    .conv_weight30 (conv_weight30   ),
    .conv_weight31 (conv_weight31   ),
    .conv_weight32 (conv_weight32   ),

    .conv_h_cnt    (conv_h_cnt      ),
    .conv_v_cnt    (conv_v_cnt      ),
    .conv_href     (conv_href       ),
    .conv_vsync    (conv_vsync      ),
    .conv_result1  (conv_rlt1       ),
    .conv_result2  (conv_rlt2       ),
    .conv_result3  (conv_rlt3       ),
    .conv_result4  (conv_rlt4       ),
    .conv_result5  (conv_rlt5       ),
    .conv_result6  (conv_rlt6       ),
    .conv_result7  (conv_rlt7       ),
    .conv_result8  (conv_rlt8       ),
    .conv_result9  (conv_rlt9       ),
    .conv_result10 (conv_rlt10      ),
    .conv_result11 (conv_rlt11      ),
    .conv_result12 (conv_rlt12      ),
    .conv_result13 (conv_rlt13      ),
    .conv_result14 (conv_rlt14      ),
    .conv_result15 (conv_rlt15      ),
    .conv_result16 (conv_rlt16      ),
    .conv_result17 (conv_rlt17      ),
    .conv_result18 (conv_rlt18      ),
    .conv_result19 (conv_rlt19      ),
    .conv_result20 (conv_rlt20      ),
    .conv_result21 (conv_rlt21      ),
    .conv_result22 (conv_rlt22      ),
    .conv_result23 (conv_rlt23      ),
    .conv_result24 (conv_rlt24      ),
    .conv_result25 (conv_rlt25      ),
    .conv_result26 (conv_rlt26      ),
    .conv_result27 (conv_rlt27      ),
    .conv_result28 (conv_rlt28      ),
    .conv_result29 (conv_rlt29      ),
    .conv_result30 (conv_rlt30      ),
    .conv_result31 (conv_rlt31      ),
    .conv_result32 (conv_rlt32      )
);


wire signed [31:0]  pre_relu_data1  = (conv_rlt1  + 128) >>> 8 ;
wire signed [31:0]  pre_relu_data2  = (conv_rlt2  + 128) >>> 8 ;
wire signed [31:0]  pre_relu_data3  = (conv_rlt3  + 128) >>> 8 ;
wire signed [31:0]  pre_relu_data4  = (conv_rlt4  + 128) >>> 8 ;
wire signed [31:0]  pre_relu_data5  = (conv_rlt5  + 128) >>> 8 ;
wire signed [31:0]  pre_relu_data6  = (conv_rlt6  + 128) >>> 8 ;
wire signed [31:0]  pre_relu_data7  = (conv_rlt7  + 128) >>> 8 ;
wire signed [31:0]  pre_relu_data8  = (conv_rlt8  + 128) >>> 8 ;
wire signed [31:0]  pre_relu_data9  = (conv_rlt9  + 128) >>> 8 ;
wire signed [31:0]  pre_relu_data10 = (conv_rlt10 + 128) >>> 8 ;
wire signed [31:0]  pre_relu_data11 = (conv_rlt11 + 128) >>> 8 ;
wire signed [31:0]  pre_relu_data12 = (conv_rlt12 + 128) >>> 8 ;
wire signed [31:0]  pre_relu_data13 = (conv_rlt13 + 128) >>> 8 ;
wire signed [31:0]  pre_relu_data14 = (conv_rlt14 + 128) >>> 8 ;
wire signed [31:0]  pre_relu_data15 = (conv_rlt15 + 128) >>> 8 ;
wire signed [31:0]  pre_relu_data16 = (conv_rlt16 + 128) >>> 8 ;

wire    [6:0]   l1_relu_h_cnt  ;
wire    [6:0]   l1_relu_v_cnt  ;
wire            l1_relu_vsync  ;
wire            l1_relu_href   ;
wire    [15:0]  l1_relu_data1  ;
wire    [15:0]  l1_relu_data2  ;
wire    [15:0]  l1_relu_data3  ;
wire    [15:0]  l1_relu_data4  ;
wire    [15:0]  l1_relu_data5  ;
wire    [15:0]  l1_relu_data6  ;
wire    [15:0]  l1_relu_data7  ;
wire    [15:0]  l1_relu_data8  ;
wire    [15:0]  l1_relu_data9  ;
wire    [15:0]  l1_relu_data10 ;
wire    [15:0]  l1_relu_data11 ;
wire    [15:0]  l1_relu_data12 ;
wire    [15:0]  l1_relu_data13 ;
wire    [15:0]  l1_relu_data14 ;
wire    [15:0]  l1_relu_data15 ;
wire    [15:0]  l1_relu_data16 ;

reg  [1:0]   l1_pre_relu_vsync   ;
reg  [1:0]   l1_pre_relu_href    ;

always @(posedge clk or negedge sync_rst_n)begin
    if(!sync_rst_n)begin
        l1_pre_relu_vsync <= 0 ;
        l1_pre_relu_href  <= 0 ;
    end 
    else begin
        l1_pre_relu_vsync <= {l1_pre_relu_vsync[0], l1_matrix_vsync} ;
        l1_pre_relu_href  <= {l1_pre_relu_href[0], l1_matrix_href }  ;
    end
end

layer1_relu#(
    .PRE_BIT_WIDTH  (32     )
)u_layer1_relu(
    .clk   (clk         ),
    .rst_n (sync_rst_n ),
    
    .conv_h_cnt (conv_h_cnt  ),
    .conv_v_cnt (conv_v_cnt  ),
    .pre_vsync  (l1_pre_relu_vsync[1]  ),
    .pre_href   (l1_pre_relu_href[1]   ),
    .pre_data1  (pre_relu_data1     ),
    .pre_data2  (pre_relu_data2     ),
    .pre_data3  (pre_relu_data3     ),
    .pre_data4  (pre_relu_data4     ),
    .pre_data5  (pre_relu_data5     ),
    .pre_data6  (pre_relu_data6     ),
    .pre_data7  (pre_relu_data7     ),
    .pre_data8  (pre_relu_data8     ),
    .pre_data9  (pre_relu_data9     ),
    .pre_data10 (pre_relu_data10    ),
    .pre_data11 (pre_relu_data11    ),
    .pre_data12 (pre_relu_data12    ),
    .pre_data13 (pre_relu_data13    ),
    .pre_data14 (pre_relu_data14    ),
    .pre_data15 (pre_relu_data15    ),
    .pre_data16 (pre_relu_data16    ),
    
    .relu_h_cnt (l1_relu_h_cnt  ),
    .relu_v_cnt (l1_relu_v_cnt  ),
    .relu_vsync (l1_relu_vsync  ),
    .relu_href  (l1_relu_href   ),
    
    .relu_data1   (l1_relu_data1    ),
    .relu_data2   (l1_relu_data2    ),
    .relu_data3   (l1_relu_data3    ),
    .relu_data4   (l1_relu_data4    ),
    .relu_data5   (l1_relu_data5    ),
    .relu_data6   (l1_relu_data6    ),
    .relu_data7   (l1_relu_data7    ),
    .relu_data8   (l1_relu_data8    ),
    .relu_data9   (l1_relu_data9    ),
    .relu_data10  (l1_relu_data10   ),
    .relu_data11  (l1_relu_data11   ),
    .relu_data12  (l1_relu_data12   ),
    .relu_data13  (l1_relu_data13   ),
    .relu_data14  (l1_relu_data14   ),
    .relu_data15  (l1_relu_data15   ),
    .relu_data16  (l1_relu_data16   )
);

layer1_pool#(
    .WIDTH (WIDTH/2     )
    )u_layer1_pool(
    .clk   (clk         ),
    .rst_n (sync_rst_n ),
    
    .relu_h_cnt   (l1_relu_h_cnt    ),
    .relu_v_cnt   (l1_relu_v_cnt    ),
    .pre_vsync    (l1_relu_vsync    ),
    .pre_href     (l1_relu_href     ),
    .pre_data1    (l1_relu_data1    ),
    .pre_data2    (l1_relu_data2    ),
    .pre_data3    (l1_relu_data3    ),
    .pre_data4    (l1_relu_data4    ),
    .pre_data5    (l1_relu_data5    ),
    .pre_data6    (l1_relu_data6    ),
    .pre_data7    (l1_relu_data7    ),
    .pre_data8    (l1_relu_data8    ),
    .pre_data9    (l1_relu_data9    ),
    .pre_data10   (l1_relu_data10   ),
    .pre_data11   (l1_relu_data11   ),
    .pre_data12   (l1_relu_data12   ),
    .pre_data13   (l1_relu_data13   ),
    .pre_data14   (l1_relu_data14   ),
    .pre_data15   (l1_relu_data15   ),
    .pre_data16   (l1_relu_data16   ),
    
    .pool_done   (l1_pool_done      ),
    .pool_h_cnt  (l1_pool_h_cnt     ),
    .pool_v_cnt  (l1_pool_v_cnt     ),
    
    .pool_vsync  (l1_pool_vsync     ),
    .pool_href   (l1_pool_href      ),
    .pool_data1  (l1_pool_data1     ),  
    .pool_data2  (l1_pool_data2     ), 
    .pool_data3  (l1_pool_data3     ),  
    .pool_data4  (l1_pool_data4     ),  
    .pool_data5  (l1_pool_data5     ),  
    .pool_data6  (l1_pool_data6     ),  
    .pool_data7  (l1_pool_data7     ),  
    .pool_data8  (l1_pool_data8     ),   
    .pool_data9  (l1_pool_data9     ),  
    .pool_data10 (l1_pool_data10    ), 
    .pool_data11 (l1_pool_data11    ),  
    .pool_data12 (l1_pool_data12    ),  
    .pool_data13 (l1_pool_data13    ),  
    .pool_data14 (l1_pool_data14    ),  
    .pool_data15 (l1_pool_data15    ),  
    .pool_data16 (l1_pool_data16    )
);

layer1_fm_inout#(
    .FM_WIDTH    (WIDTH/2   )  ,
    .FM_HEIGHT   (HEIGHT/2  )  
)u_layer1_fm_inout(
    .clk     (clk           ),
    .rst_n   (sync_rst_n   ),
    
    .fm_wea        (l1_fm_wea       ),
    .start_output  (l1_start_output ),
    .pre_vsync     (l1_pool_vsync   ),
    .pre_href      (l1_pool_href    ),
    .pre_data1     (l1_pool_data1   ),
    .pre_data2     (l1_pool_data2   ),
    .pre_data3     (l1_pool_data3   ),
    .pre_data4     (l1_pool_data4   ),
    .pre_data5     (l1_pool_data5   ),
    .pre_data6     (l1_pool_data6   ),
    .pre_data7     (l1_pool_data7   ),
    .pre_data8     (l1_pool_data8   ),
    .pre_data9     (l1_pool_data9   ),
    .pre_data10    (l1_pool_data10  ),
    .pre_data11    (l1_pool_data11  ),
    .pre_data12    (l1_pool_data12  ),
    .pre_data13    (l1_pool_data13  ),
    .pre_data14    (l1_pool_data14  ),
    .pre_data15    (l1_pool_data15  ),
    .pre_data16    (l1_pool_data16  ),

    .save_fm_acmp (l1_save_fm_acmp  ),
    .end_output   (l1_end_output    ),
    .post_vsync   (l1_fm_vsync      ),
    .post_href    (l1_fm_href       ),
    .post_data1   (l1_fm_data1  ), 
    .post_data2   (l1_fm_data2  ), 
    .post_data3   (l1_fm_data3  ), 
    .post_data4   (l1_fm_data4  ), 
    .post_data5   (l1_fm_data5  ), 
    .post_data6   (l1_fm_data6  ), 
    .post_data7   (l1_fm_data7  ), 
    .post_data8   (l1_fm_data8  ), 
    .post_data9   (l1_fm_data9  ), 
    .post_data10  (l1_fm_data10 ), 
    .post_data11  (l1_fm_data11 ), 
    .post_data12  (l1_fm_data12 ), 
    .post_data13  (l1_fm_data13 ), 
    .post_data14  (l1_fm_data14 ), 
    .post_data15  (l1_fm_data15 ), 
    .post_data16  (l1_fm_data16 )
);

/////////////////////////////////////////////////////////////
//                                                         //
//               second conv+relu+pool layer               //
//                                                         //
/////////////////////////////////////////////////////////////



l2_martix_generate#(
    .FIFO_WIDTH (16         ),    
    .IMG_HDISP  (WIDTH/2    ),           
    .IMG_VDISP  (HEIGHT/2   ),
    .DELAY_NUM  (10         )           
)u_l2_martix_generate(
    //  global clock & reset
    .clk        (clk           ),
    .rst_n      (sync_rst_n   ),
    
    .pre_vsync  (l1_fm_vsync    ),    
    .pre_href   (l1_fm_href     ),    
    .pre_data1  (l1_fm_data1    ),   
    .pre_data2  (l1_fm_data2    ),  
    .pre_data3  (l1_fm_data3    ),  
    .pre_data4  (l1_fm_data4    ),  
    .pre_data5  (l1_fm_data5    ),  
    .pre_data6  (l1_fm_data6    ),  
    .pre_data7  (l1_fm_data7    ),  
    .pre_data8  (l1_fm_data8    ),  
    .pre_data9  (l1_fm_data9    ),   
    .pre_data10 (l1_fm_data10   ),  
    .pre_data11 (l1_fm_data11   ),  
    .pre_data12 (l1_fm_data12   ),  
    .pre_data13 (l1_fm_data13   ),  
    .pre_data14 (l1_fm_data14   ),  
    .pre_data15 (l1_fm_data15   ),  
    .pre_data16 (l1_fm_data16   ),
    
    .matrix_h_cnt       (l2_matrix_h_cnt),
    .matrix_v_cnt       (l2_matrix_v_cnt),
    .matrix_vsync       (l2_matrix_vsync),   
    .matrix_href        (l2_matrix_href ),   
    .data_combination1  (l2_martix_data1  ), 
    .data_combination2  (l2_martix_data2  ), 
    .data_combination3  (l2_martix_data3  ), 
    .data_combination4  (l2_martix_data4  ), 
    .data_combination5  (l2_martix_data5  ), 
    .data_combination6  (l2_martix_data6  ), 
    .data_combination7  (l2_martix_data7  ), 
    .data_combination8  (l2_martix_data8  ), 
    .data_combination9  (l2_martix_data9  ), 
    .data_combination10 (l2_martix_data10 ), 
    .data_combination11 (l2_martix_data11 ), 
    .data_combination12 (l2_martix_data12 ), 
    .data_combination13 (l2_martix_data13 ), 
    .data_combination14 (l2_martix_data14 ), 
    .data_combination15 (l2_martix_data15 ), 
    .data_combination16 (l2_martix_data16 ) 
);

wire    signed [31:0]  l2_pre_relu_data ;
wire    signed [31:0]  l2_conv_bias_r   ;
assign   l2_conv_bias_r   = l2_conv_bias[15] ? {{16{1'b1}},l2_conv_bias} : {{16{1'b0}},l2_conv_bias} ;
assign   l2_pre_relu_data = (conv_rlt1 + conv_rlt2 + conv_rlt3 + conv_rlt4 
                       + conv_rlt5 + conv_rlt6 + conv_rlt7 + conv_rlt8
                       + conv_rlt9 + conv_rlt10 + conv_rlt11 + conv_rlt12
                       + conv_rlt13 + conv_rlt14 + conv_rlt15 + conv_rlt16 
                       + l2_conv_bias_r + 16384)>>>15 ;

wire             l2_relu_vsync     ;
wire             l2_relu_href      ;
wire    [15:0]   l2_relu_data      ;
wire    [6:0]    l2_relu_h_cnt     ;
wire    [6:0]    l2_relu_v_cnt     ;

reg     [6:0]    l2_conv_h_cnt      ;
reg     [6:0]    l2_conv_v_cnt      ;
reg     [2:0]    l2_conv_href       ;
reg     [2:0]    l2_conv_vsync      ;

reg signed [31:0] l2_pre_relu_data_r ;

//delay three clock cycles
always @(posedge clk or negedge sync_rst_n)begin
    if(!sync_rst_n)begin
        l2_conv_h_cnt   <= 0 ;
        l2_conv_v_cnt   <= 0 ;
        l2_conv_href    <= 0 ;
        l2_conv_vsync   <= 0 ;
        l2_pre_relu_data_r <= 0 ;
    end
    else begin
        l2_conv_h_cnt <= conv_h_cnt  ;
        l2_conv_v_cnt <= conv_v_cnt  ;
        l2_conv_href  <= {l2_conv_href[1:0],l2_matrix_href}    ;
        l2_conv_vsync <= {l2_conv_vsync[1:0],l2_matrix_vsync}  ;
        l2_pre_relu_data_r <= l2_pre_relu_data ;
    end
end

ReLU #(
    .PRE_BIT_WIDTH(32     )
)layer2_ReLU(
    .clk   (clk            ),
    .rst_n (sync_rst_n    ),
    
    .conv_h_cnt (l2_conv_h_cnt       ),
    .conv_v_cnt (l2_conv_v_cnt       ),
    .pre_vsync  (l2_conv_vsync[2]       ),
    .pre_href   (l2_conv_href[2]        ),
    .pre_data   (l2_pre_relu_data_r  ),
    
    .relu_h_cnt (l2_relu_h_cnt    ),
    .relu_v_cnt (l2_relu_v_cnt    ),
    .relu_vsync (l2_relu_vsync    ),
    .relu_href  (l2_relu_href     ),
    .relu_data  (l2_relu_data     )
);

wire               l2_pool_vsync  ;
wire               l2_pool_href   ;
wire      [15:0]   l2_pool_data   ;
max_pool
#(
    .FIFO_WIDTH (16         ),
    .FIFO_DEPTH (WIDTH/4    )  
)layer2_max_pool(
    .clk    (clk            ),
    .rst_n  (sync_rst_n    ),
    
    .relu_h_cnt     (l2_relu_h_cnt   ),
    .relu_v_cnt     (l2_relu_v_cnt   ),
    .pre_vsync      (l2_relu_vsync   ),
    .pre_href       (l2_relu_href    ),
    .pre_data       (l2_relu_data    ),

    .pool_vsync     (l2_pool_vsync   ),
    .pool_href      (l2_pool_href    ),
    .pool_data      (l2_pool_data    )
);
 
l2_fm_inout#(
    .FM_WIDTH    (WIDTH/4   ),
    .FM_HEIGHT   (HEIGHT/4  )
)u_l2_fm_inout(
    .clk     (clk           ),
    .rst_n   (sync_rst_n   ),
    
    .fm_ram_wea     (l2_fm_ram_wea  ),
    .start_output   (l2_start_output),
    .pre_vsync      (l2_pool_vsync  ),
    .pre_href       (l2_pool_href   ),
    .pre_data       (l2_pool_data   ),
    
    .end_output     (l2_end_output      ),
    .post_vsync     (l2_fm_vsync        ),
    .post_href      (l2_fm_href         ),
    .save_fm1_acmp  (l2_save_fm1_acmp   ),
    .save_fm2_acmp  (l2_save_fm2_acmp   ),
    .save_fm3_acmp  (l2_save_fm3_acmp   ),
    .save_fm4_acmp  (l2_save_fm4_acmp   ),
    .save_fm5_acmp  (l2_save_fm5_acmp   ),
    .save_fm6_acmp  (l2_save_fm6_acmp   ),
    .save_fm7_acmp  (l2_save_fm7_acmp   ),
    .save_fm8_acmp  (l2_save_fm8_acmp   ),
    .save_fm9_acmp  (l2_save_fm9_acmp   ),
    .save_fm10_acmp (l2_save_fm10_acmp  ),
    .save_fm11_acmp (l2_save_fm11_acmp  ),
    .save_fm12_acmp (l2_save_fm12_acmp  ),
    .save_fm13_acmp (l2_save_fm13_acmp  ),
    .save_fm14_acmp (l2_save_fm14_acmp  ),
    .save_fm15_acmp (l2_save_fm15_acmp  ),
    .save_fm16_acmp (l2_save_fm16_acmp  ),
    .save_fm17_acmp (l2_save_fm17_acmp  ),
    .save_fm18_acmp (l2_save_fm18_acmp  ),
    .save_fm19_acmp (l2_save_fm19_acmp  ),
    .save_fm20_acmp (l2_save_fm20_acmp  ),
    .save_fm21_acmp (l2_save_fm21_acmp  ),
    .save_fm22_acmp (l2_save_fm22_acmp  ),
    .save_fm23_acmp (l2_save_fm23_acmp  ),
    .save_fm24_acmp (l2_save_fm24_acmp  ),
    .save_fm25_acmp (l2_save_fm25_acmp  ),
    .save_fm26_acmp (l2_save_fm26_acmp  ),
    .save_fm27_acmp (l2_save_fm27_acmp  ),
    .save_fm28_acmp (l2_save_fm28_acmp  ),
    .save_fm29_acmp (l2_save_fm29_acmp  ),
    .save_fm30_acmp (l2_save_fm30_acmp  ),
    .save_fm31_acmp (l2_save_fm31_acmp  ),
    .save_fm32_acmp (l2_save_fm32_acmp  ),
    .fm1_data       (l2_fm1_data        ),
    .fm2_data       (l2_fm2_data        ),
    .fm3_data       (l2_fm3_data        ),
    .fm4_data       (l2_fm4_data        ),
    .fm5_data       (l2_fm5_data        ),
    .fm6_data       (l2_fm6_data        ),
    .fm7_data       (l2_fm7_data        ),
    .fm8_data       (l2_fm8_data        ),
    .fm9_data       (l2_fm9_data        ),
    .fm10_data      (l2_fm10_data       ),
    .fm11_data      (l2_fm11_data       ),
    .fm12_data      (l2_fm12_data       ),
    .fm13_data      (l2_fm13_data       ),
    .fm14_data      (l2_fm14_data       ),
    .fm15_data      (l2_fm15_data       ),
    .fm16_data      (l2_fm16_data       ),
    .fm17_data      (l2_fm17_data       ),
    .fm18_data      (l2_fm18_data       ),
    .fm19_data      (l2_fm19_data       ),
    .fm20_data      (l2_fm20_data       ),
    .fm21_data      (l2_fm21_data       ),
    .fm22_data      (l2_fm22_data       ),
    .fm23_data      (l2_fm23_data       ),
    .fm24_data      (l2_fm24_data       ),
    .fm25_data      (l2_fm25_data       ),
    .fm26_data      (l2_fm26_data       ),
    .fm27_data      (l2_fm27_data       ),
    .fm28_data      (l2_fm28_data       ),
    .fm29_data      (l2_fm29_data       ),
    .fm30_data      (l2_fm30_data       ),
    .fm31_data      (l2_fm31_data       ),
    .fm32_data      (l2_fm32_data       )

);

l2_conv_w_b u_l2_conv_w_b(
    .clk      (clk          ),
    .weg_addr (l2_weg_addr  ),
    
    .conv_bias     (l2_conv_bias        ),
    .conv_weight1  (l2_conv_weight1     ),
    .conv_weight2  (l2_conv_weight2     ),
    .conv_weight3  (l2_conv_weight3     ),
    .conv_weight4  (l2_conv_weight4     ),
    .conv_weight5  (l2_conv_weight5     ),
    .conv_weight6  (l2_conv_weight6     ),
    .conv_weight7  (l2_conv_weight7     ),
    .conv_weight8  (l2_conv_weight8     ),
    .conv_weight9  (l2_conv_weight9     ),
    .conv_weight10 (l2_conv_weight10    ),
    .conv_weight11 (l2_conv_weight11    ),
    .conv_weight12 (l2_conv_weight12    ),
    .conv_weight13 (l2_conv_weight13    ),
    .conv_weight14 (l2_conv_weight14    ),
    .conv_weight15 (l2_conv_weight15    ),
    .conv_weight16 (l2_conv_weight16    )
);
    
// /////---------layer3------------------------//////
l3_martix_generate#(
    .FIFO_WIDTH (16         ),    
    .IMG_HDISP  (WIDTH/4    ),           
    .IMG_VDISP  (HEIGHT/4   ),
    .DELAY_NUM  (10         )           
)u_l3_martix_generate(
    .clk        (clk            ),
    .rst_n      (sync_rst_n    ),
    
    .pre_vsync  (l2_fm_vsync    ),    
    .pre_href   (l2_fm_href     ),    
    .pre_data1  (l2_fm1_data    ),   
    .pre_data2  (l2_fm2_data    ),  
    .pre_data3  (l2_fm3_data    ),  
    .pre_data4  (l2_fm4_data    ),  
    .pre_data5  (l2_fm5_data    ),  
    .pre_data6  (l2_fm6_data    ),  
    .pre_data7  (l2_fm7_data    ),  
    .pre_data8  (l2_fm8_data    ),  
    .pre_data9  (l2_fm9_data    ),   
    .pre_data10 (l2_fm10_data   ),  
    .pre_data11 (l2_fm11_data   ),  
    .pre_data12 (l2_fm12_data   ),  
    .pre_data13 (l2_fm13_data   ),  
    .pre_data14 (l2_fm14_data   ),  
    .pre_data15 (l2_fm15_data   ),  
    .pre_data16 (l2_fm16_data   ),
    .pre_data17 (l2_fm17_data   ),   
    .pre_data18 (l2_fm18_data   ),  
    .pre_data19 (l2_fm19_data   ),  
    .pre_data20 (l2_fm20_data   ),  
    .pre_data21 (l2_fm21_data   ),  
    .pre_data22 (l2_fm22_data   ),  
    .pre_data23 (l2_fm23_data   ),  
    .pre_data24 (l2_fm24_data   ),  
    .pre_data25 (l2_fm25_data   ),   
    .pre_data26 (l2_fm26_data   ),  
    .pre_data27 (l2_fm27_data   ),  
    .pre_data28 (l2_fm28_data   ),  
    .pre_data29 (l2_fm29_data   ),  
    .pre_data30 (l2_fm30_data   ),  
    .pre_data31 (l2_fm31_data   ),  
    .pre_data32 (l2_fm32_data   ),
    
    .matrix_h_cnt       (l3_matrix_h_cnt),
    .matrix_v_cnt       (l3_matrix_v_cnt),
    .matrix_vsync       (l3_matrix_vsync),   
    .matrix_href        (l3_matrix_href ),   
    .data_combination1  (l3_martix_data1    ), 
    .data_combination2  (l3_martix_data2    ), 
    .data_combination3  (l3_martix_data3    ), 
    .data_combination4  (l3_martix_data4    ), 
    .data_combination5  (l3_martix_data5    ), 
    .data_combination6  (l3_martix_data6    ), 
    .data_combination7  (l3_martix_data7    ), 
    .data_combination8  (l3_martix_data8    ), 
    .data_combination9  (l3_martix_data9    ), 
    .data_combination10 (l3_martix_data10   ), 
    .data_combination11 (l3_martix_data11   ), 
    .data_combination12 (l3_martix_data12   ), 
    .data_combination13 (l3_martix_data13   ), 
    .data_combination14 (l3_martix_data14   ), 
    .data_combination15 (l3_martix_data15   ), 
    .data_combination16 (l3_martix_data16   ),
    .data_combination17 (l3_martix_data17   ), 
    .data_combination18 (l3_martix_data18   ), 
    .data_combination19 (l3_martix_data19   ), 
    .data_combination20 (l3_martix_data20   ), 
    .data_combination21 (l3_martix_data21   ), 
    .data_combination22 (l3_martix_data22   ), 
    .data_combination23 (l3_martix_data23   ), 
    .data_combination24 (l3_martix_data24   ), 
    .data_combination25 (l3_martix_data25   ), 
    .data_combination26 (l3_martix_data26   ), 
    .data_combination27 (l3_martix_data27   ), 
    .data_combination28 (l3_martix_data28   ), 
    .data_combination29 (l3_martix_data29   ), 
    .data_combination30 (l3_martix_data30   ), 
    .data_combination31 (l3_martix_data31   ), 
    .data_combination32 (l3_martix_data32   )
);


wire    signed [31:0]  l3_pre_relu_data1 ;
wire    signed [31:0]  l3_pre_relu_data2 ;
wire    signed [31:0]  l3_conv_bias_r   ;
reg    signed [31:0]  l3_pre_relu_data_r  ;
assign  l3_conv_bias_r   = l3_conv_bias[15] ? {{16{1'b1}},l3_conv_bias} : {{16{1'b0}},l3_conv_bias} ;

assign  l3_pre_relu_data1 = (conv_rlt1 + conv_rlt2 + conv_rlt3 + conv_rlt4 
                       + conv_rlt5 + conv_rlt6 + conv_rlt7 + conv_rlt8
                       + conv_rlt9 + conv_rlt10 + conv_rlt11 + conv_rlt12
                       + conv_rlt13 + conv_rlt14 + conv_rlt15 + conv_rlt16 );

assign  l3_pre_relu_data2 = (conv_rlt17 + conv_rlt18 + conv_rlt19 + conv_rlt20 
                       + conv_rlt21 + conv_rlt22 + conv_rlt23 + conv_rlt24
                       + conv_rlt25 + conv_rlt26 + conv_rlt27 + conv_rlt28
                       + conv_rlt29 + conv_rlt30 + conv_rlt31 + conv_rlt32 );
                                             


wire             l3_relu_vsync     ;
wire             l3_relu_href      ;
wire    [15:0]   l3_relu_data      ;
wire    [6:0]    l3_relu_h_cnt     ;
wire    [6:0]    l3_relu_v_cnt     ;

reg signed [31:0]  l3_pre_relu_data  ;

reg     [6:0]    l3_conv_h_cnt      ;
reg     [6:0]    l3_conv_v_cnt      ;
reg     [3:0]    l3_conv_href       ;
reg     [3:0]    l3_conv_vsync      ;

reg     [6:0]    conv_h_cnt_r      ;
reg     [6:0]    conv_v_cnt_r      ;


always @(posedge clk or negedge sync_rst_n)begin
    if(!sync_rst_n)begin
        l3_conv_h_cnt   <= 0 ;
        l3_conv_v_cnt   <= 0 ;
        l3_conv_href    <= 0 ;
        l3_conv_vsync   <= 0 ;

        l3_pre_relu_data_r  <= 0 ;
        l3_pre_relu_data <= 0 ;
    end
    else begin
        conv_h_cnt_r <= conv_h_cnt ;
        conv_v_cnt_r <= conv_v_cnt ;
        l3_conv_h_cnt <= conv_h_cnt_r ;
        l3_conv_v_cnt <= conv_v_cnt_r ;
        
        l3_conv_href  <= {l3_conv_href[2:0],l3_matrix_href } ;
        l3_conv_vsync <= {l3_conv_vsync[2:0],l3_matrix_vsync} ;
        
        l3_pre_relu_data_r <= (l3_pre_relu_data1 + l3_pre_relu_data2 + l3_conv_bias_r + 16384) >>>15;
        l3_pre_relu_data  <= l3_pre_relu_data_r ;
    end
end


ReLU #(
    .PRE_BIT_WIDTH(32     )
)layer3_ReLU(
    .clk   (clk            ),
    .rst_n (sync_rst_n    ),
    
    .conv_h_cnt (l3_conv_h_cnt       ),
    .conv_v_cnt (l3_conv_v_cnt       ),
    .pre_vsync  (l3_conv_vsync[3]       ),
    .pre_href   (l3_conv_href[3]        ),
    .pre_data   (l3_pre_relu_data    ),
    
    .relu_h_cnt (l3_relu_h_cnt    ),
    .relu_v_cnt (l3_relu_v_cnt    ),
    .relu_vsync (l3_relu_vsync    ),
    .relu_href  (l3_relu_href     ),
    .relu_data  (l3_relu_data     )
);

wire               l3_pool_vsync  ;
wire               l3_pool_href   ;
wire      [15:0]   l3_pool_data   ;
max_pool
#(
    .FIFO_WIDTH (16         ),
    .FIFO_DEPTH (WIDTH/8    )  
)layer3_max_pool(
    .clk    (clk            ),
    .rst_n  (sync_rst_n    ),
    
    .relu_h_cnt     (l3_relu_h_cnt   ),
    .relu_v_cnt     (l3_relu_v_cnt   ),
    .pre_vsync      (l3_relu_vsync   ),
    .pre_href       (l3_relu_href    ),
    .pre_data       (l3_relu_data    ),

    .pool_vsync     (l3_pool_vsync   ),
    .pool_href      (l3_pool_href    ),
    .pool_data      (l3_pool_data    )
);

layer3_feature_map#(
    .FM_WIDTH    (WIDTH/8   )  ,
    .FM_HEIGHT   (HEIGHT/8  )  
)u_layer3_feature_map(
    .clk     (clk         ),
    .rst_n   (sync_rst_n ),
    
    .fm_ram_wea     (1'b1           ),
    .start_output   (l3_start_output   ),
    .pre_vsync      (l3_pool_vsync     ),
    .pre_href       (l3_pool_href      ),
    .pre_data       (l3_pool_data      ),
    
    .end_output   (l3_end_output    ),
    .save_fm_acmp (l3_save_fm_acmp  ),
    .post_vsync   (l3_fm_vsync      ),
    .post_href    (l3_fm_href       ),
    .post_data    (l3_fm_data       )
);

l3_conv_w_b u_l3_conv_w_b(
    .clk      (clk          ),
    .weg_addr (l3_weg_addr  ),
    
    .conv_bias     (l3_conv_bias    ),
    .conv_weight1  (l3_conv_weight1 ),
    .conv_weight2  (l3_conv_weight2 ),
    .conv_weight3  (l3_conv_weight3 ),
    .conv_weight4  (l3_conv_weight4 ),
    .conv_weight5  (l3_conv_weight5 ),
    .conv_weight6  (l3_conv_weight6 ),
    .conv_weight7  (l3_conv_weight7 ),
    .conv_weight8  (l3_conv_weight8 ),
    .conv_weight9  (l3_conv_weight9 ),
    .conv_weight10 (l3_conv_weight10),
    .conv_weight11 (l3_conv_weight11),
    .conv_weight12 (l3_conv_weight12),
    .conv_weight13 (l3_conv_weight13),
    .conv_weight14 (l3_conv_weight14),
    .conv_weight15 (l3_conv_weight15),
    .conv_weight16 (l3_conv_weight16),
    .conv_weight17 (l3_conv_weight17),
    .conv_weight18 (l3_conv_weight18),
    .conv_weight19 (l3_conv_weight19),
    .conv_weight20 (l3_conv_weight20),
    .conv_weight21 (l3_conv_weight21),
    .conv_weight22 (l3_conv_weight22),
    .conv_weight23 (l3_conv_weight23),
    .conv_weight24 (l3_conv_weight24),
    .conv_weight25 (l3_conv_weight25),
    .conv_weight26 (l3_conv_weight26),
    .conv_weight27 (l3_conv_weight27),
    .conv_weight28 (l3_conv_weight28),
    .conv_weight29 (l3_conv_weight29),
    .conv_weight30 (l3_conv_weight30),
    .conv_weight31 (l3_conv_weight31),
    .conv_weight32 (l3_conv_weight32)
);
///////////////////////////////////////////

always @(*) begin
    if(l1_matrix_vsync)begin
        matrix_vsync = l1_matrix_vsync ;
        matrix_href  = l1_matrix_href  ;
        matrix_h_cnt = l1_matrix_h_cnt ;
        matrix_v_cnt = l1_matrix_v_cnt ; 
        matrix_data1 = l1_matrix_data  ;
        matrix_data2 = l1_matrix_data  ;
        matrix_data3 = l1_matrix_data  ;
        matrix_data4 = l1_matrix_data  ;
        matrix_data5 = l1_matrix_data  ;
        matrix_data6 = l1_matrix_data  ;
        matrix_data7 = l1_matrix_data  ;
        matrix_data8 = l1_matrix_data  ;
        matrix_data9 = l1_matrix_data  ;
        matrix_data10= l1_matrix_data  ;
        matrix_data11= l1_matrix_data  ;
        matrix_data12= l1_matrix_data  ;
        matrix_data13= l1_matrix_data  ;
        matrix_data14= l1_matrix_data  ;
        matrix_data15= l1_matrix_data  ;
        matrix_data16= l1_matrix_data  ;
        conv_bias1   = l1_conv_bias1   ;
        conv_bias2   = l1_conv_bias2   ;
        conv_bias3   = l1_conv_bias3   ;
        conv_bias4   = l1_conv_bias4   ;
        conv_bias5   = l1_conv_bias5   ;
        conv_bias6   = l1_conv_bias6   ;
        conv_bias7   = l1_conv_bias7   ;
        conv_bias8   = l1_conv_bias8   ;
        conv_bias9   = l1_conv_bias9   ;
        conv_bias10  = l1_conv_bias10  ;
        conv_bias11  = l1_conv_bias11  ;
        conv_bias12  = l1_conv_bias12  ;
        conv_bias13  = l1_conv_bias13  ;
        conv_bias14  = l1_conv_bias14  ;
        conv_bias15  = l1_conv_bias15  ;
        conv_bias16  = l1_conv_bias16  ;
        conv_weight1 = l1_conv_weight1 ;
        conv_weight2 = l1_conv_weight2 ;
        conv_weight3 = l1_conv_weight3 ;
        conv_weight4 = l1_conv_weight4 ;
        conv_weight5 = l1_conv_weight5 ;
        conv_weight6 = l1_conv_weight6 ;
        conv_weight7 = l1_conv_weight7 ;
        conv_weight8 = l1_conv_weight8 ;
        conv_weight9 = l1_conv_weight9 ;
        conv_weight10= l1_conv_weight10;
        conv_weight11= l1_conv_weight11;
        conv_weight12= l1_conv_weight12;
        conv_weight13= l1_conv_weight13;
        conv_weight14= l1_conv_weight14;
        conv_weight15= l1_conv_weight15;
        conv_weight16= l1_conv_weight16;
    end
    else if(l3_matrix_vsync)begin
        matrix_vsync = l3_matrix_vsync ;
        matrix_href  = l3_matrix_href  ;
        matrix_h_cnt = l3_matrix_h_cnt ;
        matrix_v_cnt = l3_matrix_v_cnt ; 
        matrix_data1 = l3_martix_data1 ;
        matrix_data2 = l3_martix_data2 ;
        matrix_data3 = l3_martix_data3 ;
        matrix_data4 = l3_martix_data4 ;
        matrix_data5 = l3_martix_data5 ;
        matrix_data6 = l3_martix_data6 ;
        matrix_data7 = l3_martix_data7 ;
        matrix_data8 = l3_martix_data8 ;
        matrix_data9 = l3_martix_data9 ;
        matrix_data10= l3_martix_data10;
        matrix_data11= l3_martix_data11;
        matrix_data12= l3_martix_data12;
        matrix_data13= l3_martix_data13;
        matrix_data14= l3_martix_data14;
        matrix_data15= l3_martix_data15;
        matrix_data16= l3_martix_data16;
        matrix_data17= l3_martix_data17;
        matrix_data18= l3_martix_data18;
        matrix_data19= l3_martix_data19;
        matrix_data20= l3_martix_data20;
        matrix_data21= l3_martix_data21;
        matrix_data22= l3_martix_data22;
        matrix_data23= l3_martix_data23;
        matrix_data24= l3_martix_data24;
        matrix_data25= l3_martix_data25;
        matrix_data26= l3_martix_data26;
        matrix_data27= l3_martix_data27;
        matrix_data28= l3_martix_data28;
        matrix_data29= l3_martix_data29;
        matrix_data30= l3_martix_data30;
        matrix_data31= l3_martix_data31;
        matrix_data32= l3_martix_data32;
        conv_bias1   = 0               ;
        conv_bias2   = 0               ;
        conv_bias3   = 0               ;
        conv_bias4   = 0               ;
        conv_bias5   = 0               ;
        conv_bias6   = 0               ;
        conv_bias7   = 0               ;
        conv_bias8   = 0               ;
        conv_bias9   = 0               ;
        conv_bias10  = 0               ;
        conv_bias11  = 0               ;
        conv_bias12  = 0               ;
        conv_bias13  = 0               ;
        conv_bias14  = 0               ;
        conv_bias15  = 0               ;
        conv_bias16  = 0               ;
        conv_bias17  = 0               ;
        conv_bias18  = 0               ;
        conv_bias19  = 0               ;
        conv_bias20  = 0               ;
        conv_bias21  = 0               ;
        conv_bias22  = 0               ;
        conv_bias23  = 0               ;
        conv_bias24  = 0               ;
        conv_bias25  = 0               ;
        conv_bias26  = 0               ;
        conv_bias27  = 0               ;
        conv_bias28  = 0               ;
        conv_bias29  = 0               ;
        conv_bias30  = 0               ;
        conv_bias31  = 0               ;
        conv_bias32  = 0               ;
        conv_weight1 = l3_conv_weight1 ;
        conv_weight2 = l3_conv_weight2 ;
        conv_weight3 = l3_conv_weight3 ;
        conv_weight4 = l3_conv_weight4 ;
        conv_weight5 = l3_conv_weight5 ;
        conv_weight6 = l3_conv_weight6 ;
        conv_weight7 = l3_conv_weight7 ;
        conv_weight8 = l3_conv_weight8 ;
        conv_weight9 = l3_conv_weight9 ;
        conv_weight10= l3_conv_weight10;
        conv_weight11= l3_conv_weight11;
        conv_weight12= l3_conv_weight12;
        conv_weight13= l3_conv_weight13;
        conv_weight14= l3_conv_weight14;
        conv_weight15= l3_conv_weight15;
        conv_weight16= l3_conv_weight16;
        conv_weight17= l3_conv_weight17;
        conv_weight18= l3_conv_weight18;
        conv_weight19= l3_conv_weight19;
        conv_weight20= l3_conv_weight20;
        conv_weight21= l3_conv_weight21;
        conv_weight22= l3_conv_weight22;
        conv_weight23= l3_conv_weight23;
        conv_weight24= l3_conv_weight24;
        conv_weight25= l3_conv_weight25;
        conv_weight26= l3_conv_weight26;
        conv_weight27= l3_conv_weight27;
        conv_weight28= l3_conv_weight28;
        conv_weight29= l3_conv_weight29;
        conv_weight30= l3_conv_weight30;
        conv_weight31= l3_conv_weight31;
        conv_weight32= l3_conv_weight32;
    end
    else if(l2_matrix_vsync && !l3_output_flag)begin
        matrix_vsync = l2_matrix_vsync ;
        matrix_href  = l2_matrix_href  ;
        matrix_h_cnt = l2_matrix_h_cnt ;
        matrix_v_cnt = l2_matrix_v_cnt ; 
        matrix_data1 = l2_martix_data1 ;
        matrix_data2 = l2_martix_data2 ;
        matrix_data3 = l2_martix_data3 ;
        matrix_data4 = l2_martix_data4 ;
        matrix_data5 = l2_martix_data5 ;
        matrix_data6 = l2_martix_data6 ;
        matrix_data7 = l2_martix_data7 ;
        matrix_data8 = l2_martix_data8 ;
        matrix_data9 = l2_martix_data9 ;
        matrix_data10= l2_martix_data10;
        matrix_data11= l2_martix_data11;
        matrix_data12= l2_martix_data12;
        matrix_data13= l2_martix_data13;
        matrix_data14= l2_martix_data14;
        matrix_data15= l2_martix_data15;
        matrix_data16= l2_martix_data16;
        conv_bias1   = 0               ;
        conv_bias2   = 0               ;
        conv_bias3   = 0               ;
        conv_bias4   = 0               ;
        conv_bias5   = 0               ;
        conv_bias6   = 0               ;
        conv_bias7   = 0               ;
        conv_bias8   = 0               ;
        conv_bias9   = 0               ;
        conv_bias10  = 0               ;
        conv_bias11  = 0               ;
        conv_bias12  = 0               ;
        conv_bias13  = 0               ;
        conv_bias14  = 0               ;
        conv_bias15  = 0               ;
        conv_bias16  = 0               ;
        conv_weight1 = l2_conv_weight1 ;
        conv_weight2 = l2_conv_weight2 ;
        conv_weight3 = l2_conv_weight3 ;
        conv_weight4 = l2_conv_weight4 ;
        conv_weight5 = l2_conv_weight5 ;
        conv_weight6 = l2_conv_weight6 ;
        conv_weight7 = l2_conv_weight7 ;
        conv_weight8 = l2_conv_weight8 ;
        conv_weight9 = l2_conv_weight9 ;
        conv_weight10= l2_conv_weight10;
        conv_weight11= l2_conv_weight11;
        conv_weight12= l2_conv_weight12;
        conv_weight13= l2_conv_weight13;
        conv_weight14= l2_conv_weight14;
        conv_weight15= l2_conv_weight15;
        conv_weight16= l2_conv_weight16;
    end
    else begin
        matrix_vsync = 0 ;
        matrix_href  = 0 ;
        matrix_h_cnt = 0 ;
        matrix_v_cnt = 0 ;
    end
end

endmodule