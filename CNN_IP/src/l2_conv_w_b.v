`timescale 1ns / 1ps


module l2_conv_w_b(
    input           clk      ,
    input   [5:0]   weg_addr ,
    
    output  signed [15:0]   conv_bias,
    
    output  [143:0] conv_weight1  ,
    output  [143:0] conv_weight2  ,
    output  [143:0] conv_weight3  ,
    output  [143:0] conv_weight4  ,
    output  [143:0] conv_weight5  ,
    output  [143:0] conv_weight6  ,
    output  [143:0] conv_weight7  ,
    output  [143:0] conv_weight8  ,
    output  [143:0] conv_weight9  ,
    output  [143:0] conv_weight10 ,
    output  [143:0] conv_weight11 ,
    output  [143:0] conv_weight12 ,
    output  [143:0] conv_weight13 ,
    output  [143:0] conv_weight14 ,
    output  [143:0] conv_weight15 ,
    output  [143:0] conv_weight16 
);
    

// //----------input channel conv weights roms----------------//
layer2_conv_weight1 u_layer2_conv_weight1 (
  .clka     (clk               ),     
  .addra    (weg_addr       ),     
  .douta    (conv_weight1   )       
);

layer2_conv_weight2 u_layer2_conv_weight2 (
  .clka     (clk               ),     
  .addra    (weg_addr       ),     
  .douta    (conv_weight2   )       
);

layer2_conv_weight3 u_layer2_conv_weight3 (
  .clka     (clk               ),     
  .addra    (weg_addr       ),     
  .douta    (conv_weight3   )       
);

layer2_conv_weight4 u_layer2_conv_weight4 (
  .clka     (clk               ),     
  .addra    (weg_addr       ),     
  .douta    (conv_weight4   )       
);

layer2_conv_weight5 u_layer2_conv_weight5 (
  .clka     (clk               ),     
  .addra    (weg_addr       ),     
  .douta    (conv_weight5   )       
);

layer2_conv_weight6 u_layer2_conv_weight6 (
  .clka     (clk               ),     
  .addra    (weg_addr       ),     
  .douta    (conv_weight6   )       
);

layer2_conv_weight7 u_layer2_conv_weight7 (
  .clka     (clk               ),     
  .addra    (weg_addr       ),     
  .douta    (conv_weight7   )       
);

layer2_conv_weight8 u_layer2_conv_weight8 (
  .clka     (clk               ),     
  .addra    (weg_addr       ),     
  .douta    (conv_weight8   )       
);

layer2_conv_weight9 u_layer2_conv_weight9 (
  .clka     (clk               ),     
  .addra    (weg_addr       ),     
  .douta    (conv_weight9   )       
);

layer2_conv_weight10 u_layer2_conv_weight10 (
  .clka     (clk               ),     
  .addra    (weg_addr       ),     
  .douta    (conv_weight10   )       
);

layer2_conv_weight11 u_layer2_conv_weight11 (
  .clka     (clk               ),     
  .addra    (weg_addr       ),     
  .douta    (conv_weight11   )       
);

layer2_conv_weight12 u_layer2_conv_weight12 (
  .clka     (clk               ),     
  .addra    (weg_addr       ),     
  .douta    (conv_weight12   )       
);

layer2_conv_weight13 u_layer2_conv_weight13 (
  .clka     (clk               ),     
  .addra    (weg_addr       ),     
  .douta    (conv_weight13   )       
);

layer2_conv_weight14 u_layer2_conv_weight14 (
  .clka     (clk               ),     
  .addra    (weg_addr       ),     
  .douta    (conv_weight14   )       
);

layer2_conv_weight15 u_layer2_conv_weight15 (
  .clka     (clk               ),     
  .addra    (weg_addr       ),     
  .douta    (conv_weight15   )       
);

layer2_conv_weight16 u_layer2_conv_weight16 (
  .clka     (clk               ),     
  .addra    (weg_addr       ),     
  .douta    (conv_weight16   )       
);

layer2_conv_bias u_layer2_conv_bias (
  .clka     (clk               ),     
  .addra    (weg_addr       ),     
  .douta    (conv_bias      )       
);

endmodule
