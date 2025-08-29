`timescale  1ns/1ns
module tb;

localparam image_width  = 64;
localparam image_height = 64;
//----------------------------------------------------------------------
//  clk & rst_n
reg                             clk;
reg                             rst_n;

initial
begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

initial
begin
    rst_n = 1'b0;
    repeat(50) @(posedge clk);
    rst_n = 1'b1;
end

//----------------------------------------------------------------------
//  Image data prepred to be processed
reg                             per_img_vsync;
reg                             per_img_href ;
reg             [7:0]           per_img_gray ;

//  Image data has been processed
wire                             post_img_vsync;
wire                             post_img_href ;
wire                             post_img_bit ;



//----------------------------------------------------------------------
//  task and function
task image_input;
    bit             [31:0]      row_cnt;
    bit             [31:0]      col_cnt;
    bit             [7:0]       mem     [image_width*image_height-1:0];
    $readmemh("img_Gray1.dat",mem);
    
    for(row_cnt = 0;row_cnt < image_height;row_cnt++)
    begin
        repeat(10) @(posedge clk);
        per_img_vsync <= 1'b1;
        repeat(10) @(posedge clk);
        for(col_cnt = 0;col_cnt < image_width;col_cnt++)
        begin
            per_img_href  <= 1'b1;
            per_img_gray  <= mem[row_cnt*image_width+col_cnt];
            //per_img_gray  <= image_width-col_cnt ;
            @(posedge clk);
        end
        per_img_href  <= 1'b0;
    end
    per_img_vsync <= 1'b0;
    @(posedge clk);
    
endtask : image_input


reg                             post_img_vsync_r;

always @(posedge clk)
begin
    if(rst_n == 1'b0)
        post_img_vsync_r <= 1'b0;
    else
        post_img_vsync_r <= post_img_vsync;
end

wire                            post_img_vsync_pos;
wire                            post_img_vsync_neg;

assign post_img_vsync_pos = ~post_img_vsync_r &  post_img_vsync;
assign post_img_vsync_neg =  post_img_vsync_r & ~post_img_vsync;



//----------------------------------------------------------------------
CNN_net u_CNN_net
 (
     .clk            (clk            ), 
     .async_rst_n    (rst_n          ),
     //  Image data prepared to be processed
     .pre_vsync  (per_img_vsync  ),          //  Prepared Image data vsync valid signal
     .pre_href   (per_img_href   ),          //  Prepared Image data href vaild  signal
     .pre_data   (per_img_gray   )          //  Prepared Image brightness input
    
 );

//design_1_wrapper u_design_1_wrapper(
//    .async_rst_n    (rst_n   ),
//    .clk            (clk     ),
//    .pre_data       (per_img_gray    ),
//    .pre_href       (per_img_href    ),
//    .pre_vsync      (per_img_vsync   )

//);

initial
begin
    per_img_vsync <= 0;
    per_img_href  <= 0;
    per_img_gray  <= 0;
end

initial 
begin
    wait(rst_n);
    fork
        begin 
            repeat(5) @(posedge clk); 
            image_input;
            #1000000;
            image_input;

        end 
    join
end 

endmodule