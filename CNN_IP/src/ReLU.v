`timescale 1ns / 1ps


module ReLU#(
    parameter   PRE_BIT_WIDTH  = 'd32
)(
    input clk   ,
    input rst_n ,
    
    input   [6:0]   conv_h_cnt ,
    input   [6:0]   conv_v_cnt ,
    
    input                               pre_vsync ,
    input                               pre_href  ,
    input   signed [PRE_BIT_WIDTH-1:0]  pre_data  ,
   
    output  reg   [6:0]   relu_h_cnt ,
    output  reg   [6:0]   relu_v_cnt ,
    
    output   reg           relu_vsync ,
    output   reg           relu_href  ,
    output   reg [15:0]    relu_data  
);

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        relu_vsync <= 0 ;
        relu_href  <= 0 ;
        relu_h_cnt <= 0 ;
        relu_v_cnt <= 0 ;
    end
    else begin
        relu_vsync <= pre_vsync ;
        relu_href  <= pre_href  ;
        relu_h_cnt <= conv_h_cnt ;
        relu_v_cnt <= conv_v_cnt ;
    end
end


always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        relu_data <= 0 ;
    else if(!pre_data[PRE_BIT_WIDTH-1]) begin
        if(pre_data < 16'h8000)begin
            relu_data <= pre_data ;
        end
        else 
            relu_data <= 16'h7fff ;
    end    
    else
        relu_data <= 0 ;
end

endmodule
