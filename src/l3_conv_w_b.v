`timescale 1ns / 1ps

module l3_conv_w_b(
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
    output  [143:0] conv_weight16 ,
    output  [143:0] conv_weight17 ,
    output  [143:0] conv_weight18 ,
    output  [143:0] conv_weight19 ,
    output  [143:0] conv_weight20 ,
    output  [143:0] conv_weight21 ,
    output  [143:0] conv_weight22 ,
    output  [143:0] conv_weight23 ,
    output  [143:0] conv_weight24 ,
    output  [143:0] conv_weight25 ,
    output  [143:0] conv_weight26 ,
    output  [143:0] conv_weight27 ,
    output  [143:0] conv_weight28 ,
    output  [143:0] conv_weight29 ,
    output  [143:0] conv_weight30 ,
    output  [143:0] conv_weight31 ,
    output  [143:0] conv_weight32 
);

 //-----------layer3 conv weights roms---------//
 layer3_conv_weight1 u_layer3_conv_weight1 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight1   )              
 );

 layer3_conv_weight2 u_layer3_conv_weight2 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight2   )              
 );

 layer3_conv_weight3 u_layer3_conv_weight3 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight3   )              
 );

 layer3_conv_weight4 u_layer3_conv_weight4 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight4   )              
 );

 layer3_conv_weight5 u_layer3_conv_weight5 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight5   )              
 );

 layer3_conv_weight6 u_layer3_conv_weight6 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight6   )              
 );

 layer3_conv_weight7 u_layer3_conv_weight7 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight7   )              
 );

 layer3_conv_weight8 u_layer3_conv_weight8 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight8   )              
 );

 layer3_conv_weight9 u_layer3_conv_weight9 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight9   )              
 );

 layer3_conv_weight10 u_layer3_conv_weight10 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight10   )              
 );

 layer3_conv_weight11 u_layer3_conv_weight11 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight11   )              
 );

 layer3_conv_weight12 u_layer3_conv_weight12 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight12   )              
 );

 layer3_conv_weight13 u_layer3_conv_weight13 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight13   )              
 );

 layer3_conv_weight14 u_layer3_conv_weight14 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight14   )              
 );

 layer3_conv_weight15 u_layer3_conv_weight15 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight15   )              
 );

 layer3_conv_weight16 u_layer3_conv_weight16 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight16   )              
 );

 layer3_conv_weight17 u_layer3_conv_weight17 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight17   )              
 );

 layer3_conv_weight18 u_layer3_conv_weight18 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight18   )              
 );

 layer3_conv_weight19 u_layer3_conv_weight19 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight19   )              
 );

 layer3_conv_weight20 u_layer3_conv_weight20 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight20   )              
 );

 layer3_conv_weight21 u_layer3_conv_weight21 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight21   )              
 );

 layer3_conv_weight22 u_layer3_conv_weight22 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight22   )              
 );

 layer3_conv_weight23 u_layer3_conv_weight23 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight23   )              
 );

 layer3_conv_weight24 u_layer3_conv_weight24 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight24   )              
 );

 layer3_conv_weight25 u_layer3_conv_weight25 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight25   )              
 );

 layer3_conv_weight26 u_layer3_conv_weight26 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight26   )              
 );

 layer3_conv_weight27 u_layer3_conv_weight27 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight27   )              
 );

 layer3_conv_weight28 u_layer3_conv_weight28 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight28   )              
 );

 layer3_conv_weight29 u_layer3_conv_weight29 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight29   )              
 );

 layer3_conv_weight30 u_layer3_conv_weight30 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight30   )              
 );

 layer3_conv_weight31 u_layer3_conv_weight31 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight31   )              
 );

 layer3_conv_weight32 u_layer3_conv_weight32 (
   .clka     (clk                    ),             
   .addra    (weg_addr            ),             
   .douta    (conv_weight32   )              
 );


 layer3_conv_bias u_layer3_conv_bias (
   .clka     (clk                   ),      
   .addra    (weg_addr           ),  
   .douta    (conv_bias      )  
 );

endmodule
