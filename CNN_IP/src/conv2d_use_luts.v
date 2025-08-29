`timescale 1ns / 1ps

module conv2d_use_luts#(
    parameter   CONV_WIDTH      = 'd8 ,
    parameter   CONV_HEIGHT     = 'd8 
)(
    input clk   ,
    input rst_n ,
    
    input                matrix_vsync ,
    input                matrix_href  ,
    
    //counter
    input        [6:0]   matrix_h_cnt       ,
    input        [6:0]   matrix_v_cnt       ,
    
    //convolution parameters
    input signed [15:0]   conv_bias   ,
    input        [143:0]  fm_data     ,
    input        [143:0]  conv_weight ,
    
    //video control signal
    output reg        [6:0]  conv_h_cnt ,
    output reg        [6:0]  conv_v_cnt ,
    output reg               conv_href  ,
    output reg               conv_vsync ,
    output reg signed [31:0] conv_result 
);

wire    signed  [31:00] mult_result11 ;
wire    signed  [31:00] mult_result12 ;
wire    signed  [31:00] mult_result13 ;
wire    signed  [31:00] mult_result21 ;
wire    signed  [31:00] mult_result22 ;
wire    signed  [31:00] mult_result23 ;
wire    signed  [31:00] mult_result31 ;
wire    signed  [31:00] mult_result32 ;
wire    signed  [31:00] mult_result33 ;

reg                     matrix_vsync_r;
reg                     matrix_href_r ;
reg        [6:0]        conv_h_cnt_r  ;
reg        [6:0]        conv_v_cnt_r  ; 


//delay two clock cycle
always @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        matrix_vsync_r <= 0 ;
        matrix_href_r  <= 0 ;
        conv_href      <= 0 ;
        conv_vsync     <= 0 ;
        conv_h_cnt_r   <= 0 ;
        conv_v_cnt_r   <= 0 ;
        conv_h_cnt     <= 0 ;
        conv_v_cnt     <= 0 ;
    end
    else begin
        matrix_vsync_r <= matrix_vsync   ;
        matrix_href_r  <= matrix_href    ;
        conv_href      <= matrix_href_r  ;
        conv_vsync     <= matrix_vsync_r ;
        conv_h_cnt_r   <= matrix_h_cnt   ;
        conv_v_cnt_r   <= matrix_v_cnt   ;
        conv_h_cnt     <= conv_h_cnt_r   ;
        conv_v_cnt     <= conv_v_cnt_r   ; 
    end
end


always @(posedge clk or negedge rst_n)begin
    if(!rst_n)
        conv_result <= 0 ;
    else
        conv_result <= mult_result11 + mult_result12 + mult_result13
                     + mult_result21 + mult_result22 + mult_result23
                     + mult_result31 + mult_result32 + mult_result33 + conv_bias ;
end

mult_luts mult11 (
  .CLK      (clk                  ),     
  .A        (conv_weight[143:128] ),     
  .B        (fm_data[143:128]     ),      
  .P        (mult_result11        )      
);


mult_luts mult12 (
  .CLK      (clk                  ),     
  .A        (conv_weight[127:112] ),     
  .B        (fm_data[127:112]     ),      
  .P        (mult_result12        )      
);

mult_luts mult13 (
  .CLK      (clk                  ),     
  .A        (conv_weight[111:96]  ),     
  .B        (fm_data[111:96]      ),      
  .P        (mult_result13        )      
);


mult_luts mult21 (
  .CLK      (clk                  ),     
  .A        (conv_weight[95:80]   ),      
  .B        (fm_data[95:80]       ),      
  .P        (mult_result21        )      
);

mult_luts mult22 (
  .CLK      (clk                  ),     
  .A        (conv_weight[79:64]   ),      
  .B        (fm_data[79:64]       ),      
  .P        (mult_result22        )      
);


mult_luts mult23 (
  .CLK      (clk                  ),     
  .A        (conv_weight[63:48]   ),      
  .B        (fm_data[63:48]       ),      
  .P        (mult_result23        )      
);

mult_luts mult31 (
  .CLK      (clk                  ),     
  .A        (conv_weight[47:32]   ),     
  .B        (fm_data[47:32]       ),      
  .P        (mult_result31        )      
);


mult_luts mult32 (
  .CLK      (clk                  ),     
  .A        (conv_weight[31:16]   ),     
  .B        (fm_data[31:16]       ),      
  .P        (mult_result32        )      
);

mult_luts mult33 (
  .CLK      (clk                  ),     
  .A        (conv_weight[15:0]    ),     
  .B        (fm_data[15:0]        ),      
  .P        (mult_result33        )      
);
endmodule
